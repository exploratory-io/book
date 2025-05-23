const template = `
# サマリ

<%= explanatory %>による<%= target %>の平均の差が有意かどうかを調べるために、ANOVA検定（分散分析）を行いました。

{{summary_chart}}

<% if (p > baseline_p) { %>
結果として、P値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より大きいため、<%= explanatory %>による<%= target %>の平均の差は統計的に有意とは言えません。

  <% if (power < 0.5) { %>
ただ、検出力が<%= power_pct %>% (<%= power %>)と低く、ほんとうに差があったとしても、見逃す確率（タイプ２エラー）が<%= type2_error_pct %>% (<%= type2_error %>)と非常に高いため注意が必要です。
  <% } else { %>
ただ、検出力が<%= power_pct %>% (<%= power %>)と低めであり、ほんとうに差があったとしても、見逃す確率（タイプ２エラー）が<%= type2_error_pct %>% (<%= type2_error %>)もあるため注意が必要です。
  <% } %>
<% } %>


<% if (p <= baseline_p) { %>
結果として、P値は<%= p_pct %>% (<%= p %>)で、有意水準<%= baseline_p_pct %>% (<%= baseline_p %>) より低いため、<%= explanatory %>による<%= target %>の平均の差は統計的に有意だと言えます。

  <% if (effect_size < 0.06) { %>
効果量（Eta2乗）は<%= effect_size_pct %>% (<%= effect_size %>)と低く、<%= explanatory %>による<%= target %>の平均の差は小さなものです。
  <% } else if (effect_size < 0.14) { %>
効果量（Eta2乗）は<%= effect_size_pct %>% (<%= effect_size %>)なので、<%= explanatory %>による<%= target %>の平均の差は中程度です。
  <% } else { %>
効果量（Eta2乗）も<%= effect_size_pct %>% (<%= effect_size %>)と大きく、<%= explanatory %>による<%= target %>の平均の差は大きいと言えます。
  <% } %>
<% } %>



{start_show_hide}
## 統計指標の説明

* 2乗和
  * 2乗和（平方和）は、データのばらつきを数値化したものです。全体の2乗和は「全体のばらつき」、グループ間の2乗和は「グループの違いによるばらつき」、グループ内の2乗和は「グループ内のばらつき（誤差）」を表します。
  * 0以上の値を取り、値が大きいほどそのばらつきが大きいことを示します。
  * 単位はデータの単位の2乗になるため、そのままでは解釈が難しく、F値や効果量の計算に使用されます。

* 2乗比率
  * 2乗比率は、全体のばらつきに対する各要因（グループ間やグループ内）のばらつきの割合を示します。
  * 0から1の間の値を取り、グループ間の2乗比率が大きいほどグループによる違いが大きいことを示します。
  * この値はEta2乗に相当することが多く、効果の大きさの目安になります。

* 自由度
  * 自由度はデータの独立した情報量を表し、グループ間自由度は「グループ数-1」、グループ内自由度は「全データ数-グループ数」で計算されます。
  * 常に正の整数値を取り、値が大きいほど多くの情報が分析に含まれています。
  * 自由度はF値の解釈に不可欠で、F分布表と合わせてP値を求める際に使用されます。

* 2乗平均
  * 2乗平均は「2乗和÷自由度」で計算され、自由度で調整された分散の指標です。
  * 0以上の値を取り、グループ間の2乗平均とグループ内の2乗平均の比がF値になります。
  * 2乗平均自体は単位がデータの単位の2乗なので、直接解釈するより比率（F値）で解釈します。

* F値
  * F値は「グループ間の2乗平均÷グループ内の2乗平均」で、グループ間の違いがグループ内のばらつきと比べてどれだけ大きいかを示します。
  * 1より大きいほどグループ間の差が意味を持つ可能性が高く、値が大きいほどその可能性が高まります。
  * 具体的な判断基準は自由度によって異なり、F分布表と照らし合わせて解釈します。

* P値
  * P値は「観測されたF値が偶然によって生じた可能性」を示す確率値です。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* 検出力
  * 検出力は「実際にグループ間に差がある場合に、それを統計的に検出できる確率」です。
  * 値は0から1（0%から100%）の間で、一般的には0.8（80%）以上あると良いとされています。
  * 検出力が低いと、実際に存在する差を見逃してしまう可能性が高まります。

* タイプ2エラー
  * タイプ2エラーは「実際にはグループ間に差があるのに、ないと判断してしまう確率」です。
  * 値は0から1の間で、検出力 = 1 - タイプ2エラーの関係があります。
  * 一般的には0.2（20%）以下が望ましいとされています。

* 行数
  * 行数は分析に使用したデータの数（サンプルサイズ）です。
  * データ数が多いほど、小さな差でも検出しやすくなり、結果の信頼性が高まります。
  * ANOVAでは各グループのサンプルサイズがなるべく等しいことが望ましいとされています。

* Eta2乗
  * Eta2乗は効果量の指標で、全体のばらつきに対するグループ間のばらつきの割合を示します。
  * 値は0から1の間で、0は効果がないこと、1は全てのばらつきがグループ間の違いで説明できることを示します。
  * 一般的に0.01は小さい効果、0.06は中程度の効果、0.14以上は大きい効果と解釈されます。

* Partial Eta2乗
  * Partial Eta2乗は効果量の指標で、「他の要因の効果を除いた後の」効果の大きさを示します。
  * 値は0から1の間で、値が大きいほどその要因の効果が大きいことを示します。
  * 複数の要因がある分析（二元配置分散分析など）で各要因の効果を個別に評価する際に便利です。

* Cohen's F
  * Cohen's Fは効果量の指標で、グループ間の違いとグループ内のばらつきの比率に基づきます。
  * 値は0以上で、0.1は小さい効果、0.25は中程度の効果、0.4以上は大きい効果と解釈されます。
  * 異なる研究間で効果の大きさを比較する際に有用です。

* Omega2乗
  * Omega2乗はEta2乗を改良した効果量の指標で、サンプルサイズによるバイアスが小さいとされています。
  * 値は0から1の間（厳密には負の値も取りうる）で、値が大きいほど効果が大きいことを示します。
  * 一般的にEta2乗より若干小さい値になり、サンプルサイズが小さい場合の方が違いが顕著になります。
{end_show_hide}

# 有意性

有意性についてはP値を元に判断できます。


## P値

この検定における帰無仮説は「<%= explanatory %>の複数のグループ間で<%= target %>の平均には差がない」というものです。

<% if (p > baseline_p) { %>
  検定の結果、P値が<%= p_pct %>% (<%= p %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのように<%= mean_diff %>以上の差がたまたま起きる確率が約<%= p_pct %>%であるということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に高いので、帰無仮説を棄却できません。つまり、<%= explanatory %>による<%= target %>の差は統計的に有意であると言えません。
<% } %>

<% if (p <= baseline_p) { %>
  検定の結果、P値が<%= p_pct %>% (<%= p %>)となりました。これは、もし帰無仮説が正しいのであれば、今回のデータのように<%= mean_diff %>以上の差がたまたま起きる確率は約<%= p_pct %>%しかないということです。有意水準が<%= baseline_p_pct %>% (<%= baseline_p %>) の場合、この確率は十分に低いので、帰無仮説を棄却できます。つまり、<%= explanatory %>による<%= target %>の差は統計的に有意であると言えます。
<% } %>


下のチャートはF分布において、F値（縦の点線）がどこに位置するかを可視化したものです。青い色で塗られた領域は、有意水準が<%= 100*baseline_p %>% (<%= baseline_p %>) の場合の帰無仮説の棄却領域です。ここにF値が来た場合、統計的に有意と判断できます。

{{probability_chart}}

現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これはアナリティクスの[「設定」](//analytics/settings)より変更可能です。


# 効果量

この検定では効果量の1つであるEta（イータ）2乗が<%= effect_size %>と示されています。これは、<%= explanatory %>による<%= target %>の平均値のばらつきの大きさの全体のばらつきに対する比率です。つまり、<%= target %>のばらつきの大きさの<%= effect_size %>が<%= explanatory %>によって説明できると解釈できます。効果量は検定結果において有意と判断した場合に注意する必要があります。

<% if (effect_size < 0.06) { %>
  効果量（Eta2乗）は<%= effect_size %>と低く、<%= explanatory %>による<%= target %>の平均の差は小さなものです。
<% } else if (effect_size < 0.14) { %>
  効果量（Eta2乗）は<%= effect_size %>なので、<%= explanatory %>による<%= target %>の平均の差は中程度です。
<% } else { %>
  効果量（Eta2乗）も<%= effect_size %>と大きく、<%= explanatory %>による<%= target %>の平均の差は大きいと言えます。
<% } %>

以下のテーブルは、One-Way ANOVAにおける効果量（Eta2乗）の解釈の目安を示しています。

| 効果量の値 | 効果量の大きさ |
|------------|------------|
| 0.01 | 小さい効果 |
| 0.06 | 中くらいの効果 |
| 0.14 | 大きい効果 |


# 検出力

検出力は、ほんとうに差がある場合にその差を検出できる確率です。この逆がタイプ２エラーで、これは「有意でない」と判断したときに間違っている確率のことです。これらは検定結果において「有意でない」と判断した場合に注意する必要があります。

<% if (power < 0.5) { %>
  検出力は<%= power_pct %>% (<%= power %>)と低い値になっています。これは、もし実際に<%= explanatory %>による要因により<%= target %>の平均に差があったとしても、それを正しく検出できる確率が約<%= power_pct %>%>しかないということです。言い換えると、**本当は差があるのに「差がない」と誤って結論づけてしまう確率（タイプ２エラー）が<%= type2_error_pct %>% (<%= type2_error %>)もある**ということなので、有意なのかどうかの判断が困難となります。
<% } else if (power < 0.8) { %>
  検出力は<%= power_pct %>% (<%= power %>)とやや低めになっています。これは、もし実際に<%= explanatory %>による要因により<%= target %>の平均に差があったとしても、それを正しく検出できる確率が約<%= power_pct %>%>しかないということです。言い換えると、**本当は差があるのに「差がない」と誤って結論づけてしまう確率（タイプ２エラー）が<%= type2_error_pct %>% (<%= type2_error %>)もある**ということなので、慎重な判断が必要です。
<% } else { %>
  検出力は<%= power_pct %>% (<%= power %>)と高い値になっています。これは、もし実際に<%= explanatory %>による要因により<%= target %>の平均に差があったとしても、それを正しく検出できる確率が約<%= power_pct %>%>もあるということです。言い換えると、**ほんとうは差があるのに「差がない」と誤って結論づけてしまう確率（タイプ２エラー）は<%= type2_error_pct %>% (<%= type2_error %>)もある**ということなので、慎重な判断が必要です。
<% } %>

# 多重比較

<% if (p > baseline_p) { %>

多重比較分析とは<%= explanatory %>のグループのどの組み合わせにおける<%= target %>の平均の差が有意なのかを調べるためのものです。全体では<%= explanatory %>による<%= target %>の平均の差は有意と言えないため、多重比較分析を行う必要はありませんが、参考までに以下がその結果です。

有意水準を5%とすると、P値がその値よりも小さい組み合わせが統計的に有意なものとなります。

{{comparison}}

<% } %>

<% if (p <= baseline_p) { %>

全体では<%= explanatory %>による<%= target %>の平均の差は有意でした。そこで、多重比較分析として<%= explanatory %>のグループのどの組み合わせにおける<%= target %>の平均の差が有意なのか調べました。多重比較のために同じような検定を繰り返し何度も行うと、本当は有意でないのに有意であると間違って判断してしまう確率（タイプ１エラー）が上がってしまいます。そこで検定結果には<%= correction %>補正をかけ、タイプ１エラーの確率をコントロールしています。

有意水準を5%とすると、P値がその値よりも小さい組み合わせが統計的に有意なものとなります。

{{comparison}}

<% } %>


# 補足情報

## 統計量

それぞれのグループごとの統計値は以下の通りです。

{start_lazy_show_hide}
### チャート
{{statistics}}
{end_lazy_show_hide}

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

## 次のステップ

* 今回は<%= target %>に対する<%= explanatory %>という1つの変数が与える影響を分析しました。しかし、他の変数も<%= target %>に影響している可能性があります。そのため、「線形回帰」などを使った多変量分析を使い、複数の要因を同時に考慮した分析をすることができます。
* 今回の検定は全体に対して行われましたが、グループごとに分けて実施することも可能です。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。

`;
module.exports = template;