options(neo4j.root = "/Users/yasudayousuke/Documents/Neo4j/llis_display")
options(neo4j.url = "http://localhost:7474/db/data")
options(neo4j.username = "")
options(neo4j.password = "")

upload_neo4j <- function(data,
                         pre_queries = c(),
                         query,
                         clear = FALSE){
  loadNamespace("RNeo4j")
  loadNamespace("stringr")

  db_name <- getOption("neo4j.url")
  if (is.null(db_name)) {
    stop("please set database location as \"neo4j.url\" in option")
  }

  neo4j_root <- getOption("neo4j.root")
  if (is.null(neo4j_root)) {
    stop("please set database location as \"neo4j.root\" in option")
  }

  username <- getOption("neo4j.username")
  if (is.null(username)) {
    # empty username
    username = c()
  }
  password <- getOption("neo4j.password")
  if (is.null(password)) {
    # empty password
    password = c()
  }

  server_import_path <- file.path(neo4j_root, "import")
  filename <- "upload_from_exploratory.csv"
  csv_file_path <- file.path(server_import_path, filename)
  write_csv(data, csv_file_path)

  graph = RNeo4j::startGraph(db_name, username, password)
  if(clear){
    RNeo4j::clear(graph, input = FALSE)
  }
  for (pre_query in pre_queries){
    tx <- RNeo4j::newTransaction(graph)
    RNeo4j::appendCypher(tx, pre_query)
    RNeo4j::commit(tx)
  }

  tx <- RNeo4j::newTransaction(graph)

  initial_query <- stringr::str_c(
    "
    LOAD CSV WITH HEADERS
    FROM 'file:/", filename, "' AS data\nWITH data\n", query, sep = "")

  RNeo4j::appendCypher(tx, initial_query)

  RNeo4j::commit(tx)

  unlink(csv_file_path)

  data
}
