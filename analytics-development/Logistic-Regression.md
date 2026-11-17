const template =
`
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const allTrueRatio = distribution && distribution.shares && distribution.shares.TRUE !== undefined ? (Math.round(distribution.shares.TRUE * 1000) / 10) + '%' : '—'; %>
<% const metrics = typeof logical_metrics !== 'undefined' ? logical_metrics : {}; %>
<% const cut = typeof threshold_analysis !== 'undefined' && threshold_analysis ? threshold_analysis : null; %>
<% const cutObjective = cut ? cut.objective : (typeof threshold_objective !== 'undefined' ? threshold_objective : 'balanced_accuracy'); %>
<% const cutHasMinRecall = !!(cut && cut.minimum_recall_display); %>
<% const cutHasMinPrecision = !!(cut && cut.minimum_precision_display); %>
<% const cutMinRecall = cutHasMinRecall ? cut.minimum_recall_display : '未設定'; %>
<% const cutMinPrecision = cutHasMinPrecision ? cut.minimum_precision_display : '未設定'; %>
<% const cutMethodShort = cutObjective === 'f1' ? 'F1スコアを最大化' : cutObjective === 'precision_at_recall' ? (cutHasMinRecall ? '再現率' + cutMinRecall + '以上の中で適合率を最大化' : '再現率の下限を満たす中で適合率を最大化') : cutObjective === 'recall_at_precision' ? (cutHasMinPrecision ? '適合率' + cutMinPrecision + '以上の中で再現率を最大化' : '適合率の下限を満たす中で再現率を最大化') : '均衡正解率を最大化'; %>
<% const cutMethodShortLabel = cut && cut.available ? cutMethodShort : '—'; %>
<% const cutMethodSentence = cutObjective === 'f1' ? '適合率と再現率のバランスをとるF1スコアが最大になる境界値' : cutObjective === 'precision_at_recall' ? ('再現率が' + cutMinRecall + '以上になる境界値の中で、適合率が最大になる境界値') : cutObjective === 'recall_at_precision' ? ('適合率が' + cutMinPrecision + '以上になる境界値の中で、再現率が最大になる境界値') : 'TRUEとFALSEをバランスよく分類できるように、均衡正解率が最大になる境界値'; %>

# サマリ

選択した説明変数から、ロジカル型の目的変数 **\`<%= target %>\`** を予測するロジスティック回帰のモデルを作成しました。

## データとモデルの基本情報

{{basic_info}}

## 目的変数の分布

{{target_distribution}}

# 多重共線性

  <% if (has_perfect_collinearity) { %>
{{multicollinearity:0.6}}

このモデルでは"<%= perfect_collinearity_variables %>"列が完全な[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（他の説明変数の値によって数式で完全に計算できる状態）の問題を作っているため、そのVIFスコアが無限大となり多重共線性をテストするためのチャートが生成できませんでした。多重共線性の問題を解決するために、"<%= perfect_collinearity_variables %>"列を説明変数から除外し再実行してください。
  <% } else if (max_vif > 10) { %>
{{multicollinearity}}
    <% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %>は完全な[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（他の説明変数の値によって数式で完全に計算できる状態）の問題を作っているため、そのVIFスコアが無限大となり多重共線性をテストするためのチャートが生成できませんでした。
それ以外のグループではこのモデルには[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（複数の説明変数間に強い相関関係があること）の問題が見られます。VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。
この問題を解決するためには、VIFの値が10を超えている説明変数の中から必要性が低いものを1つずつ除外し、再実行し、VIFの値が10を超える説明変数がなくなるまで繰り返してください。
  <% } else { %>
このモデルには[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（複数の説明変数間に強い相関関係があること）の問題が見られます。VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。
この問題を解決するためには、VIFの値が10を超えている説明変数の中から必要性が低いものを1つずつ除外し、再実行し、VIFの値が10を超える説明変数がなくなるまで繰り返してください。
  <% } %>
<% } else { %>
{{multicollinearity}}
    <% if (perfect_collinearity_groups && perfect_collinearity_groups.length > 0) { %>
<%= perfect_collinearity_groups.join(', ') %>は完全な[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（他の説明変数の値によって数式で完全に計算できる状態）の問題を作っているため、そのVIFスコアが無限大となり多重共線性をテストするためのチャートが生成できませんでした。
それ以外のグループではこのモデルには[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（複数の説明変数間に強い相関関係があること）の問題は見られません。（VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。）
    <% } else { %>
このモデルには[多重共線性](https://exploratory.io/note/exploratory/Ysc3LNp0)（複数の説明変数間に強い相関関係があること）の問題は見られません。（VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。）       
    <% } %>
<% } %>


# 変数間の関係

<% if (predictorColumns.length > 1) { %>
## 説明変数の重要度

<%= target %>を予測するためにどの説明変数が相対的により重要なのかを表したのが以下のチャートです。

{{variable_importance}}

変数の重要度の仕組みについては、[こちら](https://exploratory.io/note/exploratory/dLm5rwn5)のノートをご覧ください。

<% } %>

## 説明変数の影響度

<% if (predictorColumns.length > 1) { %>
他の変数の値が一定であったとき、それぞれの説明変数の確率が変わると<%= target %>の値がどのように変わるかを表したのが以下のチャートです。
<% } else { %>
説明変数の値が変わると<%= target %>の確率がどのように変わるかを表したのが以下のチャートです。
<% } %>

{{variable_effect}}

* 青い線（または点）は説明変数の値に対する予測値を示します。
* グレーの線は実測値とその95%信頼区間を示します。
* 縦軸は<%= target %>の確率です。

注意点：

<% if (predictorColumns.length > 1) { %>

* 他の変数が一定だとした時に、その説明変数単体の効果を予測しているため、実測値の平均値と予測値にずれが生じます。
* 予測値の計算方法の詳細は、[こちらのノート](https://exploratory.io/note/exploratory/Sbd0LDU6)をご覧ください。
* 単回帰分析と重回帰分析の解釈の違いについては、[こちらのノート](https://exploratory.io/note/exploratory/BDI7AeE5)をご覧ください。
* 説明変数は上記の「説明変数の重要度」にある重要度の高い順番で並んでいます。

<% } %>

<% if (has_category_columns) { %>
* カテゴリ型（Character型、Factor型）の説明変数において一意の値が<%= predictor_n %>個より多い場合は、頻度の多いものから<%= predictor_n -1 %>個の値を残し、それ以外は「その他」としています。これは[「設定」](//analytics/settings/max_categories_for_factor)より変更可能です。
<% } %>

<% if (is_variable_odds_ratio) { %>
# 変数の係数（オッズ比）と有意性

変数ごとに係数（オッズ比）とその有意性を判断するためのP値、および信頼区間がリストされています。

{{coefficient_table}}

<% if (has_category_columns) { %>
_カテゴリ型（Character型、Factor型）の説明変数において一意の値が<%= predictor_n %>個より多い場合は、頻度の多いものから<%= predictor_n -1 %>個の値を残し、それ以外は「その他」としています。これは[「設定」](//analytics/settings/max_categories_for_factor)より変更可能です。_
<% } %>

## オッズ比の解釈

それぞれの説明変数の値が1単位変わると<%= target %>のオッズ（TRUEになる可能性）が何倍上がる（または下がる）かを示します。

### オッズ比の解釈の例

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>
他の変数の値が一定の場合、<%= variable.variable %>が1単位上がると、<%= target %>のオッズ（TRUEの割合 / FALSEの割合）は約<%= variable.odds_ratio %>倍になります。
<% } else if (variable.type == 'logical') { %>
他の変数の値が一定の場合、<%= variable.variable %>がTRUEの場合、FALSEに比べ<%= target %>のオッズ（TRUEの割合 / FALSEの割合）は約<%= variable.odds_ratio %>倍になります。
<% } else { %>
他の変数の値が一定の場合、「<%= variable.variable %>」は、ベースレベルである「<%= variable.base_level %>」と比べて<%= target %>のオッズ（TRUEの割合 / FALSEの割合）が約<%= variable.odds_ratio %>倍になります。ベースレベルの詳細は[こちらのノート](https://exploratory.io/note/exploratory/Pxa6FmO2)をご参照ください。
<% } %>
<% }) %>

統計の予測モデルにおけるデータタイプごとの係数の解釈方法については、[こちら](https://exploratory.io/note/exploratory/KOC5WYt3)のノートをご覧ください。

## P値を使った有意性の判断

有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の元では、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも大きい説明変数は<%= target %>との関係が統計的に有意だとは言えません。逆に、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも小さい説明変数は<%= target %>との関係が統計的に有意だと言えます。

_現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これは[「設定」](//analytics/settings)より変更可能です。_


## オッズ比と信頼区間の可視化

それぞれの変数のオッズ比と有意性を可視化したのが以下のチャートです。

{{coefficient}}

* それぞれのエラーバーの真ん中の点はオッズ比の値、上下の線はその95%信頼区間を表しています。<%= target %>との関係が有意で、かつその関係が正の説明変数は青、関係が負の説明変数は赤となっています。グレーで表されている説明変数は<%= target %>との関係が有意とは言えません。
* オッズ比が1であるということは、説明変数の値が変化してもTRUEとFALSEのオッズ（TRUEの割合 / FALSEの割合）が変わらないため、<%= target %>との関係がないことを表します。
* オッズ比の95%信頼区間は、「真のオッズ比がこの範囲内にある可能性が高い（95%の信頼がある）」ことを意味します。そのため、信頼区間が1を含んでいる説明変数は、<%= target %>との関係が全くない可能性があるため、統計的に有意だと言えません。逆に、信頼区間が1を含んでいない説明変数は、<%= target %>との関係が全くない可能性はほぼないため、統計的に有意だと言えます。
* 有意性の判断はP値または信頼区間によって行うことができます。どちらで判断しても同じ結果となります。

_上記の信頼区間の説明は直感的な説明であって、正確には「同じ母集団から繰り返しサンプルを取り、毎回95％信頼区間を計算した場合、そのうちの95％の区間は真のオッズ比を含む」ということになります。_

### 注意点

* オッズ比は、確率の変化比ではなく、あくまでもオッズ（TRUEの割合 / FALSEの割合）の変化比です。
* オッズ比が1より大きい場合は<%= target %>がTRUEになる確率が高くなり、1より小さい場合は低くなります。
* これらのオッズ比の値は、あくまでもそれぞれの説明変数の値が1ポイント変わった場合の変化量であり、説明変数同士で単位が異なる場合にはそれらのオッズ比の値を使って<%= target %>との関係の強さを比べることはできません。説明変数間の関係の強さを比べたい場合は、上記の「説明変数の重要度」をご参照ください。

<% } %>

<% if (is_variable_average_marginal_effect) { %>

# 変数の係数（平均限界効果）と有意性

変数ごとに係数（平均限界効果）とその有意性を判断するためのP値、および信頼区間がリストされています。

{{coefficient_table}}

<% if (has_category_columns) { %>
_カテゴリ型（Character型、Factor型）の説明変数において一意の値が<%= predictor_n %>個より多い場合は、頻度の多いものから<%= predictor_n - 1 %>個の値を残し、それ以外は「その他」としています。これは[「設定」](//analytics/settings/max_categories_for_factor)より変更可能です。_
<% } %>

## 平均限界効果の解釈

それぞれの説明変数の値が1単位変わると<%= target %>の確率が平均してどの程度変化するかを示します。

### 平均限界効果の解釈の例

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>

* 他の変数の値が一定の場合、<%= variable.variable %>が1単位上がると、<%= target %>がTRUEになる確率は平均して約<% if (variable.marginal_effect_pct > 0) { %><%= variable.marginal_effect_pct %>ポイント増加します<% } else { %><%= variable.marginal_effect_pct * -1 %>ポイント減少します<% } %>。

<% } else if (variable.type == 'logical') { %>

* 他の変数の値が一定の場合、<%= variable.variable %>がTRUEの場合、FALSEに比べ<%= target %>がTRUEになる確率は平均して約<%= variable.marginal_effect_pct %>ポイントの差があります。

<% } else { %>

* 他の変数の値が一定の場合、<%= variable.variable %>は、ベースレベルである"<%= variable.base_level %>"と比べて<%= target %>がTRUEになる確率が平均して約<%= variable.marginal_effect_pct %>ポイントの差があります。ベースレベルの詳細は、[こちらのノート](https://exploratory.io/note/exploratory/Pxa6FmO2)をご参照ください。

<% } %>
<% }) %>

_ポイント（パーセンテージポイント）は確率の絶対的な変化量を表します。例えば、元の確率が30%で平均限界効果が5ポイントの場合、新しい確率は35%になります。これは相対的な変化率（%の増加）とは異なることにご注意ください。_

統計の予測モデルにおけるデータタイプごとの係数の解釈方法については、[こちら](https://exploratory.io/note/exploratory/KOC5WYt3)のノートをご覧ください。

## P値を使った有意性の判断

有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の元では、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも大きい説明変数は<%= target %>との関係が統計的に有意だとは言えません。逆に、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも小さい説明変数は<%= target %>との関係が統計的に有意だと言えます。

_現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これは[「設定」](//analytics/settings)より変更可能です。_

## 平均限界効果の可視化

それぞれの変数の平均限界効果と有意性を可視化したのが以下のチャートです。

{{coefficient}}

* それぞれの点は平均限界効果の値を表しています。<%= target %>との関係が有意で、かつその関係が正の説明変数は青、関係が負の説明変数は赤となっています。グレーで表されている説明変数は<%= target %>との関係が有意とは言えません。
* 平均限界効果が0であるということは、説明変数の値が変化しても<%= target %>がTRUEになる確率が変わらないため、<%= target %>との関係がないことを表します。
* 有意性の判断はP値によって行われます。

### 注意点

* 平均限界効果は、確率の変化量を直接示しているため、オッズ比よりも直感的に理解しやすいです。ただし、平均限界効果は全データにわたる平均的な効果を示すため、個々の観測値における実際の限界効果（その観測値での説明変数が1単位変化したときの確率の変化量）は異なる場合があります。例えば、年収の平均限界効果が3ポイントでも、低年収層では年収増加の効果が5ポイント、高年収層では1ポイントといったように、個別のケースでは効果が異なることがあります。特に、説明変数の値や他の変数の組み合わせによって限界効果が大きく変動する可能性があることにご注意ください。
* 平均限界効果が正の値の場合は<%= target %>がTRUEになる確率が高くなり、負の値の場合は低くなります。
* これらの平均限界効果の値は、あくまでもそれぞれの説明変数の値が1ポイント変わった場合の変化量であり、説明変数同士で単位が異なる場合にはそれらの平均限界効果の値を使って<%= target %>との関係の強さを比べることはできません。説明変数間の関係の強さを比べたい場合は、上記の「説明変数の重要度」をご参照ください。

<% } %>

<% if (is_variable_coefficient) { %>

# 変数の係数と有意性

変数ごとに係数とその有意性を判断するためのP値、および信頼区間がリストされています。

{{coefficient_table}}

<% if (has_category_columns) { %>

カテゴリ型（Character型、Factor型）の説明変数において一意の値が<%= predictor_n %>個より多い場合は、頻度の多いものから<%= predictor_n - 1 %>個の値を残し、それ以外は「その他」としています。これは[「設定」](//analytics/settings/max_categories_for_factor)より変更可能です。

<% } %>

## 係数の解釈

それぞれの説明変数の値が1単位変わると<%= target %>の可能性（対数オッズ）がどの程度変化するかを示します。

### 係数の解釈の例

<% variables.forEach(variable => { %>

<% if (variable.type == 'numeric') { %>

他の変数の値が一定の場合、<%= variable.variable %>が1単位上がると、<%= target %>の可能性（対数オッズ）は約<%= variable.coefficient %>変化します。

<% } else if (variable.type == 'logical') { %>

他の変数の値が一定の場合、<%= variable.variable %>がTRUEの場合、FALSEに比べ<%= target %>の可能性（対数オッズ）は約<%= variable.coefficient %>変化します。

<% } else { %>

他の変数の値が一定の場合、「<%= variable.variable %>」は、ベースレベルである「<%= variable.base_level %>」と比べて<%= target %>の可能性（対数オッズ）が約<%= variable.coefficient %>変化します。ベースレベルの詳細は[こちらのノート](https://exploratory.io/note/exploratory/Pxa6FmO2)をご参照ください。

<% } %>

<% }) %>

統計の予測モデルにおけるデータタイプごとの係数の解釈方法については、[こちら](https://exploratory.io/note/exploratory/KOC5WYt3)のノートをご覧ください。

## P値を使った有意性の判断

有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の元では、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも大きい説明変数は<%= target %>との関係が統計的に有意だとは言えません。逆に、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも小さい説明変数は<%= target %>との関係が統計的に有意だと言えます。

_現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これは[「設定」](//analytics/settings)より変更可能です。_

## 係数と信頼区間の可視化

それぞれの変数の係数と有意性を可視化したのが以下のチャートです。

{{coefficient}}

* それぞれのエラーバーの真ん中の点は係数の値、上下の線はその95%信頼区間を表しています。<%= target %>との関係が有意で、かつその関係が正の説明変数は青、関係が負の説明変数は赤となっています。グレーで表されている説明変数は<%= target %>との関係が有意とは言えません。

* 係数が0であるということは、説明変数の値が変化しても<%= target %>の可能性（対数オッズ）が変わらないため、<%= target %>との関係がないことを表します。

* 係数の95%信頼区間は、「真の係数がこの範囲内にある可能性が高い（95%の信頼がある）」ことを意味します。そのため、信頼区間が0を含んでいる説明変数は、<%= target %>との関係が全くない可能性があるため、統計的に有意だと言えません。逆に、信頼区間が0を含んでいない説明変数は、<%= target %>との関係が全くない可能性はほぼないため、統計的に有意だと言えます。

* 有意性の判断はP値または信頼区間によって行うことができます。どちらで判断しても同じ結果となります。

上記の信頼区間の説明は直感的な説明であって、正確には「同じ母集団から繰り返しサンプルを取り、毎回95％信頼区間を計算した場合、そのうちの95％の区間は真の係数を含む」ということになります。

### 注意点

* 係数は可能性（対数オッズ）の変化量を表しており、直接的に確率の変化を示すものではありません。
* 係数が正の場合は<%= target %>がTRUEになる確率が高くなる傾向があり、負の場合は低くなる傾向があります。
* これらの係数の値は、あくまでもそれぞれの説明変数の値が1ポイント変わった場合の変化量であり、説明変数同士で単位が異なる場合にはそれらの係数の値を使って<%= target %>との関係の強さを比べることはできません。説明変数間の関係の強さを比べたい場合は、上記の「説明変数の重要度」をご参照ください。

<% } %>

# 予測精度

<% if (test_mode) { %>モデルを作成したトレーニングデータと、モデル作成には使用していないテストデータの予測性能を比較します。テストデータの結果を見ることで、モデルが未知のデータに対しても同じように予測できるかを確認できます。<% } else { %>現在の指標はトレーニングデータに対する予測結果をもとに計算されています。未知データに対する予測精度を評価するにはテストデータを使うことを推奨します。その場合は、[設定](chrome-extension://analytics/settings/test_mode)より「テストモード」を有効にしてください。<% } %>

## モデルの評価指標

{{summary}}

- ROC AUCとPR AUCは、特定の境界値に限定せず、さまざまな境界値におけるモデルの識別性能を評価します。その他の指標は、現在の境界値である<%= cut && cut.current_threshold_display ? cut.current_threshold_display : true_false_criteria %>を使ってTRUEとFALSEに分類した結果です。境界値は[「設定」](chrome-extension://analytics/settings/true_false_criteria)より変更可能です。
<% if (test_mode) { %>- モデルの実際の予測性能を評価するときは、モデル作成に使用していないテストデータの結果を重視します。テストデータの指標が学習データより大きく低い場合は、モデルが学習データに適合しすぎており、未知のデータでは十分な性能を発揮できない可能性があります。
<% } %>- TRUEとFALSEの件数に偏りがある場合、正解率は、多数派のカテゴリを予測するだけでも高くなることがあります。そのため、均衡正解率、再現率、適合率、F1スコアなどとあわせて評価してください。
- 特にTRUEの件数が少ない場合は、PR AUCを確認することで、TRUEを見つける性能と、誤ってTRUEと予測するケースのバランスを捉えやすくなります。

## 有意性

モデルの有意性検定のためにF検定を行いました。帰無仮説は、「モデルの全ての係数が0である」、つまりモデルに使われた説明変数は目的変数である<%= target %>と関係がないということになります。P値の値が有意水準である<%= baseline_p_pct %>%より高ければ、選択された説明変数と<%= target %>の関係は統計的に有意とは言えません。逆に、P値が<%= baseline_p_pct %>%より低ければ、有意だと言えます。

{start_show_hide}
## モデルの指標の詳細

* ROC AUC
  * ROC AUCは、TRUEとFALSEを予測するモデルの分類性能を評価するために、一般的によく使われる指標です。
  * さまざまな境界値において、モデルがTRUEのデータにFALSEのデータよりも高い予測確率を与えられるかを総合的に評価します。
  * 値は通常0.5から1の間で、0.5はランダムな予測と同程度、1はTRUEとFALSEを完全に区別できることを意味します。
  * 一般的には、0.6以上で一定の分類性能があり、0.8以上で良好、0.9以上で非常に高い分類性能があると解釈されます。
  * ROC AUCは「Receiver Operating Characteristic Area Under the Curve」の略で、ROC曲線の下の面積を表します。

* PR AUC
  * PR AUCは、適合率（Precision）と再現率（Recall）の関係を表すPR曲線の下の面積です。
  * さまざまな境界値における適合率と再現率を総合的に評価し、モデルがTRUEのデータをどの程度正確に、かつ漏れなく見つけられるかを測ります。
  * 値は0から1の間で、1に近いほど、適合率と再現率の両方が高いことを意味します。
  * 元データのTRUEが少ない場合など、TRUEとFALSEの割合に大きな差があるデータの評価に特に有用です。
  * PR AUCは「Precision-Recall Area Under the Curve」の略で、PR曲線の下の面積を表します。

* F1スコア
  * F1スコアは、適合率と再現率の調和平均で、両方のバランスを評価する指標です。
  * 値は0から1の間で、1に近いほど、TRUEと予測した結果の正確さと、実際のTRUEを見逃さない能力の両方が高いことを意味します。
  * FALSEを正しく予測できた割合は直接評価しないため、TRUEの検出を重視する場合に適しています。
  * 元データのTRUEが少ない場合など、正解率だけではモデルの性能を適切に評価しにくい場合に特に有用です。

* 均衡正解率
  * 均衡正解率（Balanced Accuracy）は、再現率と特異度の平均で、TRUEとFALSEの両方を正しく予測できているかをバランスよく評価する指標です。
  * 値は0から1の間で、1に近いほどTRUEとFALSEの両方を正確に分類できることを意味します。
  * 0.5はランダムな予測と同程度、1はTRUEとFALSEを完全に分類できることを示します。
  * 元データのTRUEとFALSEの割合に大きな差がある場合でも、多数派のカテゴリに偏らずモデルを評価できるため、正解率よりも適している場合があります。

* 正解率
  * 正解率は、すべての予測のうち、TRUEまたはFALSEを正しく予測できた割合を示します。
  * 値は0から1の間で、1に近いほど、全体として多くのデータを正しく分類できていることを意味します。
  * 直感的で分かりやすい指標ですが、元データのTRUEとFALSEの割合に大きな差がある場合は、モデルの性能を過大評価する可能性があります。
  * 例えば、FALSEが大部分を占めるデータでは、すべてをFALSEと予測しても高い正解率になることがあるため、再現率、適合率、均衡正解率などとあわせて確認する必要があります。

* 誤分類率
  * 誤分類率は、すべての予測のうち、TRUEまたはFALSEを誤って予測した割合を示します。
  * 「1 − 正解率」で計算され、値は0から1の間です。0に近いほど、誤った予測が少ないことを意味します。
  * 正解率と表裏の関係にあるため、元データのTRUEとFALSEの割合に大きな差がある場合は、モデルの性能を適切に表さないことがあります。
  * どのような誤分類が起きているかを確認するには、適合率、再現率、特異度などとあわせて評価する必要があります。

* 適合率 (Precision)
  * 適合率は、「TRUEと予測したもののうち、実際にTRUEだった割合」を示します。
  * 値は0から1の間で、1に近いほど、TRUEという予測の信頼性が高いことを意味します。
  * 実際はFALSEであるものを誤ってTRUEと予測する、偽陽性を少なくしたい場合に重視される指標です。
  * 例えば、TRUEと判定した対象に費用や対応作業が発生する場合は、適合率が重要になります。

* 再現率 (Recall)
  * 再現率は、「実際にTRUEであるもののうち、TRUEと正しく予測できた割合」を示します。
  * 値は0から1の間で、1に近いほど、実際のTRUEを見逃さずに検出できていることを意味します。
  * 実際はTRUEであるものを誤ってFALSEと予測する、偽陰性を少なくしたい場合に重視される指標です。
  * 例えば、重要な対象をできるだけ漏れなく発見する必要がある場合は、再現率が重要になります。

* 特異度（Specificity）
  * 特異度（Specificity）は、「実際にFALSEであるもののうち、FALSEと正しく予測できた割合」を示します。
  * 値は0から1の間で、1に近いほど「実際のFALSEのケースを誤ってTRUEと予測しない能力」が高いことを意味します。
  * 偽陽性（実際はFALSEなのにTRUEと予測）を最小化したい場合に重視される指標です。
  * 再現率（Recall）が実際のTRUEを正しく分類する能力を示すのに対し、特異度は実際のFALSEを正しく分類する能力を示します。

* P値
  * P値は観測されたデータが帰無仮説（説明変数と目的変数に関連がない）と同等かそれ以上に極端である確率を示します。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* 対数尤度
  * 対数尤度はモデルがデータにどれだけ適合しているかを数値化したものです。
  * 通常は負の値を取り、0に近いほどモデルの適合度が高いことを示します。
  * 単独では解釈が難しく、モデル比較のためのAICやBICの計算に使用されます。

* AIC
  * AIC（赤池情報量基準）はモデルの複雑さと適合度のバランスを評価する指標です。
  * 値が小さいほど優れたモデルとされ、過学習を防ぎながら最適なモデルを選択するのに役立ちます。
  * 同じデータセットで異なるモデルを比較する際に使用され、通常は正の値を取ります。

* BIC
  * BIC（ベイズ情報量基準）はAICと同様にモデル選択のための指標ですが、サンプルサイズによる補正がより厳しくなっています。
  * AICよりも単純なモデルを選ぶ傾向があり、値が小さいほど良いモデルと判断されます。
  * 大きなサンプルサイズでの分析や、真のモデルが比較的単純だと考えられる場合に有用です。

* 残差逸脱度
  * 残差逸脱度は実際の結果とモデルによる予測の差（残差）を測定する指標です。
  * 値が小さいほどモデルの適合度が高いことを示します。
  * 自由度と比較して大きな値の場合、モデルの適合が悪いことを示唆します。

* 残差の自由度
  * 残差の自由度は「データ数 - モデルのパラメータ数」で計算され、モデルの複雑さを考慮した残りの情報量を示します。
  * 常に正の整数値を取り、値が大きいほど推定の精度が高まります。
  * 残差逸脱度と合わせて、モデルの適合度を評価するのに使用されます。

* Nullモデルの逸脱度
  * Nullモデルの逸脱度は、説明変数を含まない（切片のみの）モデルの逸脱度を示します。
  * モデルの逸脱度と比較することで、説明変数の追加によるモデル改善度を評価できます。
  * 値自体よりも、モデルの逸脱度との差が重要です。

* Nullモデルの自由度
  * Nullモデルの自由度はNull（切片のみの）モデルの自由度で、通常はデータ数-1です。
  * モデルの自由度と比較することで、説明変数の追加によって使用された自由度を確認できます。
  * モデル比較の際の参考値として使用されます。

* VIF（最大値）
  * VIF（分散拡大要因）は説明変数間の多重共線性の程度を示す指標です。
  * 一般的にVIFが10以上の変数は多重共線性の問題があると判断されます。
  * 値は1以上で、1に近いほど多重共線性が少ないことを示します。

{end_show_hide}

## 混同行列 - 全体に対する割合

<% if (test_mode) { %>モデルがトレーニングデータとテストデータの各行に対して予測したうち、どれだけが実測値と同じ、または違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**全データに占める割合（％）**です。<% } else { %>モデルがトレーニングデータの各行に対して予測したうち、どれだけが実測値と同じ、または違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**全データに占める割合（％）**です。<% } %>

{{confusion_matrix_total}}

## 混同行列 - 実測値ごとの割合

<% if (test_mode) { %>モデルがトレーニングデータとテストデータの各行に対して予測したうち、どれだけが実測値と同じまたは違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**各実測値に占める割合（％）**です。<% } else { %>モデルがトレーニングデータの各行に対して予測したうち、どれだけが実測値と同じまたは違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**各実測値に占める割合（％）**です。<% } %>

{{confusion_matrix_row}}

## 予測確率の分布

モデルが各行に対して予測したTRUEの確率を、実測値がTRUEのグループとFALSEのグループに分けて表示します。2つの分布を比較することで、モデルがTRUEとFALSEをどの程度区別できているかを確認できます。

{{probability_distribution}}

- 実測値がTRUEのグループ（青）が右側の1に近い範囲に、実測値がFALSEのグループ（オレンジ）が左側の0に近い範囲に分かれ、2つの分布の重なりが小さいほど、モデルの識別性能が高いと考えられます。
- 2つの分布が重なっている範囲では、FALSEをTRUEと予測する誤検出や、TRUEをFALSEと予測する見逃しが発生しやすくなります。
- 縦軸は行数ではなく、分布の形を比較するための密度を表しています。そのため、曲線の高さからTRUEとFALSEの行数を比較することはできません。

## ROC曲線

ROC曲線は、TRUEと判定する境界値を変えたときに、TRUEを正しく見つける割合と、FALSEを誤ってTRUEと判定する割合がどのように変化するかを示します。縦軸の真陽性率は、実際のTRUEを正しくTRUEと判定できた割合で、再現率と同じです。横軸の偽陽性率は、実際のFALSEを誤ってTRUEと判定した割合で、1 − 特異度を表します。

{{roc_curve}}

<% if (test_mode) { %>- 青い線はトレーニングデータ、オレンジの線はテストデータの結果です。曲線が左上に近いほど、FALSEの誤検出を抑えながらTRUEを正しく見つけられており、分類性能が高いことを示します。灰色の対角線はランダムな予測と同程度の性能を表します。
- 実際の予測性能を評価する際は、テストデータの曲線を重視します。テストデータの曲線がトレーニングデータより大きく下にある場合は、未知のデータで性能が低下している可能性があります。
<% } else { %>- 青い線はトレーニングデータに対する結果です。曲線が左上に近いほど、FALSEの誤検出を抑えながらTRUEを正しく見つけられており、分類性能が高いことを示します。灰色の対角線はランダムな予測と同程度の性能を表します。
<% } %>- ROC AUCはROC曲線の下側の面積を表す指標です。1に近いほどTRUEとFALSEを区別する性能が高く、0.5の場合はランダムに分類した場合と同程度であることを示します。

## Precision-Recall曲線（PR曲線）

PR曲線は、TRUEと判定する境界値を変えたときに、適合率と再現率がどのように変化するかを示します。縦軸の適合率は、TRUEと予測した行のうち、実際にTRUEだった割合です。横軸の再現率は、実際のTRUEのうち、正しくTRUEと予測できた割合です。

{{pr_curve}}

<% if (test_mode) { %>- 青い線はトレーニングデータ、オレンジの線はテストデータの結果です。曲線が右上に近いほど、TRUEを多く見つけながら、誤ってTRUEと判定するケースも少なく、モデルの性能が高いことを示します。
<% } else { %>- 青い線はトレーニングデータに対する結果です。曲線が右上に近いほど、TRUEを多く見つけながら、誤ってTRUEと判定するケースも少なく、モデルの性能が高いことを示します。
<% } %>- 一般に、再現率を高めると適合率が低下し、適合率を高めると再現率が低下するため、この曲線から両者のトレードオフを確認できます。
- PR AUCはPR曲線の下側の面積を表す指標です。TRUEの件数が少ないデータでは、ROC AUCよりも、TRUEを見つける性能と誤検出のバランスを捉えやすい傾向があります。

# 境界値の検討

予測確率が境界値以上の行をTRUE、境界値未満の行をFALSEと予測します。境界値を変更すると、TRUEの見つけやすさを表す再現率、TRUE予測の正確さを表す適合率、FALSEを正しく判定する特異度などの評価指標が変化します。

## 推奨境界値

<% if (cut && cut.available) { %>以下は、TRUEとFALSEを分ける現在の境界値と、\`<%= cutMethodShort %>\`を前提に計算された推奨境界値です。<% } %>

<% if (cut && cut.available) { %>
{{threshold_recommendation}}
<% } else if (cut && (cut.status === 'missing_minimum_recall' || cut.status === 'missing_minimum_precision')) { %>
プロパティの「<%= cut.status === 'missing_minimum_recall' ? '最低再現率' : '最低適合率' %>」が未入力です。値を入力してから実行し直してください。
<% } else if (cut && cut.recommended_is_above_max) { %>
すべてをFALSEと予測する境界値が最も良い評価になりました。このモデルではTRUEを識別できていない可能性があるため、説明変数やデータを見直してください。
<% } else if (cut && (cut.status === 'no_threshold_for_minimum_recall' || cut.status === 'no_threshold_for_minimum_precision')) { %>
指定した<%= cut.status === 'no_threshold_for_minimum_recall' ? '再現率' : '適合率' %><%= cut.status_value_display %>以上を満たす境界値がありません。<% if (cut.best_achievable_display) { %>このデータで到達できるのは<%= cut.best_achievable_display %>までです。<% } %>条件を緩めるか、モデルを見直してから実行し直してください。
<% } else { %>
推奨境界値の計算には、評価対象にTRUEとFALSEの両方が必要です。このデータでは推奨値を計算できません。
<% } %>

<% if (cut && cut.available) { %>
推奨境界値は、\`推奨値計算の前提\`に基づいて算出された値です。\`推奨値計算の前提\`は[「設定」](chrome-extension://analytics/settings/threshold_objective)より変更できます。
<% } %>

<% if (cut && cut.available) { %>
## 現在値と推奨値の比較

<% if (cut.is_same_as_current) { %>
現在の境界値はすでに推奨値と同じため、これらの指標は変わりません。
<% } else { %>
境界値を<%= cut.current_threshold_display %>から<%= cut.recommended_threshold_display %>に<% if (parseFloat(cut.recommended_threshold_display) < parseFloat(cut.current_threshold_display)) { %>下げると<% } else { %>上げると<% } %>、再現率は<%= cut.by_id.recall.current_display %>から<%= cut.by_id.recall.recommended_display %>に<% if (cut.by_id.recall.delta > 0) { %>上がります<% } else if (cut.by_id.recall.delta < 0) { %>下がります<% } else { %>保たれます<% } %>。一方、TRUEと予測される対象は<%= cut.by_id.predicted_positive.current_display %>件から<%= cut.by_id.predicted_positive.recommended_display %>件に<% if (cut.by_id.predicted_positive.delta > 0) { %>増え<% } else if (cut.by_id.predicted_positive.delta < 0) { %>減り<% } else { %>保たれ<% } %>、適合率は<%= cut.by_id.precision.current_display %>から<%= cut.by_id.precision.recommended_display %>に<% if (cut.by_id.precision.delta > 0) { %>上昇します<% } else if (cut.by_id.precision.delta < 0) { %>低下します<% } else { %>保たれます<% } %>。
<% } %>

### 予測件数

{{threshold_prediction_counts}}

### 予測性能指標

{{threshold_comparison}}

<% } %>

<% if (cut && cut.has_curve) { %>
## 境界値チャート

予測確率をTRUEまたはFALSEに分類する境界値を変えたときに、再現率、適合率、均衡正解率などの評価指標がどのように変化するかを示します。

{{threshold_chart}}

境界値を下げると、より多くの行がTRUEと予測されるため、一般に再現率は高くなります。一方で、実際にはFALSEの行もTRUEと予測されやすくなるため、適合率や特異度は低下する傾向があります。

<% if (cut && cut.available) { %>現在の境界値と推奨境界値を比較することで、TRUEの見逃しをどの程度減らせるか、また、その代わりに誤ったTRUE予測がどの程度増えるかを確認できます。<% } %>特異度やF1スコアなどの指標は、設定の「境界値の検討」で選択するとチャートに追加できます。
<% } %>

# 予測結果

{{data}}

# 補足情報

## 次のステップ

* 変数選択の最適化：統計的に有意でない変数（P値が<%= baseline_p_pct %>%以上）を除外しモデルをシンプルにすることで、モデルの解釈がしやすくなり、過剰適合のリスクも減らすことができます。変数選択のガイドラインは[こちら](https://exploratory.io/note/exploratory/SWF4cTx8)のノートをご覧ください。
<% if (!repeat_by) { %>
* グループ別分析：グループごとに別々のモデルを作成することで、それぞれのグループ内での<%= target %>の決定要因をより詳細に理解できるかもしれません。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
<% } %>
* 非線形関係の検討：<%= target %>と非線形の関係を持つ説明変数はデータを加工することで、より正確にモデル化することができます。
* 外れ値の確認：予測精度に影響を与える可能性のある外れ値がないか確認し、必要に応じて対処することで、モデルの信頼性が向上する可能性があります。外れ値を除去する方法については、[こちら](https://exploratory.io/note/exploratory/Eep7kip3)のノートをご覧ください。
<% if (!test_mode) { %>
* モデルの評価：このモデルの予測性能をより厳密に評価するために、トレーニングデータとテストデータに分けて検証することができます。その場合は、[「設定」](//analytics/settings/test_mode)より「検証」セクションの下の「テストモード」をTRUEに設定し、実行し直してください。
<% } %>
* 新しいデータに対する予測：作成したモデルを使って新しいデータに対して予測をしたいときには、予測をしたい対象のデータフレームに「モデルで予測（アナリティクス・ビュー）」のステップを追加します。詳細は、[こちらのノート](https://exploratory.io/note/exploratory/AAI3Mle3)をご参照ください。
`;

module.exports = template;
