const template = `

# サマリ

1標本のt検定は、観測された平均値が仮説平均値と統計的に異なるかどうかを検定します。

<% if (!repeat_by) { %>
<%= target_col %>列における観測された平均値は<%= observed_mean %>（n = <%= n_total %>）で、仮説平均値<%= mu %>と比較しています。

<% if (significant) { %>
差（<%= difference %>）は<%= sig_level_pct %>%水準で**統計的に有意**です（p = <%= p_value %>）。観測された平均値は仮説平均値と異なると言えます。
<% } else { %>
差（<%= difference %>）は<%= sig_level_pct %>%水準で**統計的に有意ではありません**（p = <%= p_value %>）。観測された平均値が仮説平均値と異なるとは言えません。
<% } %>
<% } else { %>
<%= target_col %>における観測された平均値が仮説平均値<%= mu %>と異なるかどうかを<%= repeat_by %>ごとに調べました。

<% if (groups.some(group => group.significant)) { %>
以下のグループにおいては、差が<%= sig_level_pct %>%水準で**統計的に有意**です。
  <% groups.forEach(group => { %>
    <% if (group.significant) { %>
* <%= group.name %>（観測値 <%= group.observed_mean %>、p = <%= group.p_value %>）
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => !group.significant)) { %>
以下のグループにおいては、差が<%= sig_level_pct %>%水準で**統計的に有意ではありません**。
  <% groups.forEach(group => { %>
    <% if (!group.significant) { %>
* <%= group.name %>（観測値 <%= group.observed_mean %>、p = <%= group.p_value %>）
    <% } %>
  <% }); %>
<% } %>
<% } %>

{{summary_chart}}


{start_show_hide}
## 統計指標の説明

**効果量（Cohen's d）**: Cohen's d は観測された平均値と仮説平均値の差の大きさを表します。0.2、0.5、0.8はそれぞれ小、中、大の効果を示します。

**検出力（Power）**: 検出力は、真の差があるときにそれを正しく検出できる確率です。一般的に0.8以上が望ましいとされています。

**t検定**: 1標本t検定はt分布を使用して標本平均を既知または仮説の値と比較します。母集団平均が特定の値と等しいかどうかを検定したい場合に、連続した数値変数に対して適しています。
{end_show_hide}

# チャート

{{probability_dist}}

次のチャートは同じ結果を平均値スケールで示したものです。仮説平均を中心とした標本平均の確率分布で、観測された平均値が示されています。

{{probability_dist_mean}}

{{confidence_interval}}


`;

module.exports = template;
