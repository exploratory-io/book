const template = `

# サマリ

1標本の比率検定は、観測された比率がベンチマーク比率と統計的に異なるかどうかを検定します。

<% if (!repeat_by) { %>
<%= target_col %>列における真の割合は<%= observed_pct %>%（<%= n_total %>件中<%= n_success %>件）で、ベンチマーク値<%= benchmark_pct %>%と比較しています。

<% if (significant) { %>
差（<%= difference_pct %>ポイント）は<%= sig_level_pct %>%水準で**統計的に有意**です（p = <%= p_value %>）。観測された比率はベンチマークと異なると言えます。
<% } else { %>
差（<%= difference_pct %>ポイント）は<%= sig_level_pct %>%水準で**統計的に有意ではありません**（p = <%= p_value %>）。観測された比率がベンチマークと異なるとは言えません。
<% } %>
<% } else { %>
<%= target_col %>における真の割合がベンチマーク値<%= benchmark_pct %>%と異なるかどうかを<%= repeat_by %>ごとに調べました。

<% if (groups.some(group => group.significant)) { %>
以下のグループにおいては、差が<%= sig_level_pct %>%水準で**統計的に有意**です。
  <% groups.forEach(group => { %>
    <% if (group.significant) { %>
* <%= group.name %>（観測値 <%= group.observed_pct %>%、p = <%= group.p_value %>）
    <% } %>
  <% }); %>
<% } %>
<% if (groups.some(group => !group.significant)) { %>
以下のグループにおいては、差が<%= sig_level_pct %>%水準で**統計的に有意ではありません**。
  <% groups.forEach(group => { %>
    <% if (!group.significant) { %>
* <%= group.name %>（観測値 <%= group.observed_pct %>%、p = <%= group.p_value %>）
    <% } %>
  <% }); %>
<% } %>
<% } %>

{{summary_chart}}


{start_show_hide}
## 統計指標の説明

**効果量（Cohen's h）**: Cohen's h は観測された比率とベンチマークの差の大きさを表します。0.2、0.5、0.8はそれぞれ小、中、大の効果を示します。

**検出力（Power）**: 検出力は、真の差があるときにそれを正しく検出できる確率です。一般的に0.8以上が望ましいとされています。

**検定方法**: 正確二項検定はサンプルが小さい場合（n×p < 5 または n×(1-p) < 5）に使用されます。近似検定はイェーツの連続補正なしの正規近似を使用します。
{end_show_hide}

# チャート

{{probability_dist}}

{{confidence_interval}}


`;

module.exports = template;
