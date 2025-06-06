const template = `
# 分析結果

<% if (!repeat_by) { %>

<%= explanatory %>による<%= target %>の中央値の差が有意かどうかを調べました。

{{summary}}

<% if (p > baseline_p) { %>
  結果として、P値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より大きいため、<%= explanatory %>による<%= target %>の中央値の差は統計的に有意とは言えません。
<% } %>

<% if (p <= baseline_p) { %>
  結果として、P値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より低いため、<%= explanatory %>による<%= target %>の中央値の差は統計的に有意だと言えます。
<% } %>

<% } else { %>

<%= explanatory %>による<%= target %>の中央値の差が有意かどうかを<%= repeat_by %>ごとに調べました。

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

* U値
  * U値はウィルコクソン順位和検定（Mann-Whitney U検定とも呼ばれる）の検定統計量で、2つのグループ間のランク（順位）の差を数値化したものです。
  * U値が極端に小さいか大きい場合、2つのグループのランク分布に差があることを示します。ただし、具体的な判断基準はサンプルサイズにより異なります。

* P値
  * P値は観測されたデータが帰無仮説（2つのグループ間に差がない）と同等かそれ以上に極端である確率を示します。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* ベースレベル
  * ベースレベルは比較の基準となるグループを示します。
  * ウィルコクソン検定では、どちらのグループのランクが高いか（または低いか）を判断する際の基準点になります。

* 行数
  * 行数は分析に使用したデータの総数（サンプルサイズ）です。
  * ウィルコクソン検定では各グループの行数も重要で、これらの値がU値の解釈に影響します。
  * 一般的に各グループ10以上のサンプルがあると検定の精度が高まりますが、少ないサンプルでも実施可能です。
{end_show_hide}

# 有意性

有意性については、P値によって判断できます。

## 有意性 - P値

この検定における帰無仮説は「<%= group_a %>と<%= group_b %>の<%= target %>の中央値に差がない」というものです。

<% if (!repeat_by) { %>

<% if (p > baseline_p) { %>
  検定の結果、P値が<%= p_pct %>% (<%= p %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータにおけるウィルコクソン統計量の値（U値: <%= u_value %>）がたまたま得られる確率が約<%= p_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory %>による<%= target %>の中央値の差は統計的に有意であると言えません。
<% } %>

<% if (p <= baseline_p) { %>
  検定の結果、P値が<%= p_pct %>% (<%= p %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータにおけるウィルコクソン統計量の値（U値: <%= u_value %>）がたまたま得られる確率は約<%= p_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory %>による<%= target %>の中央値の差は統計的に有意であると言えます。
<% } %>

確率分布であるU分布のどのあたりにP値（青い点線）が位置するのかを可視化したのが以下のチャートです。薄い青の領域は（帰無仮説の）棄却領域です。

<% } else { %>

帰無仮説が正しい場合、今回のデータに見られるU値かそれ以上の差がたまたま起きる確率がP値です。有意水準<%= baseline_p_pct %>%より大きければ、帰無仮説を棄却できないため、統計的に有意であるとは言えません。逆に、<%= baseline_p_pct %>%以下であれば、帰無仮説を棄却できるため、統計的に有意であると言えます。

確率分布であるU分布のどのあたりにP値（青い点線）が位置するのかを<%= repeat_by %>ごとに可視化したのが以下のチャートです。薄い青の領域は（帰無仮説の）棄却領域です。

<% } %>

{{probability_chart}}

現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。

# 記述統計情報

## 統計量

それぞれのグループごとの統計値は以下の通りです。

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
{{mean}}
{end_lazy_show_hide}

# 補足情報

## 次のステップ

* 今回は<%= target %>に対する<%= explanatory %>という1つの変数が与える影響を分析しました。しかし、他の変数も<%= target %>に影響している可能性があります。そのため、「線形回帰」などを使った多変量分析を使い、複数の要因を同時に考慮した分析をすることができます。
<% if (!repeat_by) { %>
* 今回の検定は全体に対して行われましたが、グループごとに分けて実施することも可能です。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
<% } %>
* 複数の指標をまとめて一括で検定を行いたい場合、データの形を変更することで可能です。詳細については、[こちら](https://exploratory.io/note/exploratory/mxW2zKb2)のノートをご覧ください。

`;
module.exports = template;