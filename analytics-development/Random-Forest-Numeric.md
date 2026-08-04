const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const stats = typeof target_statistics !== 'undefined' ? target_statistics : {}; %>
<% const groups = typeof characteristic_groups !== 'undefined' ? characteristic_groups : { high: [], low: [] }; %>
<% const metrics = typeof numeric_metrics !== 'undefined' ? numeric_metrics : {}; %>
<% const errors = typeof numeric_errors !== 'undefined' ? numeric_errors : {}; %>
<% const suggestions = typeof improvement_suggestions !== 'undefined' ? improvement_suggestions : []; %>

# サマリ

選択した説明変数から、数値型の目的変数 **<%= target %>** を予測するランダムフォレストのモデルを作成しました。

## データとモデルの基本情報

{{basic_info}}

## 目的変数の統計値

{{target_statistics}}



# 予測に関係する変数

## 変数重要度

<% if (with_boruta) { %>{{variable_importance_boxplot}}<% } else { %>{{variable_importance}}<% } %>

重要度は学習済みモデルに対して既存の permutation importance で計算され、最大値が100になるように正規化されています。ツールチップには相対的重要度のみが表示されます。これは予測への寄与であり、因果関係を示すものではありません。

## 変数の値と予測値

{{variable_effect}}

他の変数を一定に保ったときに、各説明変数の値に応じて予測値がどう変化するかを示します。階段状の形はモデルの分岐を反映しますが、因果関係を意味しません。

# 予測精度

<% if (test_mode) { %>学習データと、モデル作成に使用していないテストデータの指標を比較します。<% } else { %>現在の指標は学習に使用したデータに対する値です。未知データで評価するにはテストモードを有効にしてください。<% } %>

## モデルの評価指標

{{summary}}

R2乗は目的変数のばらつきのうちモデルが説明できる割合です。RMSEは大きな誤差を重く評価し、MAEは典型的な絶対誤差を示します。平均誤差が正なら平均的に過小予測、負なら過大予測です。

## 実測値と予測値

{{actual_predicted}}

対角線に近い点ほど予測が正確です。テストモードでは学習データとテストデータの分布を比較します。

## 予測誤差の分布

{{prediction_error_distribution}}

予測誤差は **実測値 − 予測値** で計算します。0の線は誤差がない位置、もう一つの線は平均誤差を表します。分布の両端は確認すべき大きな誤差です。

## 予測値と予測誤差の関係

{{prediction_value_error}}

予測値に応じて誤差が変化していないかを確認します。傾向や広がりの変化は、偏りや不均一な誤差を示す場合があります。

# 予測結果

{{data}}
`;
module.exports = template;
