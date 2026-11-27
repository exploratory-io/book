---
title: "制限とエラー"
---

できないこと、数値の読み方、数や大きさの上限、エラーの対処をまとめます。

<a id="cannot"></a>

## できないこと

- 自分またはチームのページ以外のコンテンツの作成、編集、公開、削除
- 公開時と違うパラメータの値での、チャートやアナリティクスの再計算
- Exploratory Server に公開されていないものの読み取り。Exploratory Desktop の中だけにあるプロジェクトなどです。これらには、別の Desktop MCP を使います。

<a id="numbers"></a>

## 数値と計算の条件

- 数値は、公開されたときの値です。
- チャート単体で公開したものは、描画に使った行のサンプル（最大 1 万行）を返します。集計した値ではないので、合算して合計として扱わないでください。
- ブラウザで閲覧者がパラメータを変えた結果は、MCP からは取得できません。
- チャートとアナリティクスの結果には、集計方法、チャートのフィルタ、context.parameters、context.data_as_of が含まれます。
- query_dataset は、dataset.version と dataset.updated_at を返します。

<a id="limits"></a>

## 数や大きさの上限

| 項目 | 上限 |
| --- | --- |
| query_dataset: rows | 最大 1,000 行（columns の指定が必要） |
| query_dataset: aggregate | 最大 500 行 |
| dataframe_preview、chart_get_data | 1 回に 100 行まで |
| query_dataset: queries | 1 回に 5 件まで |
| chart_query: queries | 1 回に 10 件まで（既定値です。オンプレミス環境では変更できます） |
| 結合するデータ | 2〜5 件 |
| 集計項目の alias | 半角の英字か _ で始め、半角の英数字と _ だけ。日本語は不可 |
| 結合で使うデータの alias | 小文字で 16 文字まで |
| dataframe_export | リンクの有効期間は 15 分。1 ユーザーが同時に実行できる書き出しは 1 つ。1 時間あたりの回数にも上限があります |
| チャート単体で公開したもの | チャート全体の値ではなく、描画に使った行のサンプル（最大 1 万行）。1 回に 100 行ずつ返します |

<a id="errors"></a>

## エラーの一覧と対処

失敗した道具は、isError: true の結果を返します。本文は、error_code と message を持つ JSON で、場合により url と details も持ちます。引数の誤りでは、details.field がその引数を示します。

| error_code | 対処 |
| --- | --- |
| NOT_FOUND | コンテンツが存在しないか、閲覧する権限がありません。対象の URL をブラウザで開き、同じアカウントで閲覧できるか確認します。閲覧できないときは、所有者に共有設定の確認を頼みます |
| CHANNEL_DISABLED | 公開した人がこのコンテンツの MCP アクセスを止めています。公開した人に、コンテンツの MCP アクセスの設定の確認を頼みます |
| DATA_EGRESS_LIMIT | 公開した人がこのデータの行を共有していません。チャート・アナリティクス・要約を使います |
| PERSONALIZED_CONTENT | 閲覧者ごとに違うデータを表示するコンテンツです。URL をブラウザで開いてください |
| CONTENT_UPDATING | 再公開の途中です。数秒後にもう一度試してください |
| UNSUPPORTED_OPERATION | この方法では読めないコンテンツです（問い合わせできるデータソースがないデータなど）。そのコンテンツで使える操作を確認し、チャートや要約など、使える形での取得を AI に頼みます |
| INVALID_PARAMETER | details.field が示す引数を直します |
| RESULT_TOO_LARGE | 結果が大きすぎます。絞り込むか、列を減らすか、集計します |
| SERVER_BUSY | サーバーが混み合っているか、自分の別の書き出しが実行中か、1 時間あたりの書き出しの上限に達しています。下の説明を参照してください |

SERVER_BUSY のとき:

- 数秒おいて再度呼び出します。
- 2 回続いたら、繰り返さずに時間をおきます。
- 書き出しの上限の場合は、最大 1 時間待ちます。

query_dataset と chart_query は、問い合わせの誤りを別の形で返します。error.code、error.message、error.field、error.retryable を持ち、独自のコードを使います。chart_query には CHART_NOT_FOUND、CHART_DATA_UNAVAILABLE（理由は error.reason の no_data、too_large、updating）、CHART_UNPIVOT_UNAVAILABLE もあります。例:

- DATASET_NOT_FOUND
- ACCESS_DENIED
- CHANNEL_DISABLED
- DATASET_ACCESS_DENIED（結合時）
- DATASET_NOT_QUERYABLE
- INVALID_COLUMN
- INVALID_FILTER
- AMBIGUOUS_COLUMN
- JOIN_TYPE_MISMATCH
- QUERY_LIMIT_EXCEEDED
- QUERY_TIMEOUT

問い合わせが混み合っているときは、RATE_LIMIT_EXCEEDED か QUERY_ENGINE_UNAVAILABLE が返るので、数秒おいて再度呼び出します。result.has_more が true なら、絞り込むか、集計するか、dataframe_export を使います。

ページの道具も、同じ error.code の形式で返します。主なコードは次のとおりです。

- PAGES_NOT_ALLOWED: このサーバーでページが使えないか、プランでページを公開・変更できません
- MAX_NUM_OF_PAGES_EXCEEDED: プランのページ数の上限です。ページを削除するか、プランを変えます
- MAX_STORAGE_SIZE_EXCEEDED: プランの保存容量が足りません
- PAGE_HTML_REJECTED: HTML が get_page_guide の規則に合いません。error.message が示す箇所を直します

page_publish、page_update、page_delete を page:write のない接続で呼ぶと、error_code の INSUFFICIENT_SCOPE が返ります。ブラウザでのサインインなら、接続を外してつなぎ直します。API キーではページを書けません。

dataframe_export は、ほかの道具と同じ error_code の形式です。問い合わせの誤りは INVALID_PARAMETER で返り、元のコードは details.code に含まれます。

<a id="rate"></a>

## 回数の上限

1 人の利用者が 1 分間に 120 回を超えて要求すると、HTTP 429 と RATE_LIMITED が返ります。1 分待ってください。

同じアドレスから（IPv4 は同じアドレス、IPv6 は同じ /64 の範囲で数えます）、15 分のうちに 30 回を超えて、拒否された API キーが送られると、「Too many failed API key attempts. Try again later.」というメッセージつきの HTTP 429 になります。有効なキーは数えません。キーを直して、しばらくしてからやり直します。
