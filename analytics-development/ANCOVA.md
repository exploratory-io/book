const template = `
# サマリ

<% if (!repeat_by) { %>

共変量として<%= covariate %>を調整した上で、<%= explanatory %>による<%= target %>の平均の差が有意かどうかを調べました。

{{summary}}

<% if (p_explanatory > baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory %>の主効果（P値: <%= p_explanatory_pct %>%）および<%= explanatory %> * <%= covariate %>の交互作用（P値: <%= p_interaction_pct %>%）のいずれも有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は統計的に有意とは言えません。
<% } %>

<% if (p_explanatory <= baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory %>の主効果（P値: <%= p_explanatory_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。<%= explanatory %> * <%= covariate %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意です。

  <% if (effect_size_explanatory < 0.06) { %>
<%= explanatory %>の効果量（Eta2乗）は<%= effect_size_explanatory_pct %>%と低く、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は小さなものです。
  <% } else if (effect_size_explanatory < 0.14) { %>
<%= explanatory %>の効果量（Eta2乗）は<%= effect_size_explanatory_pct %>%なので、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は中程度です。
  <% } else { %>
<%= explanatory %>の効果量（Eta2乗）も<%= effect_size_explanatory_pct %>%と大きく、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は大きいと言えます。
  <% } %>
<% } %>

<% if (p_explanatory > baseline_p && p_interaction <= baseline_p) { %>
  結果として、<%= explanatory %> * <%= covariate %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory %>の主効果（P値: <%= p_explanatory_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。交互作用が有意であることは、<%= explanatory %>による<%= target %>への影響が<%= covariate %>の値によって異なることを示しています。

  <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は小さなものです。
  <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は中程度です。
  <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は大きいと言えます。
  <% } %>
<% } %>

<% if (p_explanatory <= baseline_p && p_interaction <= baseline_p) { %>
結果として、<%= explanatory %>の主効果（P値: <%= p_explanatory_pct %>%）および<%= explanatory %> * <%= covariate %>の交互作用（P値: <%= p_interaction_pct %>%）のいずれも有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意です。交互作用が有意であることは、<%= explanatory %>による<%= target %>への影響が<%= covariate %>の値によって異なることを示しています。したがって、<%= explanatory %>の主効果の解釈は慎重に行う必要があります。

  <% if (effect_size_explanatory < 0.06) { %>
<%= explanatory %>の効果量（Eta2乗）は<%= effect_size_explanatory_pct %>%と低く、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は小さなものです。
  <% } else if (effect_size_explanatory < 0.14) { %>
<%= explanatory %>の効果量（Eta2乗）は<%= effect_size_explanatory_pct %>%なので、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は中程度です。
  <% } else { %>
<%= explanatory %>の効果量（Eta2乗）も<%= effect_size_explanatory_pct %>%と大きく、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は大きいと言えます。
  <% } %>

  <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は小さなものです。
  <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は中程度です。
  <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory %>と<%= covariate %>の交互作用による<%= target %>の平均の差は大きいと言えます。
  <% } %>
<% } %>

<% } else { %>

共変量として<%= covariate %>を調整した上で、<%= explanatory %>による<%= target %>の平均の差が有意かどうかを<%= repeat_by %>ごとに調べました。

{{summary}}

<% if (groups.some(group => group.p <= baseline_p)) { %>
以下のグループにおいては、P値が有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より低いため、統計的に有意だと言えます。
  <% groups.forEach(group => { %>
    <% if (group.p <= baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => group.p > baseline_p)) { %>
以下のグループにおいては、P値が有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より高いため、統計的に有意とは言えません。
  <% groups.forEach(group => { %>
    <% if (group.p > baseline_p) { %>
* <%= group.name %>
    <% } %>
  <% }); %>
<% } %>

<% } %>

この検定における有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。

{start_show_hide}
## 統計指標の説明

* 変数
  * 変数は分析に含まれる要因の名前を示します。ANOCOVAでは主に「共変量」「要因（独立変数）」が表示されます。
  * 共変量は統制したい連続変数（例：年齢、スコアなど）、要因は効果を調べたいカテゴリ変数です。

* 2乗和
  * 2乗和（平方和）は、データのばらつきを数値化したものです。共変量の2乗和は共変量によるばらつき、要因の2乗和は共変量の効果を取り除いた後の要因によるばらつきを表します。
  * 0以上の値を取り、値が大きいほどその変数によるばらつきが大きいことを示します。
  * 単位はデータの単位の2乗になるため、そのままでは解釈が難しく、F値や効果量の計算に使用されます。

* 2乗比率
  * 2乗比率は、全体のばらつきに対する各変数のばらつきの割合を示します。
  * 0から1の間の値を取り、値が大きいほどその変数による影響が大きいことを示します。
  * この値はEta2乗に相当することが多く、効果の大きさの目安になります。

* 自由度
  * 自由度はデータの独立した情報量を表し、共変量の自由度は通常1（共変量ごと）、要因の自由度は「レベル数-1」、誤差の自由度は「全データ数-共変量数-グループ数」で計算されます。
  * 常に正の整数値を取り、値が大きいほど多くの情報が分析に含まれています。
  * 自由度はF値の解釈に不可欠で、F分布表と合わせてP値を求める際に使用されます。

* 2乗平均
  * 2乗平均は「2乗和÷自由度」で計算され、自由度で調整された分散の指標です。
  * 0以上の値を取り、各変数の2乗平均と誤差の2乗平均の比がF値になります。
  * 2乗平均自体は単位がデータの単位の2乗なので、直接解釈するより比率（F値）で解釈します。

* F値
  * F値は「各変数の2乗平均÷誤差の2乗平均」で、その変数の効果が誤差と比べてどれだけ大きいかを示します。
  * 1より大きいほどその変数の効果が意味を持つ可能性が高く、値が大きいほどその可能性が高まります。
  * 具体的な判断基準は自由度によって異なり、F分布表と照らし合わせて解釈します。

* P値
  * P値は観測されたデータが帰無仮説（変数の効果がない）と同等かそれ以上に極端である確率を示します。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* Eta2乗
  * Eta2乗は効果量の指標で、全体のばらつきに対する各変数のばらつきの割合を示します。
  * 値は0から1の間で、0は効果がないこと、1は全てのばらつきがその変数で説明できることを示します。
  * 一般的に0.01は小さい効果、0.06は中程度の効果、0.14以上は大きい効果と解釈されます。

* Partial Eta2乗
  * Partial Eta2乗は効果量の指標で、「他の変数の効果を除いた後の」効果の大きさを示します。
  * 値は0から1の間で、値が大きいほどその変数の効果が大きいことを示します。
  * ANOCOVAでは、共変量の効果を調整した後の要因の効果を評価する際に特に有用です。

* Cohen's F
  * Cohen's Fは効果量の指標で、変数の効果と誤差の比率に基づきます。
  * 値は0以上で、0.1は小さい効果、0.25は中程度の効果、0.4以上は大きい効果と解釈されます。
  * 異なる研究間で効果の大きさを比較する際に有用です。

* Omega2乗
  * Omega2乗はEta2乗を改良した効果量の指標で、サンプルサイズによるバイアスが小さいとされています。
  * 値は0から1の間（厳密には負の値も取りうる）で、値が大きいほど効果が大きいことを示します。
  * 一般的にEta2乗より若干小さい値になり、サンプルサイズが小さい場合や将来の研究への一般化を考える際に推奨されます。
{end_show_hide}

# 有意性

有意性については、P値によって判断できます。

## <%= explanatory %>の主効果（P値）

<% if (!repeat_by) { %>

<%= explanatory %>の主効果に関する帰無仮説は「<%= covariate %>の影響を調整した後、<%= explanatory %>の複数のグループ間で<%= target %>の平均には差がない」というものです。

<% if (p_explanatory > baseline_p) { %>
検定の結果、P値が<%= p_explanatory_pct %>% (<%= p_explanatory %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_explanatory %>）がたまたま得られる確率が約<%= p_explanatory_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は統計的に有意であると言えません。
<% } %>

<% if (p_explanatory <= baseline_p) { %>
検定の結果、P値が<%= p_explanatory_pct %>% (<%= p_explanatory %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_explanatory %>）がたまたま得られる確率は約<%= p_explanatory_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= covariate %>の影響を調整した後の<%= explanatory %>による<%= target %>の平均の差は統計的に有意であると言えます。
<% } %>

<% } else { %>

帰無仮説が正しい場合、今回のデータに見られるF値かそれ以上のF値がたまたま得られる確率がP値です。有意水準<%= baseline_p_pct %>%より大きければ、帰無仮説を棄却できないため、統計的に有意であるとは言えません。逆に、<%= baseline_p_pct %>%以下であれば、帰無仮説を棄却できるため、統計的に有意であると言えます。

% } %>

## <%= covariate %>の効果（P値）

<%= covariate %>の効果に関する帰無仮説は「<%= target %>と<%= covariate %>の間に線形関係がない」というものです。

<% if (!repeat_by) { %>

<% if (p_covariate > baseline_p) { %>
検定の結果、P値が<%= p_covariate_pct %>% (<%= p_covariate %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_covariate %>）がたまたま得られる確率が約<%= p_covariate_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= target %>と<%= covariate %>の間に統計的に有意な線形関係があるとは言えません。
<% } %>

<% if (p_covariate <= baseline_p) { %>
検定の結果、P値が<%= p_covariate_pct %>% (<%= p_covariate %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_covariate %>）がたまたま得られる確率は約<%= p_covariate_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= target %>と<%= covariate %>の間に統計的に有意な線形関係があると言えます。
<% } %>

<% } else { %>

帰無仮説が正しい場合、今回のデータに見られるF値かそれ以上のF値がたまたま得られる確率がP値です。有意水準<%= baseline_p_pct %>%より大きければ、帰無仮説を棄却できないため、統計的に有意であるとは言えません。逆に、<%= baseline_p_pct %>%以下であれば、帰無仮説を棄却できるため、統計的に有意であると言えます。

<% } %>


## <%= explanatory %> * <%= covariate %>の交互作用（P値）

<%= explanatory %>と<%= covariate %>の交互作用に関する帰無仮説は「<%= explanatory %>の各グループにおける<%= target %>と<%= covariate %>の関係は同じである」というものです。

<% if (!repeat_by) { %>

<% if (p_interaction > baseline_p) { %>
検定の結果、P値が<%= p_interaction_pct %>% (<%= p_interaction %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_interaction %>）がたまたま得られる確率が約<%= p_interaction_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory %>の各グループにおける<%= target %>と<%= covariate %>の関係に統計的に有意な違いがあるとは言えません。
<% } %>

<% if (p_interaction <= baseline_p) { %>
検定の結果、P値が<%= p_interaction_pct %>% (<%= p_interaction %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= f_interaction %>）がたまたま得られる確率は約<%= p_interaction_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory %>の各グループにおける<%= target %>と<%= covariate %>の関係には統計的に有意な違いがあると言えます。これは、<%= explanatory %>による<%= target %>への影響が<%= covariate %>の値によって異なることを意味します。
<% } %>

<% } else { %>

帰無仮説が正しい場合、今回のデータに見られるF値かそれ以上のF値がたまたま得られる確率がP値です。有意水準<%= baseline_p_pct %>%より大きければ、帰無仮説を棄却できないため、統計的に有意であるとは言えません。逆に、<%= baseline_p_pct %>%以下であれば、帰無仮説を棄却できるため、統計的に有意であると言えます。

<% } %>

<% if (!repeat_by) { %>

確率分布であるF分布のどのあたりにP値（青い点線）が位置するのかを可視化したのが以下のチャートです。F分布は右側検定のため、右側の領域が（帰無仮説の）棄却領域となります。

<% } else { %>

確率分布であるF分布のどのあたりにP値（青い点線）が位置するのかを、<%= repeat_by %>ごとに可視化したのが以下のチャートです。F分布は右側検定のため、右側の領域が（帰無仮説の）棄却領域となります。

<% } %>

{{probability_dist}}

現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。

# 効果量

この検定では効果量としてEta（イータ）2乗を用います。Eta2乗は、説明変数や交互作用が目的変数のばらつきをどの程度説明できるかを示す指標です。値は0から1の間を取り、1に近いほど効果が大きいことを意味します。

以下のテーブルは、ANCOVAにおける効果量（Eta2乗）の解釈の目安を示しています。

| 効果量の値 | 効果量の大きさ |
|------------|------------|
| 0.01 | 小さい効果 |
| 0.06 | 中くらいの効果 |
| 0.14 | 大きい効果 |

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
効果量は検定結果において有意と判断した場合に注意する必要がありますが、今回は有意でないため、特に注意する必要はありません。
<% } %>

<% if (p <= baseline_p) { %>
今回の検定結果は有意と判断できるため、効果量に注意する必要があります。
<% } %>

<% } else { %>

効果量は検定結果において有意と判断した場合に注意する必要があります。有意でなければ、特に注意する必要はありません。

<% } %>

# 多重比較

多重比較分析とは各変数のグループのどの組み合わせにおける<%= target %>の平均の差が有意なのかを調べるためのものです。多重比較のために同じような検定を繰り返し何度も行うと、本当は有意でないのに有意であると判断してしまう（タイプ１エラー）確率が上がってしまいます。検定結果には<%= correction %>補正をかけることで、タイプ１エラーの確率を想定内にコントロールしています。

以下のP値が有意水準の5%以下である組み合わせは、<%= target %>の平均の差が統計的に有意だと言えます。

{{comparison}}

# 記述統計情報

## 統計量

それぞれのグループごとの調整済み統計値は以下の通りです。

{{statistics}}

## データの分布

<%= explanatory %>による<%= target %>の分布の違いを密度曲線を使って可視化したものが以下となります。

{start_lazy_show_hide}
### チャート
{{distribution}}
{end_lazy_show_hide}

## 平均値の信頼区間

それぞれのグループごとの平均の信頼区間をエラーバーを使って可視化したものが以下となります。

{start_lazy_show_hide}
### チャート
{{means}}
{end_lazy_show_hide}

## 平均値（調整済み）

<%= explanatory %>グループごとの<%= covariate %>の平均値で調整した<%= target %>の平均の信頼区間をエラーバーを使って可視化したものが以下となります。

{start_lazy_show_hide}
### チャート
{{adjusted_means}}
{end_lazy_show_hide}

# 次のステップ

* 今回は<%= target %>に対する<%= explanatory %>の影響を、<%= covariate %>を調整した上で分析しました。しかし、他の変数も<%= target %>に影響している可能性があります。そのため、「線形回帰」などを使った多変量分析を使い、複数の要因を同時に考慮した分析をすることができます。
<% if (!repeat_by) { %>
* 今回の検定は全体に対して行われましたが、グループごとに分けて実施することも可能です。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
<% } %>

`;

module.exports = template;