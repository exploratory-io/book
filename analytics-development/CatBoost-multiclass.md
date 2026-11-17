const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { byCategory: {} }; %>
<% const metrics = typeof multiclass_metrics !== 'undefined' ? multiclass_metrics : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# サマリ

選択した説明変数から、複数カテゴリ型の目的変数 **<%= target %>** を予測するCatBoostのモデルを作成しました。

## データとモデルの基本情報

{{basic_info}}

## 目的変数の分布

{{target_distribution}}

カテゴリごとの件数と割合を表示します。テストモードでは、トレーニングデータとテストデータに分けて表示します。



# 予測に関係する変数

## 変数重要度

{{variable_importance}}

重要度は学習済みモデルに対して既存の permutation importance で計算され、最大値が100になるよう正規化されています。ツールチップには相対的重要度のみが表示されます。重要度は予測への寄与であり、因果関係ではありません。

## 変数の値とカテゴリ確率

{{variable_effect}}

各説明変数の値に対するカテゴリ別予測確率を示します。階段状の変化はモデルの分岐を反映しますが、因果関係を意味しません。

# 予測精度

<% if (test_mode) { %>学習データとテストデータの性能を比較します。テストデータはモデル作成に使用していません。<% } else { %>現在の指標は学習データに対する値です。未知データで評価するにはテストモードを有効にしてください。<% } %>

## 全体の評価指標

{{summary}}

Macro F1はカテゴリごとのF1の平均です。Macro ROC AUCとMacro PR AUCはカテゴリごとのOne-vs-Rest指標の平均で、カテゴリ数の違いによる重み付けをしません。

## カテゴリ別の評価指標

{{class_summary}}

カテゴリ別のROC AUCとPR AUCはOne-vs-Rest方式で、対象カテゴリを陽性、その他をまとめて陰性として計算します。Precision–Recall曲線のベースラインは、そのカテゴリの全体割合です。

## 混同行列 — 全体割合

{{confusion_matrix_total}}

各セルに件数と評価対象全体に対する割合を表示します。

## 混同行列 — 行割合

{{confusion_matrix_row}}

実測カテゴリごとに正規化し、カテゴリ別の見逃しを確認します。

## カテゴリ別予測確率の分布

{{multiclass_probability_density}}

実測カテゴリの予測確率が1付近に集中するほど、識別性能が高いことを示します。

## カテゴリ別ROC曲線

{{multiclass_roc}}

各曲線はOne-vs-Restで、ランダム分類の基準を含みます。全体Accuracyだけでなくカテゴリ別AUCを比較してください。

## カテゴリ別Precision–Recall曲線

{{multiclass_pr}}

各曲線のベースラインはカテゴリの全体比です。少数カテゴリではROC AUCよりPR AUCの方が実務的な性能を確認しやすい場合があります。

## 学習回数と精度の向上

{start_lazy_show_hide}
### チャート
{{learning_curve_multiclass}}
{end_lazy_show_hide}

# 予測結果

{{data}}
`;
module.exports = template;
