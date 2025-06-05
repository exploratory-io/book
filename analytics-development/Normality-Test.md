const template = `

正規性検定は、データが正規分布に従っているかどうかを統計的に検証する手法です。今回の分析ではShapiro-Wilk検定を使用しています。

* **W値**：1に近いほど正規分布に近いことを示します。1が最大値です。
* **P値**：帰無仮説（データが正規分布に従っている）を棄却するかどうかの基準となる値です。一般的に0.05未満の場合、データは正規分布していないと判断されます。

# 正規性検定の結果

今回の分析では、以下の変数の正規性検定を行いました：
<% variables.forEach(function(variable) { %>
* <%= variable.column %>
<% }); %>

{{summary_chart}}


正規性検定の結果は以下のとおりです。

<% if (variables.some(variable => variable.p > baseline_p)) { %>
以下の変数においては、P値が有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より高いため、正規分布であると判断できます。
  <% variables.forEach(variable => { %>
    <% if (variable.p > baseline_p) { %>
* **<%= variable.column %>**: W値が <%= variable.w %> で、P値は <%= variable.p %> です。
    <% } %>
  <% }); %>
<% } %>

<% if (variables.some(variable => variable.p <= baseline_p)) { %>
以下の変数においては、P値が有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より低いため、正規分布でないと判断できます。
  <% variables.forEach(variable => { %>
    <% if (variable.p <= baseline_p) { %>
* **<%= variable.column %>**: W値が <%= variable.w %> で、P値は <%= variable.p %> です。
    <% } %>
  <% }); %>
<% } %>


# Q-Qプロット

Q-Qプロットは、データが正規分布に従っているかを視覚的に確認するためのグラフです。データが完全に正規分布している場合、プロット上の点は対角線上に並びます。

{{qq_plot}}

* 点が対角線に沿って直線的に並んでいる場合：データは正規分布に従っている可能性が高い
* 点が対角線から大きく離れている場合：データは正規分布に従っていない可能性が高い

# ヒストグラム

ヒストグラムはデータの分布を視覚的に表示します。正規分布の場合、釣り鐘型の対称的な形状を示します。

{{histogram}}

* 分布が釣り鐘型で左右対称である場合：データは正規分布に近い
* 分布が歪んでいたり、複数のピークがある場合：データは正規分布から逸脱している
`;

module.exports = template;
