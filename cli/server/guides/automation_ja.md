# 自動処理

人がブラウザでサインインしなくても、API キーを使って、スクリプトや CI で expl server を実行します。

<a id="token"></a>

## API キーを作る

CI は、変更のたびに自動で処理を流す仕組みです。人がブラウザでサインインできないので、API キー（あなたとして Exploratory を読むための文字列）を渡します。アカウント設定 \> API キーで作成します。ci-nightly のように、どこで使うかわかる名前と、有効期限（既定は 30 日）を選びます。キーが表示されるのは 1 回だけです。

作ったキーは、CI のシークレット（値を隠して保管する機能）に登録します。スクリプトには書かず、画面やログにも出さないでください。キーには有効期限があります。それまでに新しいキーを作って、シークレットを入れ替えます。

- [API キー](../token_ja.md) - キーの作り方と、安全な扱い方です。

<a id="pass"></a>

## キーを渡す

キーは、環境変数 EXPL_SERVER_TOKEN で渡します。マシンに保存したログイン情報より先に使われます。--token は削除されました。接続先を変えるときは、EXPL_SERVER_URL を設定します。

<a id="run"></a>

## 実行例

GitHub Actions の例です。\<id\> は、読みたいコンテンツの id に置き換えます。\<version\> は、使うバージョン番号に置き換え、必ず固定します。

```text
- uses: actions/setup-node@v4
  with:
    node-version: 22
- run: npx @exploratory/cli@<version> server fetch <id> --json
  env:
    EXPL_SERVER_TOKEN: ${{ secrets.EXPL_SERVER_TOKEN }}
    EXPL_SERVER_URL: https://exploratory.io
```

ファイル全体の例は、expl のリポジトリの examples フォルダにあります（GitHub Actions と Bitbucket Pipelines）。

<a id="exit"></a>

## 終了コード

スクリプトでは、終了コードによって成功か失敗かを判断できます。CI で特に多いのは、次の 2 つです。

| コード | 意味 | 対処 |
| --- | --- | --- |
| 3 | サーバーに接続できません（ネットワーク、HTML のエラーページなど） | 通信を確認して、もう一度実行します。 |
| 4 | サインインしていないか、API キーが拒否されました | キーが正しいか、期限切れや取り消しになっていないかを確認します。 |

- [終了コード](../exit-codes_ja.md) - すべての終了コードを説明しています。

<a id="revoke"></a>

## 失効させる

キーが漏れたときや、使わなくなったときは、取り消します。アカウント設定 \> API キーで「取り消し」を選びます。ブラウザでサインインしたあとは、expl server token revoke \<name\> でも取り消せます。

取り消した、または期限切れのキーでの呼び出しは、終了コード 4 で終了します。
