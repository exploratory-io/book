# コマンドを調べる

サーバーが提供しているコマンドと、そのフラグを調べます。

<a id="list"></a>

## 一覧を表示する

```sh
expl server tools list
```

コマンドの一覧は、そのつどサーバーから取得します。サーバーに新しい操作が増えても、expl の新しいバージョンは要りません。サーバーに接続できないときや、サインインしていないときは、前回保存した一覧を表示します。保存がないときは、空の一覧になります。

tools list が終了コード 0 で終わっても、接続できているとは限りません。接続は、expl server status で確認します。

<a id="describe"></a>

## 1 つのコマンドを調べる

```sh
expl server tools describe <command>
```

\<command\> は、一覧に出たコマンドの名前に置き換えます。2 語のコマンドは、`expl server tools describe "chart get-data"` のように引用符で囲みます。`chart_get_data` のようなツール名でも指定できます。

コマンドの説明と、使えるフラグが表示されます。コマンド名を推測せず、ここで確認してください。

<a id="form"></a>

## コマンドの形

search と fetch には、動詞を付けません。expl server search \<query\>、expl server fetch \<id\> の形で使用します。ほかのコマンドは、expl server dataset query のように、名詞と動詞を続けます。

それぞれのコマンドには、その裏にあるツールの名前があります。MCP クライアントから見える名前です。expl server call \<tool_name\> は、その名前でコマンドを実行します。例: expl server call dataframe_preview \<id\>

目的別に全コマンドを探すには、[コマンド一覧](commands_ja.md)を参照してください。
