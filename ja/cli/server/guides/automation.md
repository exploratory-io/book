---
title: "自動処理"
---

人がブラウザでサインインしなくても、API キーを使って、スクリプトや CI で expl server を実行します。

<a id="token"></a>

## API キーを作る

CI は、変更のたびに自動で処理を流す仕組みです。人がブラウザでサインインできないので、API キーを渡します。作り方は、[API キー](/ja/cli/server/token#create)のページにあります。

作ったキーは、CI のシークレット（値を隠して保管する機能）に登録します。スクリプトには書かず、画面やログにも出さないでください。キーには有効期限があります。それまでに新しいキーを作って、シークレットを入れ替えます。

キーの作り方と安全な扱い方は、[API キー](/ja/cli/server/token)を参照してください。

<a id="pass"></a>

## キーを渡す

キーは、環境変数 EXPL_SERVER_TOKEN で渡します。保存したログイン情報との順は、[サインイン](/ja/cli/server/login#apikey)を参照してください。接続先を変えるときは、EXPL_SERVER_URL を設定します。

<a id="run"></a>

## 実行例: GitHub Actions

GitHub Actions の例です。\<id\> は、読みたいコンテンツの id に置き換えます。

```text
- uses: actions/setup-node@v4
  with:
    node-version: 22
- run: npx -y @exploratory/cli server fetch <id> --json
  env:
    EXPL_SERVER_TOKEN: ${{ secrets.EXPL_SERVER_TOKEN }}
    EXPL_SERVER_URL: https://exploratory.io
```

<a id="exit"></a>

## 終了コード

スクリプトでは、終了コードによって成功か失敗かを判断できます。CI で特に多いのは、次の 2 つです。

| コード | 意味 | 対処 |
| --- | --- | --- |
| 3 | サーバーに接続できません（ネットワーク、HTML のエラーページなど） | 通信を確認して、もう一度実行します。 |
| 4 | サインインしていないか、API キーが拒否されました | キーが正しいか、期限切れや取り消しになっていないかを確認します。 |

すべての終了コードは、[終了コードとエラー](/ja/cli/server/exit-codes)で説明しています。

<a id="revoke"></a>

## API キーを取り消す

漏れたキーや使わなくなったキーは、[API キー](/ja/cli/server/token#revoke)の手順で取り消します。

取り消した、または期限切れのキーでの呼び出しは、終了コード 4 で終了します。
