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

下のチャートはt分布を示しています。点線は観測されたt値を示し、網掛けの領域は有意水準における棄却域です。t値が網掛けの領域に入っているとき、観測された平均値は仮説平均値と統計的に有意に異なります。

{{probability_dist}}

下のチャートは同じ検定を平均値のスケールで示したものです。これは、母平均が仮説平均値に等しいという仮定のもとでの標本平均のt分布（仮説平均値を中心とする）で、その広がりは標準誤差によって決まります。点線は観測された平均値を示し、網掛けの領域は有意水準における棄却域です。観測された平均値が網掛けの領域に入っているとき、それは仮説平均値と統計的に有意に異なります。

{{probability_dist_mean}}

下のチャートは観測された平均値とその信頼区間を示しています。信頼区間が仮説平均値を含まないとき、その水準で差は統計的に有意です。

{{confidence_interval}}


`;

module.exports = template;
