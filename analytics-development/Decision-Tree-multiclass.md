const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { byCategory: {} }; %>
<% const metrics = typeof multiclass_metrics !== 'undefined' ? multiclass_metrics : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# サマリ

選択した説明変数から、複数カテゴリ型の目的変数 **<%= target %>** を予測する決定木モデルを作成しました。

## データとモデルの基本情報

{{basic_info}}

## 目的変数の分布

{{target_distribution}}

カテゴリごとの件数と割合を表示します。テストモードでは、トレーニングデータとテストデータに分けて表示します。

# 特徴的なグループ

すべての終端ノードをセグメントとして一覧化し、カテゴリごとにグループ内割合の高い順に並べています。グループ比、全体比、比率を合わせて確認してください。小さいグループの比率は不安定になる場合があります。

{{characteristic_groups}}

<% Object.keys(groups.byCategory || {}).forEach(category => { const group = groups.byCategory[category]; %>
<% if (group) { %>**<%= category %>**で最も特徴的なグループは **<%= group.path || '—' %>** です。<% if (group.small) { %>行数が少ないため、解釈には注意してください。<% } %>
<% } %>
<% }) %>

<% if (Object.keys(groups.byCategory || {}).some(category => groups.byCategory[category].small)) { %>
> 30行未満の特徴的なグループがあります。表示は維持していますが、カテゴリ比率は慎重に解釈してください。
<% } %>

# 決定木

以下の決定木は、モデルが目的変数を予測するために作成した一連の条件分岐を表しています。上のノードから条件に従って枝を進み、最下部の終端ノードに到達すると、そのグループに対する予測値が決まります。

{{tree_structure}}

各ノードにはカテゴリごとの件数と割合、最も確率の高いカテゴリ、学習データに占める割合が表示されます。終端ノードの確率はモデルの予測であり、因果効果ではありません。

# 予測に関係する変数

## 変数重要度

{{variable_importance}}

重要度は学習済みモデルに対して既存の permutation importance で計算され、最大値が100になるよう正規化されています。ツールチップには相対的重要度のみが表示されます。重要度は予測への寄与であり、因果関係ではありません。

## 変数の値とカテゴリ確率

{{variable_effect}}

各説明変数の値に対するカテゴリ別予測確率を示します。階段状の変化は決定木の分岐を反映しますが、因果関係を意味しません。

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

# 予測結果

{{data}}

# 条件付きの改善提案

<% if (!suggestions.length) { %>利用可能な指標から自動的な警告は検出されませんでした。<% } %>
<% suggestions.forEach(suggestion => { %>
<% if (suggestion.id === 'overfit_gap') { %>* 学習とテストの性能差が大きいため、木の深さを下げる、終端ノードを大きくする、または枝刈りを検討してください。<% } else if (suggestion.id === 'weak_single_tree') { %>* 予測に寄与する変数が見つかりません。入力変数を見直し、アンサンブルモデルも検討してください。<% } %>
<% }) %>
`;
module.exports = template;
