const template = `
<br/>
<!-- intentional new line feed above -->

<% if (predictorColumns.length > 1) { %>
# 多重共線性

{{multicollinearity}}

<% if (max_vif > 10) { %>

このモデルには多重共線性（複数の説明変数間に強い相関関係があること）の問題が見られます。VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。
この問題を解決するためには、VIFの値が10を超えている説明変数の中から必要性が低いものを1つずつ除外し、再実行し、VIFの値が10を超える説明変数がなくなるまで繰り返してください。

<% } else { %>
このモデルには多重共線性（複数の説明変数間に強い相関関係があること）の問題は見られません。（VIFの値が10を超えている説明変数があると、個々の変数の効果を正確に評価することが難しくなります。）
<% } %>
<% } %>

# モデルの指標

<% if (test_mode) { %>
モデルの予測精度や有意性に関する様々な指標を、以下の表にまとめています。現在テストモードであるため、予測精度に対してはトレーニングデータとテストデータ両方に対しての指標を表示しています。
<% } else { %>
モデルの予測精度や有意性に関する様々な指標を以下の表にまとめています。
<% } %>

{{summary}}

## 予測精度

### R2乗

<% if (r_square > 0.8) { %>
  R2乗は<%= r_square_pct %>% (<%= r_square %>)と非常に高く、これは選択された説明変数で<%= target %>のばらつきのほとんどを説明できることを示しています。
<% } else if (r_square > 0.6) { %>
  R2乗は<%= r_square_pct %>% (<%= r_square %>)と高く、これは選択された説明変数で<%= target %>のばらつきをうまく説明できることを示しています。
<% } else if (r_square > 0.4) { %>
  R2乗は<%= r_square_pct %>% (<%= r_square %>)と中程度ですが、選択された説明変数で<%= target %>のばらつきをそれなりに説明できることを示しています。
<% } else if (r_square > 0.2) { %>
  R2乗は<%= r_square_pct %>% (<%= r_square %>)と低いですが、選択された説明変数で<%= target %>のばらつきのある程度の傾向は捉えているが、重要な説明変数が抜けている可能性があります。
<% } else { %>
  R2乗は<%= r_square_pct %>% (<%= r_square %>)と非常に低いため、選択された説明変数では<%= target %>のばらつきはあまり説明できていません。
<% } %>

### RMSE

RMSE（平均二乗誤差のルート）は<%= rmse %>で、この予測モデルを使って予測すると、平均して<%= rmse %>ほど実測値との差がでることが想定されます。

## 有意性

<% if (p > baseline_p) { %>
  モデルのP値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より高いため、選択された説明変数と<%= target %>の関係は統計的に有意とは言えません。
<% } else { %>
  モデルのP値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より低いため、選択された説明変数と<%= target %>の関係は統計的に有意だと言えます。
<% } %>


{start_show_hide}
## モデルの指標の詳細

* R2乗
  * R2乗は目的変数の値のばらつきのうち、このモデルに使われている説明変数によって説明される割合を示します。
  * 値は0から1の間で、1はモデルが完全に目的変数の値を予測できることを意味します。
  * 一般的に0.8以上で非常に高い、0.6～0.8で高い、0.4～0.6で中程度、0.2～0.4で低い、0.2未満で非常に低いモデル適合度と解釈されることが多いです。

* 調整済みR2乗
  * 調整済みR2乗は、R2乗を改良した指標で、モデルに含まれる説明変数の数を考慮して調整されています。
  * R2乗と同じく、値は0から1の間で、1はモデルが完全に目的変数の値を予測できることを意味します。
  * 無意味な説明変数を追加すると調整済みR2乗が減少する特性があり、異なるモデル間の比較に適しています。

* RMSE
  * RMSEは平均二乗誤差の平方根を表し、予測値と実測値の誤差の大きさを測定します。
  * 目的変数と同じ単位で表されるため解釈しやすく、値が小さいほど予測精度が高いことを意味します。
  * 0以上の値を取り、完璧な予測であれば0になります。

* F値
  * F値はモデル全体の有意性を検定するための統計量です。
  * 「モデルが予測に役立っているか」を評価し、値が大きいほど偶然ではなく統計的に意味があると判断されます。
  * 1以上の値を取り、値が大きいほどモデルの有意性が高いことを示します。

* P値
  * P値はモデルやパラメータの統計的有意性を示す確率値です。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* 行数
  * 行数は分析に使用したデータの総数（サンプルサイズ）を示します。
  * サンプルサイズが大きいほど、統計的検定の検出力が高まり、結果の信頼性が向上します。
  * 説明変数にある数値型の列で欠損値が含まれている場合、その行が取り除かれて実行されます。

* 自由度
  * 自由度はモデルにおいて自由に変化できるパラメータ（係数）の数を表します。
  * 係数の表で確認できる変数の数（切片を除く）となります。

* 対数尤度
  * 対数尤度はデータがモデルにどれだけ適合しているかを数値化したものです。
  * 通常は負の値を取り、0に近いほどモデルの適合度が高いことを示します。
  * 主にAICやBICなどの情報量基準の計算に使用されます。

* AIC
  * AIC（赤池情報量基準）はモデルの複雑さと適合度のバランスを評価する指標です。
  * 値が小さいほど優れたモデルとされ、過学習を防ぎながら最適なモデルを選択するのに役立ちます。
  * 値は通常正ですが、対数尤度が大きい場合は負の値になることもあります。

* BIC
  * BIC（ベイズ情報量基準）はAICと同様にモデル選択のための指標ですが、サンプルサイズによる補正がより厳しくなっています。
  * AICよりも単純なモデルを選ぶ傾向があり、値が小さいほど良いモデルと判断されます。
  * 値は通常正ですが、対数尤度が大きい場合は負の値になることもあります。

* 残差逸脱度
  * 残差逸脱度は実測値とモデルによる予測値との差（残差）の二乗和を表します。
  * 値が小さいほどモデルの適合度が高く、モデル診断や比較に使用されます。
  * 0以上の値を取り、完璧なモデルでは0になります。

* 残差の自由度
  * 残差の自由度は残差に関連する自由度で、「データ量（行数） - モデルのパラメータ数」で計算されます。
  * 係数の表で確認できる全ての行の数をデータの行数から引いたものです。
  * 残差の評価や分散の推定に使用され、検定統計量の算出に必要です。

* VIF（最大値）
  * VIF（分散拡大要因）は説明変数間の多重共線性の程度を示す指標です。
  * 一般的にVIFが10以上の変数は多重共線性の問題があると判断されます。
  * 値は1から無限大の間で、1に近いほど多重共線性が少ないことを示します。

{end_show_hide}

# 変数間の関係

<% if (predictorColumns.length > 1) { %>
## 説明変数の重要度

<%= target %>を予測するためにどの説明変数が相対的により重要なのかを表したのが以下のチャートです。

{{variable_importance}}

<% } %>

## 説明変数の影響度

それぞれの説明変数の値が変わると、<%= target %>の値がどのように変わるかを表したのが以下のチャートです。

{{variable_effect}}

グレーの線は実測値とその95%信頼区間を、青い線（または点）は予測値を表します。
説明変数が数値型の場合は、他の変数が一定だった時に、X軸の値が1単位上がった時に予測値がどのように変化していくのかをラインチャートで可視化しています。説明変数が文字列型、ロジカル型の場合はその値での予測値を点として表現しています。

<% if (predictorColumns.length > 1) { %>

統計の予測モデルでは、他の変数が一定だとした時に、その説明変数単体の効果を予測しているため、実測値の平均値と予測値にずれが生じることがあります。もし実測値の平均値と予測値でずれが生じている場合は、その変数は他の変数の効果を内包していることを表します。

_説明変数は上記の「説明変数の重要度」にある重要度の高い順番で並んでいます。_
<% } %>

# 変数の係数と有意性

変数ごとに係数（傾き）とその有意性を判断するためのP値、および信頼区間がリストされています。

{{coefficient_table}}

## 係数の解釈

それぞれの変数の値が1単位変わると<%= target %>の値がどれほど変わるのかを示したのが係数です。

### 係数の解釈の例

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>

* 他の変数の値が一定の場合、<%= variable.variable %>が1単位上がると、<%= target %>は約<%= variable.coef %><% if (variable.coef > 0) { %>上がります<% } else { %>下がります<% } %>。

<% } else if (variable.type == 'logical') { %>

* 他の変数の値が一定の場合、<%= variable.variable %>がTRUEの場合、FALSEに比べ<%= target %>は約<%= variable.coef %>の差があります。  

<% } else { %>

* 他の変数の値が一定の場合、「<%= variable.variable %>」は、ベースレベルである「<%= variable.base_level %>」と比べて約<%= variable.coef %>の差があります。
<% } %>
<% }) %>

## P値を使った有意性の判断

有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の元では、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも大きい説明変数は<%= target %>との関係が統計的に有意だとは言えません。逆に、P値が<%= baseline_p_pct %>% (<%= baseline_p %>)よりも小さい説明変数は<%= target %>との関係が統計的に有意だと言えます。

_現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。_


## 係数と信頼区間の可視化

それぞれの変数の係数と信頼区間をエラーバーを使って可視化したのが以下です。

{{coefficient}}

* それぞれのエラーバーの真ん中の点は係数の値、上下の線はその95%信頼区間を表しています。<%= target %>との関係が有意で、かつその関係が正の説明変数は青、関係が負の説明変数は赤となっています。グレーで表されている説明変数は<%= target %>との関係が有意とは言えません。
* 係数の95%信頼区間は、「真の係数がこの範囲内にある可能性が高い（95%の信頼がある」ことを意味します。そのため、95%信頼区間が0を含んでいる説明変数は、<%= target %>との関係が全くない可能性があるため、統計的に有意だと言えません。逆に、95%信頼区間が0を含んでいない説明変数は、<%= target %>との関係が全くない可能性はほぼないため、統計的に有意だと言えます。
* 有意性の判断はP値または信頼区間によって行うことができ、どちらで判断しても同じ結果となります。

_上記の信頼区間の説明は直感的な説明であって、正確には「同じ母集団から繰り返しサンプルを取り、毎回95％信頼区間を計算した場合、そのうちの95％の区間は真の係数を含む」ということになります。_

### 注意点

これらの係数の値は、あくまでもそれぞれの説明変数の値が1ポイント変わった場合の変化量であり、説明変数同士で単位が異なる場合にはそれらの係数の値を使って<%= target %>との関係の強さを比べることはできません。説明変数間の関係の強さを比べたい場合は、上記の「説明変数の重要度」をご参照ください。

# 補足情報

<% if (!test_mode) { %>
## トレーニングデータに対する予測

トレーニングデータに対して、作成された予測モデルを使って予測した結果が以下の表となります。
<% } else { %>
## トレーニング・テストデータに対する予測

トレーニングデータとテストデータに対して、作成された予測モデルを使って予測した結果が以下の表となります。
<% } %>

{start_lazy_show_hide}
### 予測結果
{{data}}
{end_lazy_show_hide}

## 実測値と予測値の関係

<% if (!test_mode) { %>
予測した結果、元の実測値と予測値にはズレがありますが、それらの関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。
<% } else { %>
予測した結果、元の実測値と予測値にはズレがありますが、それらの関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### チャート
{{actual_predicted}}
{end_lazy_show_hide}

## 予測値と残差の関係

<% if (!test_mode) { %>
予測した結果、予測値と残差（元の実測値と予測値のズレ）の関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。
<% } else { %>
予測した結果、予測値と残差（元の実測値と予測値のズレ）の関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### チャート
{{predicted_residual}}
{end_lazy_show_hide}

## 残差の分布

<% if (!test_mode) { %>
残差（元の実測値と予測値のズレ）のばらつきをヒストグラムを使って可視化したのが以下のチャートです。
<% } else { %>
残差（元の実測値と予測値のズレ）のばらつきをヒストグラムを使って可視化したのが以下のチャートです。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### チャート
{{residual}}
{end_lazy_show_hide}

## 次のステップ

* 変数選択の最適化：統計的に有意でない変数（P値が<%= 100 * baseline_p %>%以上）を除外しモデルをシンプルにすることで、モデルの解釈がしやすくなり、過剰適合のリスクも減らすことができます。その場合は、R2乗ではなく、調整済みR2乗をモデルの精度を測る指標として使うことをお勧めします。
* グループ別分析：グループごとに別々のモデルを作成することで、それぞれのグループ内での<%= target %>の決定要因をより詳細に分析できます。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
* 非線形関係の検討：<%= target %>と非線形の関係を持つ説明変数はデータを加工することで、より正確にモデル化することができます。
* 外れ値の確認：予測精度に影響を与える可能性のある外れ値がないか確認し、必要に応じて対処することで、モデルの信頼性が向上する可能性があります。
<% if (!test_mode) { %>
* モデルの評価：このモデルの予測性能をより厳密に評価するために、トレーニングデータとテストデータに分けて検証することができます。その場合は、[「設定」](//analytics/settings)より「検証」セクションの下の「テストモード」をTRUEに設定し、実行し直してください。
<% } %>

`;

module.exports = template;
