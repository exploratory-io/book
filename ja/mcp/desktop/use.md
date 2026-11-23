---
title: "使い方"
---

Desktop の MCP で、手元のプロジェクトについて AI に頼めることです。どれも、Exploratory Desktop にプロジェクトを開いて、AI ツールに話しかけます。インストールがまだのときは、先に[プラグインのインストール](/ja/mcp/desktop/install)を済ませます。

| やりたいこと | 節 | AI が使う主な道具 |
| --- | --- | --- |
| データを取り込む | [データを取り込む・加工する](#import) | create_data_source、save_connection |
| データを加工する | [データを取り込む・加工する](#import) | create_wrangling_step |
| 列や件数を見る | [そのほか](#other) | preview_data_frame、profile_data_frame |
| チャートを作る | [チャートを作る](#charts) | create_chart、update_chart |
| アナリティクスを作る | [アナリティクスを作る](#analytics) | create_analytics |
| ノートを書く | [ノートを書く](#notes) | create_note、update_note |
| ダッシュボードを作る・複製する | [ダッシュボードを作る・複製する](#dashboards) | create_dashboard、get_dashboard、validate_dashboard |
| 公開する | [公開する](#publish) | publish_note、publish_dashboard |
| 値を選ぶフィルターを付ける | [そのほか](#other) | save_parameter |

各道具の働きと「作成、変更、削除を許可する」が必要なものは[使える道具](/ja/mcp/desktop/tools)を参照してください。ターミナルから同じことをするときは、CLI Desktop の[使い方](/ja/cli/desktop/use)を参照してください。

出力されるチャートや文章は、データと AI ツールによって変わります。例の依頼文は、そのまま使うことも、自分のデータに合わせて言い換えることもできます。

<a id="before"></a>

## 始める前に

MCP のスイッチと「作成、変更、削除を許可する」の設定は、[はじめる](/ja/mcp/desktop/get-started#steps)の手順 2 で行います。削除、公開、R コードの実行などの前の確認は、[許可の範囲と設定](/ja/mcp/desktop/permissions)を参照してください。以降の例の「確認を出します」は、確認なしで実行する設定がオフのときの動きです。

<a id="server-or-desktop"></a>

## Server と Desktop の使い分け

Desktop は手元のプロジェクトを対象にします。exploratory.io に公開した内容は、[Server の MCP](/ja/mcp/server) で読みます。どちらか決まらない依頼では、プラグインのスキルが先に確かめます。たとえば、exploratory.io のデータから図を作る依頼では、「Exploratory Desktop で作りますか」と聞かれることがあります。最初から「Exploratory Desktop で」と伝えると、聞かれずに進みます。

<a id="examples"></a>

<a id="import"></a>

## データを取り込む・加工する

```text
このファイルを取り込んで
```

ファイルやデータベースからデータを取り込み、データソースや接続を作ります（create_data_source、save_connection）。接続の保存の前には、Desktop が確認を出します。

```text
注文日から月の列を作って、地域ごとに売上を集計して
```

列を作る、絞る、集計する、結合するといったデータ加工を、加工のステップとして追加します（create_wrangling_step）。ステップは、Exploratory Desktop の右側のステップの一覧に並びます。

```text
自由記述の口コミを、内容ごとに分類する列を作って
```

文章の意味を読んで分類する処理は、AI 関数の列として作ります。決まった規則で変換する処理とは、別のものです。実行の前に、Desktop が確認を出します。

<a id="charts"></a>

## チャートを作る

```text
開いている Exploratory のプロジェクトで、売上データから月別の棒グラフを作って
```

```text
この図を散布図に変えて
```

チャートの作成と変更です（create_chart、update_chart）。作ったチャートは、Exploratory Desktop で開いて確認できます。

<a id="analytics"></a>

## アナリティクスを作る

```text
売上に効く要因を回帰で調べて
```

```text
顧客をクラスタに分けて
```

回帰、検定、クラスタリングなどのアナリティクスを作ります（create_analytics）。結果は、Exploratory Desktop のアナリティクスとして開けます。

<a id="notes"></a>

## ノートを書く

```text
分析結果をノートにまとめて
```

ノートを書き、保存し、チャートを埋め込みます（create_note、update_note）。作ったノートは、Exploratory Desktop で開いて確認できます。

<a id="dashboards"></a>

## ダッシュボードを作る・複製する

```text
売上のチャートを並べたダッシュボードを作って
```

ページ、行、パネルを並べたダッシュボードを作ります（create_dashboard）。保存の前に、レイアウトを検査できます（validate_dashboard）。

```text
「Sales Orders Dashboard」を複製して、タイトルだけ変えて
```

元のダッシュボードの定義を読み（get_dashboard）、タイトルを変えて新しいダッシュボードとして作ります（create_dashboard）。

<a id="publish"></a>

## 公開する

```text
このノートとダッシュボードを公開して
```

ノートやダッシュボードを、公開 URL でサーバーに公開します（publish_note、publish_dashboard）。公開を取り消すこともできます（unpublish）。公開や取り消しの前には、Desktop が確認を出します。

<a id="other"></a>

## そのほか

```text
開いているプロジェクトの売上データには、どんな列がある？ 地域ごとの件数も教えて
```

列の名前、値の一覧、件数を、データフレームから読みます（データフレームのプレビューやプロファイルの道具）。

```text
期間を選べるフィルターを付けたい
```

パラメーターを作り、値の一覧を決めて、フィルターやチャートに適用します（save_parameter など）。

<a id="next"></a>

## あわせて読む

- [使える道具](/ja/mcp/desktop/tools) - 目的ごとの、AI にできることです。
- [許可の範囲と設定](/ja/mcp/desktop/permissions) - 確認が出る場面と、プラグインの設定です。
