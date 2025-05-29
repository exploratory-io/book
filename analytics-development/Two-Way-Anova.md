const template = `
# サマリ

<% if (!repeat_by) { %>

<%= explanatory1 %>と<%= explanatory2 %>による<%= target %>の平均の差、およびそれらの交互作用が有意かどうかを調べました。

{{summary}}

<% if (p1 > baseline_p && p2 > baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）、および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）のいずれも有意水準5%（0.05）より大きいため、<%= target %>の平均の差は統計的に有意とは言えません。
<% } %>

<% if (p1 <= baseline_p && p2 > baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。

 <% if (effect_size1 < 0.06) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%と低く、<%= explanatory1 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size1 < 0.14) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%なので、<%= explanatory1 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory1 %>の効果量（Eta2乗）も<%= effect_size1_pct %>%と大きく、<%= explanatory1 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 <= baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。

 <% if (effect_size2 < 0.06) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%と低く、<%= explanatory2 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size2 < 0.14) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%なので、<%= explanatory2 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory2 %>の効果量（Eta2乗）も<%= effect_size2_pct %>%と大きく、<%= explanatory2 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 > baseline_p && p_interaction <= baseline_p) { %>
結果として、<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）および<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。

 <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は中程度です。
 <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 <= baseline_p && p_interaction > baseline_p) { %>
結果として、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）および<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）はいずれも有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。

 <% if (effect_size1 < 0.06) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%と低く、<%= explanatory1 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size1 < 0.14) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%なので、<%= explanatory1 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory1 %>の効果量（Eta2乗）も<%= effect_size1_pct %>%と大きく、<%= explanatory1 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>

 <% if (effect_size2 < 0.06) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%と低く、<%= explanatory2 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size2 < 0.14) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%なので、<%= explanatory2 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory2 %>の効果量（Eta2乗）も<%= effect_size2_pct %>%と大きく、<%= explanatory2 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 > baseline_p && p_interaction <= baseline_p) { %>
結果として、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）が有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。交互作用が有意である場合、主効果の解釈は慎重に行う必要があります。

 <% if (effect_size1 < 0.06) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%と低く、<%= explanatory1 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size1 < 0.14) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%なので、<%= explanatory1 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory1 %>の効果量（Eta2乗）も<%= effect_size1_pct %>%と大きく、<%= explanatory1 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は中程度です。
 <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 > baseline_p && p2 <= baseline_p && p_interaction <= baseline_p) { %>
結果として、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）が有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意ですが、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）は有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より大きいため統計的に有意とは言えません。交互作用が有意である場合、主効果の解釈は慎重に行う必要があります。

 <% if (effect_size2 < 0.06) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%と低く、<%= explanatory2 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size2 < 0.14) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%なので、<%= explanatory2 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory2 %>の効果量（Eta2乗）も<%= effect_size2_pct %>%と大きく、<%= explanatory2 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は中程度です。
 <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>

<% if (p1 <= baseline_p && p2 <= baseline_p && p_interaction <= baseline_p) { %>
結果として、<%= explanatory1 %>の主効果（P値: <%= p1_pct %>%）、<%= explanatory2 %>の主効果（P値: <%= p2_pct %>%）、および<%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値: <%= p_interaction_pct %>%）のすべてが有意水準<%= baseline_p_pct %>%（<%= baseline_p %>）より低いため統計的に有意です。交互作用が有意である場合、主効果の解釈は慎重に行う必要があります。

 <% if (effect_size1 < 0.06) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%と低く、<%= explanatory1 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size1 < 0.14) { %>
<%= explanatory1 %>の効果量（Eta2乗）は<%= effect_size1_pct %>%なので、<%= explanatory1 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory1 %>の効果量（Eta2乗）も<%= effect_size1_pct %>%と大きく、<%= explanatory1 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>

 <% if (effect_size2 < 0.06) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%と低く、<%= explanatory2 %>による<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size2 < 0.14) { %>
<%= explanatory2 %>の効果量（Eta2乗）は<%= effect_size2_pct %>%なので、<%= explanatory2 %>による<%= target %>の平均の差は中程度です。
 <% } else { %>
<%= explanatory2 %>の効果量（Eta2乗）も<%= effect_size2_pct %>%と大きく、<%= explanatory2 %>による<%= target %>の平均の差は大きいと言えます。
 <% } %>

 <% if (effect_size_interaction < 0.06) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は小さなものです。
 <% } else if (effect_size_interaction < 0.14) { %>
交互作用の効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は中程度です。
 <% } else { %>
交互作用の効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせによる<%= target %>の平均の差は大きいと言えます。
 <% } %>
<% } %>


<% } else { %>

<%= explanatory %>による<%= target %>の平均の差が有意かどうかを<%= repeat_by %>ごとに調べました。

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
## 主要な統計指標
* 変数
  * 変数は分析に含まれる要因（因子）の名前を示します。Two-Way ANOVA（二元配置分散分析）では主に「要因A」「要因B」「交互作用（A×B）」の3つが表示されます。
  * 要因Aと要因Bは各独立変数、交互作用は2つの要因が組み合わさった効果を示します。
  * 交互作用が有意な場合、ある要因の効果がもう一方の要因のレベルによって異なることを意味します。

* 2乗和
  * 2乗和（平方和）は、データのばらつきを数値化したものです。各要因および交互作用の2乗和はそれぞれの要因によるばらつきを表します。
  * 0以上の値を取り、値が大きいほどその要因によるばらつきが大きいことを示します。
  * 単位はデータの単位の2乗になるため、そのままでは解釈が難しく、F値や効果量の計算に使用されます。

* 2乗比率
  * 2乗比率は、全体のばらつきに対する各要因のばらつきの割合を示します。
  * 0から1の間の値を取り、値が大きいほどその要因による影響が大きいことを示します。
  * この値はEta2乗に相当することが多く、効果の大きさの目安になります。

* 自由度
  * 自由度はデータの独立した情報量を表し、要因Aの自由度は「Aのレベル数-1」、要因Bの自由度は「Bのレベル数-1」、交互作用の自由度は「Aの自由度×Bの自由度」、誤差の自由度は「全データ数-グループ数」で計算されます。
  * 常に正の整数値を取り、値が大きいほど多くの情報が分析に含まれています。
  * 自由度はF値の解釈に不可欠で、F分布表と合わせてP値を求める際に使用されます。

* 2乗平均
  * 2乗平均は「2乗和÷自由度」で計算され、自由度で調整された分散の指標です。
  * 0以上の値を取り、各要因の2乗平均と誤差の2乗平均の比がF値になります。
  * 2乗平均自体は単位がデータの単位の2乗なので、直接解釈するより比率（F値）で解釈します。

* F値
  * F値は「各要因の2乗平均÷誤差の2乗平均」で、その要因の効果が誤差と比べてどれだけ大きいかを示します。
  * 1より大きいほどその要因の効果が意味を持つ可能性が高く、値が大きいほどその可能性が高まります。
  * 具体的な判断基準は自由度によって異なり、F分布表と照らし合わせて解釈します。

* P値
  * P値は観測されたデータが帰無仮説（要因の効果がない）と同等かそれ以上に極端である確率を示します。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* Eta2乗
  * Eta2乗は効果量の指標で、全体のばらつきに対する各要因のばらつきの割合を示します。
  * 値は0から1の間で、0は効果がないこと、1は全てのばらつきがその要因で説明できることを示します。
  * 一般的に0.01は小さい効果、0.06は中程度の効果、0.14以上は大きい効果と解釈されます。

* Partial Eta2乗
  * Partial Eta2乗は効果量の指標で、「他の要因の効果を除いた後の」効果の大きさを示します。
  * 値は0から1の間で、値が大きいほどその要因の効果が大きいことを示します。
  * 二元配置分散分析では、各要因と交互作用の効果を個別に評価する際に特に有用です。

* Cohen's F
  * Cohen's Fは効果量の指標で、要因の効果と誤差の比率に基づきます。
  * 値は0以上で、0.1は小さい効果、0.25は中程度の効果、0.4以上は大きい効果と解釈されます。
  * 異なる研究間で効果の大きさを比較する際に有用です。

* Omega2乗
  * Omega2乗はEta2乗を改良した効果量の指標で、サンプルサイズによるバイアスが小さいとされています。
  * 値は0から1の間（厳密には負の値も取りうる）で、値が大きいほど効果が大きいことを示します。
  * 一般的にEta2乗より若干小さい値になり、サンプルサイズが小さい場合や将来の研究への一般化を考える際に推奨されます。
{end_show_hide}

# 有意性

有意性についてはP値を元に判断できます。

<% if (!repeat_by) { %>
## <%= explanatory1 %>の主効果（P値）

<%= explanatory1 %>の主効果に関する帰無仮説は「<%= explanatory1 %>の複数のグループ間で<%= target %>の平均には差がない」というものです。

<% if (p1 > baseline_p) { %>
検定の結果、P値が<%= p1_pct %>% (<%= p1 %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= main_effect1_f %>）がたまたま得られる確率が約<%= p1_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory1 %>による<%= target %>の平均の差は統計的に有意であると言えません。
<% } %>

<% if (p1 <= baseline_p) { %>
検定の結果、P値が<%= p1_pct %>% (<%= p1 %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= main_effect1_f %>）がたまたま得られる確率は約<%= p1_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory1 %>による<%= target %>の平均の差は統計的に有意であると言えます。
<% } %>

## <%= explanatory2 %>の主効果（P値）

<%= explanatory2 %>の主効果に関する帰無仮説は「<%= explanatory2 %>の複数のグループ間で<%= target %>の平均には差がない」というものです。

<% if (p2 > baseline_p) { %>
検定の結果、P値が<%= p2_pct %>% (<%= p2 %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= main_effect2_f %>）がたまたま得られる確率が約<%= p2_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory2 %>による<%= target %>の平均の差は統計的に有意であると言えません。
<% } %>

<% if (p2 <= baseline_p) { %>
検定の結果、P値が<%= p2_pct %>% (<%= p2 %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= main_effect2_f %>）がたまたま得られる確率は約<%= p2_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory2 %>による<%= target %>の平均の差は統計的に有意であると言えます。
<% } %>

## <%= explanatory1 %> * <%= explanatory2 %>の交互作用（P値）

<%= explanatory1 %>と<%= explanatory2 %>の交互作用に関する帰無仮説は「<%= explanatory1 %>による<%= target %>の平均への影響は<%= explanatory2 %>の各グループで同じである」というものです。

<% if (p_interaction > baseline_p) { %>
検定の結果、P値が<%= p_interaction_pct %>% (<%= p_interaction %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= interaction_f %>）がたまたま得られる確率が約<%= p_interaction_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory1 %>と<%= explanatory2 %>の交互作用は統計的に有意であると言えません。
<% } %>

<% if (p_interaction <= baseline_p) { %>
検定の結果、P値が<%= p_interaction_pct %>% (<%= p_interaction %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのようなF値（<%= interaction_f %>）がたまたま得られる確率は約<%= p_interaction_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>)の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory1 %>と<%= explanatory2 %>の交互作用は統計的に有意であると言えます。
<% } %>

<% } else { %>

帰無仮説が正しい場合、今回のデータに見られる差かそれ以上の差がたまたま起きる確率がP値です。有意水準<%= baseline_p_pct %>%より大きければ、帰無仮説を棄却できないため、統計的に有意であるとは言えません。逆に、<%= baseline_p_pct %>%以下であれば、帰無仮説を棄却できるため、統計的に有意であると言えます。

確率分布であるF分布のどのあたりにP値（青い点線）が位置するのかを、<%= repeat_by %>ごとに可視化したのが以下のチャートです。薄い青の領域は（帰無仮説の）棄却領域です。

<% } %>


{{probability_dist}}

現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。

## 効果量

統計的有意性（P値）はサンプルサイズが大きいと、小さな差でも「有意」と判定されることがあるために、効果量を元にして実際の効果の大きさを評価することができます。

この検定では効果量の1つであるEta（イータ）2乗が<%= effect_size %>と示されています。これは、<%= explanatory %>による<%= target %>の平均値のばらつきの大きさの全体のばらつきに対する比率です。つまり、<%= target %>のばらつきの大きさの<%= effect_size %>が<%= explanatory %>によって説明できると解釈できます。

効果量（Eta2乗）の大きさの判断のための目安は以下のとおりです。

| 効果量の値 | 効果量の大きさ |
|------------|------------|
| 0.01 | 小さい効果 |
| 0.06 | 中くらいの効果 |
| 0.14 | 大きい効果 |

<% if (!repeat_by) { %>

<% if (p1 <= baseline_p) { %>

### <%= explanatory1 %>の主効果の効果量
この検定では効果量の1つであるEta（イータ）2乗が<%= effect_size1 %>と示されています。これは、<%= explanatory1 %>による<%= target %>の平均値のばらつきの大きさの全体のばらつきに対する比率です。つまり、<%= target %>のばらつきの大きさの<%= effect_size1_pct %>%が<%= explanatory1 %>によって説明できると解釈できます。

<% if (effect_size1 < 0.06) { %>
効果量（Eta2乗）は<%= effect_size1_pct %>%と低く、<%= explanatory1 %>による<%= target %>の平均の差は小さなものです。
<% } else if (effect_size1 < 0.14) { %>
効果量（Eta2乗）は<%= effect_size1_pct %>%なので、<%= explanatory1 %>による<%= target %>の平均の差は中程度です。
<% } else { %>
効果量（Eta2乗）も<%= effect_size1_pct %>%と大きく、<%= explanatory1 %>による<%= target %>の平均の差は大きいと言えます。
<% } %>
<% } %>

<% if (p2 <= baseline_p) { %>
### <%= explanatory2 %>の主効果の効果量
この検定では効果量の1つであるEta（イータ）2乗が<%= effect_size2 %>と示されています。これは、<%= explanatory2 %>による<%= target %>の平均値のばらつきの大きさの全体のばらつきに対する比率です。つまり、<%= target %>のばらつきの大きさの<%= effect_size2_pct %>%が<%= explanatory2 %>によって説明できると解釈できます。

<% if (effect_size2 < 0.06) { %>
効果量（Eta2乗）は<%= effect_size2_pct %>%と低く、<%= explanatory2 %>による<%= target %>の平均の差は小さなものです。
<% } else if (effect_size2 < 0.14) { %>
効果量（Eta2乗）は<%= effect_size2_pct %>%なので、<%= explanatory2 %>による<%= target %>の平均の差は中程度です。
<% } else { %>
効果量（Eta2乗）も<%= effect_size2_pct %>%と大きく、<%= explanatory2 %>による<%= target %>の平均の差は大きいと言えます。
<% } %>
<% } %>

<% if (p_interaction <= baseline_p) { %>
### <%= explanatory1 %> * <%= explanatory2 %>の交互作用の効果量
この検定では効果量の1つであるEta（イータ）2乗が<%= effect_size_interaction %>と示されています。これは、<%= explanatory1 %>と<%= explanatory2 %>の交互作用による<%= target %>の平均値のばらつきの大きさの全体のばらつきに対する比率です。つまり、<%= target %>のばらつきの大きさの<%= effect_size_interaction_pct %>%が<%= explanatory1 %>と<%= explanatory2 %>の交互作用によって説明できると解釈できます。

<% if (effect_size_interaction < 0.06) { %>
効果量（Eta2乗）は<%= effect_size_interaction_pct %>%と低く、<%= explanatory1 %>と<%= explanatory2 %>の交互作用による<%= target %>の平均の差は小さなものです。
<% } else if (effect_size_interaction < 0.14) { %>
効果量（Eta2乗）は<%= effect_size_interaction_pct %>%なので、<%= explanatory1 %>と<%= explanatory2 %>の交互作用による<%= target %>の平均の差は中程度です。
<% } else { %>
効果量（Eta2乗）も<%= effect_size_interaction_pct %>%と大きく、<%= explanatory1 %>と<%= explanatory2 %>の交互作用による<%= target %>の平均の差は大きいと言えます。
<% } %>
<% } %>

<% } else { %>

効果量は検定結果において有意と判断した場合に注意する必要があります。有意でなければ、特に注意する必要はありません。

<% } %>

# 多重比較 - 変数

多重比較分析とは各変数のグループのどの組み合わせにおける<%= target %>の平均の差が有意なのかを調べるためのものです。多重比較のために同じような検定を繰り返し何度も行うと、本当は有意でないのに有意であると判断してしまう（タイプ１エラー）確率が上がってしまいます。検定結果には<%= correction %>補正をかけることで、タイプ１エラーの確率を想定内にコントロールしています。

以下のP値が有意水準の5%以下である組み合わせは、<%= target %>の平均の差が統計的に有意だと言えます。

{{comparison}}

# 多重比較 - 交互作用

交互作用の多重比較分析とは、<%= explanatory1 %>と<%= explanatory2 %>の組み合わせのどのペアにおける<%= target %>の平均の差が有意なのかを調べるためのものです。多重比較のために同じような検定を繰り返し何度も行うと、本当は有意でないのに有意であると判断してしまう（タイプ１エラー）確率が上がってしまいます。検定結果には<%= correction %>補正をかけることで、タイプ１エラーの確率を想定内にコントロールしています。

以下のP値が有意水準の5%以下である組み合わせは、<%= target %>の平均の差が統計的に有意だと言えます。

{{interaction_comparison}}

# 記述統計情報

## 統計値

それぞれのグループごとの統計値は以下の通りです。

{{statistics}}

## データの分布

<%= explanatory1 %>と<%= explanatory2 %>による<%= target %>分布の違いを密度曲線を使って可視化したものが以下となります。

{start_lazy_show_hide}
### チャート
{{distribution}}
{end_lazy_show_hide}

## 平均値の交互作用(ライン)

<%= explanatory1 %>と<%= explanatory2 %>による<%= target %>への交互作用を可視化したものが以下となります。

{start_lazy_show_hide}
### チャート
{{mean_line}}
{end_lazy_show_hide}

# 次のステップ

* 今回は<%= target %>に対する<%= explanatory1 %>と<%= explanatory2 %>という2つの変数が与える影響を分析しました。しかし、他の変数も<%= target %>に影響している可能性があります。そのため、「線形回帰」などを使った多変量分析を使い、複数の要因を同時に考慮した分析をすることができます。
<% if (!repeat_by) { %>
* 今回の検定は全体に対して行われましたが、グループごとに分けて実施することも可能です。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
<% } %>
* 複数の指標をまとめて一括で検定を行いたい場合、データの形を変更することで可能です。詳細については、[こちら](https://exploratory.io/note/exploratory/mxW2zKb2)のノートをご覧ください。

`;

module.exports = template;

