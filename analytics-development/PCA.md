const template = `
<% var correlation_type_safe = (typeof correlation_type === 'undefined' || !correlation_type) ? 'pearson' : correlation_type; var is_correlation_known_safe = (typeof is_correlation_known === 'undefined') ? false : !!is_correlation_known; var is_correlation_auto_safe = (typeof correlation_is_auto === 'undefined') ? false : !!correlation_is_auto; var correlation_degraded_from_safe = (typeof correlation_degraded_from === 'undefined' || !correlation_degraded_from) ? '' : correlation_degraded_from; var is_polychoric_available_safe = (typeof is_polychoric_available === 'undefined') ? false : !!is_polychoric_available; var correlation_warnings_safe = (typeof correlation_warnings === 'undefined' || !correlation_warnings) ? [] : correlation_warnings; var is_category_correlation_safe = (typeof is_category_correlation === 'undefined') ? (correlation_type_safe !== 'pearson') : is_category_correlation; var score_scale_safe = (typeof score_scale === 'undefined' || !score_scale) ? 'preserve_variance' : score_scale; %>
# サマリ

<% if (typeof n_variables_used !== 'undefined' && n_variables_used !== null) { %><%= n_variables_used %>個の変数<% if (typeof n_rows_used !== 'undefined' && n_rows_used !== null) { %>、<%= n_rows_used %>行<% } %>を対象に主成分分析を行いました。<% if (typeof pc1_pct !== 'undefined' && pc1_pct !== null && typeof pc2_pct !== 'undefined' && pc2_pct !== null) { %>最初の2つの主成分で<% if (correlation_type_safe !== 'pearson') { %>推定された潜在変数（回答の背後に仮定された連続的な変数）<% } else { %>元<% } %>のばらつきの<%= Math.round((pc1_pct + pc2_pct) * 10) / 10 %>%を保持しています。<% } %><% } %>

## 分析方法

<% if (is_correlation_known_safe) { %>{{analysis_method_table}}

<% var correlation_name_ja = {polychoric:'ポリコリック相関', tetrachoric:'テトラコリック相関', mixed:'混合相関', pearson:'Pearson相関'}; %><% if (correlation_degraded_from_safe) { %>この分析で指定された<%= (correlation_name_ja[correlation_degraded_from_safe] || correlation_degraded_from_safe) %>はデータから推定できなかったため、代わりにPearson相関を使用しました。カテゴリの偏り、回答のないカテゴリの組み合わせ、あるいは実際にはカテゴリ変数ではない変数が含まれていることが主な原因です。結果を利用する前に、カテゴリの統合や変数の選び直しを検討してください。<% } else if (correlation_type_safe === 'polychoric') { %>主成分は、ポリコリック相関行列から計算されています。<% if (is_correlation_auto_safe) { %>選択された変数がカテゴリ数や回答分布の偏りの度合いから順序カテゴリ変数と判断されたため、自動的に選択されました。<% } else { %>相関係数の種類としてポリコリック相関が選択されているためです。<% } %>ポリコリック相関は、それぞれの順序カテゴリの回答の背後に連続的な変数があると仮定してその相関を推定するため、1〜5のように必ずしも間隔が等しいとは限らない評価尺度に対して、Pearson相関より適切です。<% } else if (correlation_type_safe === 'tetrachoric') { %>主成分は、テトラコリック相関行列から計算されています。テトラコリック相関はポリコリック相関の2カテゴリ版で、2値の回答それぞれの背後に連続的な変数があると仮定します。<% } else if (correlation_type_safe === 'mixed') { %>主成分は、混合相関行列から計算されています。連続変数とカテゴリ変数が同時に選択されているため、変数のペアごとに適切な相関が使い分けられています。<% } else { %>主成分は、Pearson相関行列から計算されています。<% if (is_correlation_auto_safe) { %>選択された変数が連続変数であるか、カテゴリ数が十分に多く連続変数として扱えると判断されたため、自動的に選択されました。<% } else { %>相関係数の種類としてPearson相関が選択されているためです。<% } %><% if (is_polychoric_available_safe) { %>選択された変数は順序カテゴリ変数のため、ポリコリック相関の方が変数間の関係をより適切に捉えられる可能性があります。[「設定」](//analytics/settings)より変更可能です。<% } %><% } %>
<% if (correlation_warnings_safe.indexOf('sparse_categories') >= 0) { %>
注意: 回答全体の5%未満しか含まないカテゴリを持つ変数があります。カテゴリが極端に少ない場合、カテゴリから推定した相関は不安定になることがあります。
<% } %><% if (correlation_warnings_safe.indexOf('alphabetical_category_order') >= 0) { %>
注意: カテゴリの順序が定義されていないカテゴリ変数があるため、アルファベット順で並べています。意図した順序と異なる場合は、カテゴリの順序を明示的に設定してください。
<% } %><% if (is_category_correlation_safe) { %>
### 相関の診断

<% if (correlation_degraded_from_safe) { %>以下の診断は、推定できなかったカテゴリベースの相関についてのものです。<% } else { %>この分析ではカテゴリの回答から相関を推定しているため、以下の診断が重要になります。<% } %>

{{correlation_diagnostics_table}}

カテゴリの偏り、回答のないカテゴリの組み合わせ、正定値にするための平滑化はいずれも、推定された相関を不安定にします。いずれかが指摘されている場合は、カテゴリの統合や変数の選び直しを検討してください。
<% } %><% } %>

## 分析に使われたデータ

{{data_conditions_table}}

# 主成分数の検討

## スクリープロットと平行分析

{{scree_plot_parallel}}

## 主成分数の判定

以下の表は、各主成分の固有値、寄与率、および各基準による判定を示しています。

{{component_selection_table}}

<% if (typeof recommended_n !== 'undefined' && recommended_n !== null && recommended_n !== 0) { %><% if (typeof methods_agree !== 'undefined' && methods_agree) { %>平行分析とカイザー基準の両方が、<%= recommended_n %>個の主成分を残すことを支持しています。<% } else if (typeof kaiser_n !== 'undefined' && kaiser_n !== null) { %>平行分析では<%= recommended_n %>個、カイザー基準では<%= kaiser_n %>個が提案されています。ランダムなばらつきと比較できる平行分析を優先します。<% } %>
<% } %>

## 各変数の累積再現率

以下の表は、主成分を順番に追加したときに、<% if (correlation_type_safe !== 'pearson') { %>各回答の背後に仮定された連続的な変数<% } else { %>各変数<% } %>が持つ情報をどの程度保持できるかを示しています。値が高いほど、その時点までの主成分によってよく表現されていることを意味します。

{{representation_table}}

色は再現率の高さを表しており、70%以上は「高い」、50～70%は「おおむね保持」、30～50%は「一部のみ保持」、30%未満は「低い」と判定しています。これにより、採用した主成分数でどの<% if (correlation_type_safe !== 'pearson') { %>回答の背後に仮定された連続的な変数<% } else { %>変数<% } %>の情報が十分に保持されているか、またどれが十分に表現されていないかを確認できます。

全体の累積寄与率が高くても、個々の変数を見ると再現率に差がある場合があります。そのため、この表は、主成分数の妥当性を全体だけでなく変数ごとの視点から確認するために役立ちます。

# 主成分と変数の関係

## 主成分負荷量

以下の表は、<% if (correlation_type_safe !== 'pearson') { %>各回答の背後に仮定された連続的な変数<% } else { %>各変数<% } %>と各主成分の関係の強さと方向を示しています。セル内のバーは主成分負荷量の絶対値に応じて長くなり、青は正の負荷量、赤は負の負荷量を表します。解釈の目安として、負荷量の絶対値が0.4以上の場合は一定の関係があり、0.6以上の場合は強い関係があると考えられます。

{{loadings_signed_table}}

**色の見方：**

| 主成分負荷量 | 色 | 意味 |
|---|---|---|
| 0.6以上 | 濃い青 | 強い正の関係 |
| 0.4以上 | 中間の青 | 一定の正の関係 |
| 0より大きい | 薄い青 | 弱い正の関係 |
| 0 | グレー | 関係なし |
| 0より小さい | 薄い赤 | 弱い負の関係 |
| -0.4以下 | 中間の赤 | 一定の負の関係 |
| -0.6以下 | 濃い赤 | 強い負の関係 |

<% if (typeof component_profiles !== 'undefined' && component_profiles && component_profiles.length > 0) { component_profiles.forEach(function(p){ %>
**<%= p.component %>** <% if (p.pattern_status === 'common_direction') { %><%= p.positive_variables.join('、') %>など、複数の変数が同じ方向に強く関係しています。そのため、この主成分はこれらの変数に共通する全体的な傾向を表す軸と考えられます。<% } else if (p.pattern_status === 'contrast') { %><%= p.positive_variables.join('、') %>は正の方向に、<%= p.negative_variables.join('、') %>は負の方向に関係しています。そのため、この主成分はこれら2つの変数群の対比を表している可能性があります。<% } else if (p.pattern_status === 'single_variable') { %><%= p.dominant_variable %>の寄与が特に大きく、他の変数の寄与は限定的です。そのため、この主成分は主に<%= p.dominant_variable %>に固有の情報を表す主成分と考えられます。<% } else if (p.pattern_status === 'diffuse') { %>多数の変数が比較的小さく関係しており、少数の変数だけでは特徴づけにくい主成分です。明確な名前を付ける場合は、負荷量と元データの意味を慎重に確認してください。<% } else { %>複数の変数が関係していますが、共通方向型や明確な対比型には分類できません。関係する変数の組み合わせを確認し、分析目的に沿って解釈してください。<% } %>
<% }); } %>

## 主成分の寄与率と変数別内訳

以下のチャートは、各主成分が<% if (correlation_type_safe !== 'pearson') { %>推定された潜在変数<% } else { %>データ全体<% } %>のばらつきをどの程度説明しているかと、その主成分がどの変数によって構成されているかを示しています。

各バーの全体の長さは、その主成分の寄与率を表します。バーが長いほど、その主成分が<% if (correlation_type_safe !== 'pearson') { %>推定された潜在変数<% } else { %>元のデータ<% } %>の情報を多く保持しています。バーの中の色分けは、各変数がその主成分の構成にどの程度寄与しているかを表します。色の区間が大きい変数ほど、その主成分を特徴づけるうえで重要です。

{{contributions_table}}

## 変数間の関係の可視化

以下のチャートは、各変数を最初の2つの主成分との関係に基づいて配置したものです。

矢印が同じ方向を向く変数は正の相関、反対方向を向く変数は負の相関を持つ傾向があります。矢印が直角に近い変数同士は、相関が弱い傾向があります。<% if (correlation_type_safe !== 'pearson') { %>ここでの相関は、ポリコリック相関によって推定された、回答の背後に仮定された連続的な変数どうしの相関です。回答そのものの相関ではありません。<% } %>中心付近にある変数は、選択した2つの主成分では十分に表現されていない可能性があります。

{{variable_map_chart}}

## バイプロット

<% if (correlation_type_safe !== 'pearson') { %>観測値の配置には近似主成分得点が使われています。詳しくは「主成分得点（近似主成分得点）」をご覧ください。

<% } %>{{biplot}}

バイプロットは変数と観測値を重ねて表示します。矢印は、生の長さを観測値の距離と直接比較せず、角度や方向で解釈してください。<% if (score_scale_safe === 'unit_variance') { %>また、「主成分得点の尺度」に「標準偏差を1にする（SPSS互換）」を選んでいる場合、主成分ごとに異なる標準偏差で割って尺度を揃えているため、軸方向の伸縮率が主成分ごとに変わります。観測値どうしの位置関係の見え方は元のデータでの距離とは一致しないので、点の遠近は目安として捉えてください。<% } %>

## 主成分と観測値の関係

<% if (correlation_type_safe !== 'pearson') { %>この分析ではカテゴリの回答から推定した相関行列を使っているため、ここで使われている主成分得点は**近似主成分得点**です。詳しくは「主成分得点（近似主成分得点）」をご覧ください。

<% } %>以下の散布図は、各観測値を第1主成分（PC1）と第2主成分（PC2）の主成分得点を使って配置したものです。それぞれの点が1つの観測値を表し、点が近いほど<% if (correlation_type_safe !== 'pearson') { %>近似主成分得点の計算に使われた<% } %>元の変数における特徴が似ており、離れているほど異なる特徴を持つ傾向があります。

<% if (typeof pc1_pct !== 'undefined' && pc1_pct !== null && typeof pc2_pct !== 'undefined' && pc2_pct !== null) { %>このチャートでは、PC1が<% if (correlation_type_safe !== 'pearson') { %>推定された潜在変数<% } else { %>データ全体<% } %>のばらつきの<%= Math.round(pc1_pct * 10) / 10 %>%、PC2が<%= Math.round(pc2_pct * 10) / 10 %>%を説明しており、2つの軸を合わせると全体の<%= Math.round((pc1_pct + pc2_pct) * 10) / 10 %>%を表現しています。<% if (correlation_type_safe !== 'pearson') { %>なお、この割合は相関行列の固有値分解から得られたもので、近似主成分得点の散らばりそのものの割合ではありません。<% } %>
<% } %>

{{observation_map_chart}}

<% if (score_scale_safe === 'unit_variance') { %>なお、「主成分得点の尺度」に「標準偏差を1にする（SPSS互換）」を選んでいるため、各主成分の得点はそれぞれの標準偏差で割って尺度が揃えられています。主成分ごとに伸縮率が変わるので、この散布図での点の遠近は元のデータでの距離とは一致しません。位置関係の傾向を見るための図として解釈してください。

<% } %>カテゴリに列を選ぶと、各観測値がカテゴリごとに色分けされ、カテゴリによって回答パターンが異なるか、あるいは似た特徴を持つ観測値がカテゴリをまたいで存在するかを確認できます。また、他の点から大きく離れている観測値は、特徴的な回答パターンを持つ可能性があります。

# 主成分得点<% if (correlation_type_safe !== 'pearson') { %>（近似主成分得点）<% } %>

主成分得点は、各観測値がそれぞれの主成分上でどの位置にあるかを表します。0付近は平均的な位置、正または負に大きいほどその主成分の特徴を強く持ちます。
<% if (correlation_type_safe !== 'pearson') { %>
この分析はカテゴリの回答から推定した相関行列を使って計算しているため、観測値ごとの主成分得点を厳密に求めることができません。以下に表示されているのは**近似主成分得点**で、順序カテゴリの回答を数値に変換して標準化し、その相関行列から得られた主成分係数を掛けることで求めています。したがって、ポリコリック相関が各回答の背後に仮定している潜在的な連続変数の値そのものではありません。正確な数量としてではなく、観測値どうしの相対的な位置として解釈してください。回帰やクラスタリングなど、この主成分得点を使った後続の分析を行う場合も、近似値であることを前提に扱い、値そのものの精度に依存する結論は避けてください。<% if (score_scale_safe === 'unit_variance') { %>なお、「主成分得点の尺度」に「標準偏差を1にする（SPSS互換）」を選んでいますが、この尺度は近似主成分得点を主成分の標準偏差で割って求めるため、表示されている主成分得点の実際の標準偏差は厳密には1になりません。<% } %>
<% } %>

{{data}}

## 主成分係数

主成分係数は、元の変数を組み合わせて各主成分を作るための重み（<% if (correlation_type_safe !== 'pearson') { %>相関行列の固有ベクトル<% } else { %>回転行列<% } %>）です。<% if (correlation_type_safe !== 'pearson') { %>各回答の背後に仮定された連続的な変数<% } else { %>変数<% } %>と主成分の相関を表す主成分負荷量とは異なり、係数はその主成分を構成する際に各変数がどの程度使われているかを表します。
<% if (score_scale_safe === 'unit_variance') { %>
「主成分得点の尺度」に「標準偏差を1にする（SPSS互換）」を選んでいるため、以下の表には2種類の係数が表示されます。「係数」は主成分の方向を表す重みで、「得点係数」は各観測値の主成分得点を計算するための重み（係数をその主成分の標準偏差で割ったもの）です。SPSSの「Component Score Coefficient Matrix」に対応するのは「得点係数」です。
<% } %>
{{coefficients_table}}
`;

module.exports = template;
