const template = `
開始時期から終了時期までの生存期間と生存状態からカプラン・マイヤー法を利用した生存曲線を作成しました。

# 生存曲線のサマリ

{{summary_chart}}

## 生存曲線の詳細

* 行数
  * 行数は分析に使用した観察対象（データ）の総数（サンプルサイズ）です。
  
* 行数 (TRUE)
  * イベントが発生した観察対象（データ）の行数を示します。

# 生存曲線

生存期間ごとの生存率（イベントが発生していない割合）を示したのが以下のチャートです。縦軸は生存率（％）、横軸は生存期間を表します。

曲線が急な部分はイベントが多く発生していることを表し、曲線が緩やかな部分はイベントの発生が少ないことを表します。

{{survival_curve}}

# 生存率表

各期間における生存率を表にまとめたものが以下となります。横軸は開始時点からの経過期間を表し、各値はその時点における生存率（イベントが発生していない割合）です。

{{survival_table}}

# 次のステップ

* 今回はデータ全体の生存曲線を作成しました。しかし、他の変数も生存曲線に影響している可能性があります。そのため、「色で分割」に変数を選択することで、生存曲線に影響を与える要因を分析できます。

# 補足情報

## データ

このデータは生存曲線に関する数値情報です。各期間における観察対象数、イベント発生数、生存率とその信頼区間を示しています。

{start_lazy_show_hide}
### チャート
{{data}}

打ち切りとは、観測期間中にイベント発生が確認できない対象を、生存率計算で特別に扱うことです。このデータは完全に除外せず、観測された期間までの情報を活用し、それ以降は計算から外します。

例えば、月額サブスクリプションで1ヶ月未満のユーザーは、キャンセルするかどうか未確定のため「打ち切りデータ」として処理します。

{end_lazy_show_hide}
`;
module.exports = template;