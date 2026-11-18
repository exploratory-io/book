---
title: "Troubleshooting"
---

Find a fix by symptom.

<a id="first"></a>

## Check the state first

Run expl server status. Exit code 0 from expl server tools list does not mean that the connection works (see [Inspect commands](/en/cli/server/commands#inspect-list)). To see what is sent and received, add `--verbose`; it prints to standard error. Tokens are never printed, but review the output before you paste it anywhere.

<a id="contact"></a>

## When you contact support

Send these to support@exploratory.io: the output of `expl --version`, the command you ran, the exit code and the message. Hide any token or API key.

<a id="company"></a>

## When you cannot connect from a company network

Ask your IT administrator to allow communication with exploratory.io. For an on-premises server, ask them to allow the URL of your own server.

<a id="install"></a>

## The command is not found

| What you see | What to do |
| --- | --- |
| expl: command not found | Open a new terminal and run it again. The expl that comes with Desktop is added to your PATH when the app starts. |
| npm install -g stops with EEXIST | Do not run it again with `--force`: that replaces the expl that comes with Desktop. |
| You do not know which expl runs | Run which -a expl (where expl on Windows) to see every copy. |

For how to check when two copies are installed, see [Installation](/en/cli/server/install).

<a id="signin"></a>

## Sign-in

| What you see | What to do |
| --- | --- |
| `Run "expl server login".` | You are not signed in, or the saved login was rejected. Run expl server login. |
| The API key is invalid or expired. Create a new one in Account Settings \> API Keys. (UNAUTHORIZED) | The key is wrong, expired or revoked. Create a new API key, then set EXPL_SERVER_TOKEN or run `expl server login --with-token`. Exit code 4. |
| API keys are disabled by your administrator. / This IP address is not allowed for API keys. | An administrator turned API keys off or limits them to certain IP addresses. Ask your administrator, or sign in with expl server login. Exit code 4. |
| `--token` was removed. … | Set EXPL_SERVER_TOKEN, or run `expl server login --with-token`. Exit code 2. |
| Too many failed API key attempts. Try again later. | Many refused keys came from this address in a short time. Fix the key and try again later. |
| The redirect URL has no authorization code. | With `--no-browser`, you pasted the first URL. Paste the redirect URL that starts with http://127.0.0.1/callback?code= instead. |
| Exit code 4 (Desktop) | See the code at the end of the message in [Exit codes and errors](/en/cli/server/exit-codes#action): NOT_SIGNED_IN, UNAUTHORIZED, PAIRING_REQUIRED, CHANNEL_DISABLED or PERMISSION_DENIED. |

To switch to a saved login while EXPL_SERVER_TOKEN is set, run unset EXPL_SERVER_TOKEN first, because it is used before a saved login.

For how to create, pass and revoke an API key, see [API keys](/en/cli/server/token).

<a id="network"></a>

## Connection

| What you see | What to do |
| --- | --- |
| Exit code 3 (Server) | The server cannot be reached. Check the network and run it again. |
| Exit code 3 (Desktop) | Start Exploratory Desktop and run it again. |
| A message names a tool, such as chart_query | Run expl server tools describe \<tool_name\> to see the command for that tool. |
| Odd results | Add `--verbose` to see what is sent and received. Review the output before you paste it anywhere. |

<a id="limits"></a>

## Limits

| What you see | What to do |
| --- | --- |
| Too big: expected number to be \<=50 at limit | Set `--limit` of search to 50 or less. |
| has_more is true and not everything came back | For search and dataframe preview, get the next page with `--offset`. For dataset query, narrow the query or aggregate. |
| SERVER_BUSY | Another export is running, or you reached the hourly export limit. Try again in a few seconds; for the hourly limit, wait up to an hour. |

The server that returns these errors is the same one that MCP Server uses. For the other errors it returns (NOT_FOUND, PERSONALIZED_CONTENT, CONTENT_UPDATING, UNSUPPORTED_OPERATION, RESULT_TOO_LARGE) and the limit on the number of requests per minute (120), see [Limits and errors](/en/mcp/server/limits#errors) of MCP Server.

<a id="data"></a>

## Data that cannot be queried

| What you see | What to do |
| --- | --- |
| DATASET_UNAVAILABLE | The publisher needs to republish it from the latest version of Exploratory Desktop. |
| DATA_EGRESS_LIMIT | The publisher does not allow downloading this data as a file. Use fetch or dataframe get-schema for what the publisher shares. |
| Unknown property "by" in a sort entry. (INVALID_SORT) | In sort, name the output column with field. |

For how to write the JSON arguments, see [Query data](/en/cli/server/guides/query-data#json).
