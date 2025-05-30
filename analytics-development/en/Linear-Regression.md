const template = `

A linear regression model was created to predict <%= target %> based on the selected explanatory variables.

<% if (predictorColumns.length > 1) { %>
# Multicollinearity

<% if (has_perfect_collinearity) { %>
This model has a perfect [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) problem with <%= perfect_collinearity_variables %> (a state where values can be completely calculated by a formula from other explanatory variables), causing their VIF scores to become infinite and preventing the generation of a chart for testing multicollinearity. To resolve the multicollinearity problem, please exclude <%= perfect_collinearity_variables %> from the explanatory variables and re-run the analysis.
<% } else if (max_vif > 10) { %>
{{multicollinearity}}

This model shows signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.
To resolve this problem, please remove explanatory variables with VIF values exceeding 10 one by one, starting with those that are less important, and re-run the analysis until no explanatory variables have VIF values exceeding 10.

<% } else { %>
{{multicollinearity}}

This model shows no signs of [multicollinearity](https://exploratory.io/note/exploratory/Ysc3LNp0) (strong correlations between multiple explanatory variables). (When explanatory variables have VIF values exceeding 10, it becomes difficult to accurately evaluate the effects of individual variables.)
<% } %>
<% } %>

# Variable Relationships

<% if (predictorColumns.length > 1) { %>
## Variable Importance

The following chart shows which explanatory variables are relatively more important for predicting <%= target %>.

{{variable_importance}}

For more information about the mechanism of variable importance, please see [this note](https://exploratory.io/note/exploratory/dLm5rwn5).

<% } %>


## Variable Effects

<% if (predictorColumns.length > 1) { %>
The following chart shows how the value of <%= target %> changes when the value of each explanatory variable changes, while other variables remain constant.
<% } else { %>
The following chart shows how the value of <%= target %> changes when the value of the explanatory variable changes.
<% } %>

{{variable_effect}}

* The blue line (or dots) shows predicted values for explanatory variable values.
* Gray lines show actual values and their 95% confidence intervals.
* The vertical axis represents the value of <%= target %>.

Important Notes:

<% if (predictorColumns.length > 1) { %>

* Since we predict the effect of each explanatory variable individually while keeping other variables constant, there will be discrepancies between the average of actual values and predicted values.
* For details on how predicted values are calculated, please see [this note](https://exploratory.io/note/exploratory/Sbd0LDU6).
* For the differences in interpretation between simple and multiple regression analysis, please see [this note](https://exploratory.io/note/exploratory/BDI7AeE5).私も [こちら](https://exploratory.io/note/exploratory/BDI7AeE5) のノートをご覧ください。
* Explanatory variables are arranged in order of importance as shown in "Variable Importance" above.

<% } %>
* For categorical (Character, Factor) explanatory variables with more than 12 unique values, the top 11 most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics.


# Variable Coefficients and Significance

Coefficients (slopes), P-values for determining their significance, and confidence intervals are listed for each variable.

{{coefficient_table}}

_For categorical (Character, Factor) explanatory variables with more than 12 unique values, the top 11 most frequent values are retained and the rest are grouped as "Others". This can be changed from [Settings](//analytics/settings) in Analytics._

## Coefficient Interpretation

The coefficients show how much the value of <%= target %> changes when the value of each variable changes by 1 unit.

### Examples of Coefficient Interpretation

<% variables.forEach(variable => { %>
<% if (variable.type == 'numeric') { %>

* When other variable values are constant, a 1-unit increase in <%= variable.variable %> results in <%= target %> increasing by approximately <%= variable.coef %>.

<% } else if (variable.type == 'logical') { %>

* When other variable values are constant, when <%= variable.variable %> is TRUE compared to FALSE, there is a difference of approximately <%= variable.coef %> in <%= target %>.

<% } else { %>

* When other variable values are constant, <%= variable.variable %> has a difference of approximately <%= variable.coef %> compared to the base level "<%= variable.base_level %>". For details on base levels, please refer to [this note](https://exploratory.io/note/exploratory/Pxa6FmO2).
<% } %>
<% }) %>

For coefficient interpretation methods by data type in statistical prediction models, please see [this note](https://exploratory.io/note/exploratory/KOC5WYt3).

## Significance Testing Using P-values

Under a significance level of <%= baseline_p_pct %>% (<%= baseline_p %>), explanatory variables with P-values greater than <%= baseline_p_pct %>% (<%= baseline_p %>) cannot be said to have a statistically significant relationship with <%= target %>. Conversely, explanatory variables with P-values less than <%= baseline_p_pct %>% (<%= baseline_p %>) can be said to have a statistically significant relationship with <%= target %>.

_The current significance level (P-value) is set to <%= baseline_p_pct %>% (<%= baseline_p %>), but this can be changed from [Settings](//analytics/settings) in Analytics._


## Visualization of Coefficients and Confidence Intervals

The following chart visualizes the coefficients and confidence intervals of each variable using error bars.

{{coefficient}}

* The center point of each error bar represents the coefficient value, and the upper and lower lines represent its 95% confidence interval. Explanatory variables with a significant relationship to <%= target %> and a positive relationship are shown in blue, those with a negative relationship are shown in red. Explanatory variables shown in gray cannot be said to have a significant relationship with <%= target %>.
* The 95% confidence interval of coefficients means "there is high confidence (95% confidence) that the true coefficient is within this range." Therefore, explanatory variables whose 95% confidence intervals include 0 may have no relationship with <%= target %> at all, so they cannot be said to be statistically significant. Conversely, explanatory variables whose 95% confidence intervals do not include 0 have almost no possibility of having no relationship with <%= target %>, so they can be said to be statistically significant.
* Significance can be determined by either P-values or confidence intervals. Either method will yield the same results.

_The above explanation of confidence intervals is an intuitive explanation; more precisely, it means "if samples are repeatedly taken from the same population and 95% confidence intervals are calculated each time, 95% of those intervals will contain the true coefficient."_

**Important Notes**

These coefficient values represent change amounts when each explanatory variable value changes by 1 point. When explanatory variables have different units, their coefficient values cannot be used to compare the strength of relationship with <%= target %>. To compare the strength of relationships between explanatory variables, please refer to "Variable Importance" above.

# Model Metrics

<% if (test_mode) { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below. Since test mode is currently enabled, metrics for both training data and test data are displayed for prediction accuracy.
<% } else { %>
Various metrics related to model prediction accuracy and significance are summarized in the table below.
<% } %>

{{summary}}

## Prediction Accuracy

When the target variable is numeric, R-squared and RMSE are commonly used metrics to evaluate model prediction accuracy.

* R-squared
  * R-squared shows the proportion of variability in the target variable's values that is explained by the explanatory variables used in this model.
  * Values range from 0 to 1, where 1 means the model can perfectly predict the target variable's values.
  * Generally interpreted as: 0.8+ indicates very high, 0.6-0.8 high, 0.4-0.6 moderate, 0.2-0.4 low, and less than 0.2 very low model fit.
  * For notes explaining R-squared, please see [here](https://exploratory.io/note/exploratory/R2-zVj7AqB3).

* RMSE
  * RMSE represents the root mean squared error, measuring the magnitude of error between predicted and actual values.
  * It is expressed in the same units as the target variable, making it easy to interpret. Smaller values indicate higher prediction accuracy.
  * Values are ≥ 0, becoming 0 for perfect predictions.
  * For notes explaining RMSE, please see [here](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5).


R2乗やRMSEの考え方や具体的な計算方法については、以下のノートをご覧ください。

* R2乗 - [解説ノート](https://exploratory.io/note/exploratory/R2-zVj7AqB3)
* RMSE - [解説ノート](https://exploratory.io/note/exploratory/RMSE-DjQ0KQd5)

## Significance

モデルの有意性検定のためにF検定を行いました。帰無仮説は、「モデルの全ての係数が0である」、つまりモデルに使われた説明変数は目的変数である<%= target %>と関係がないということになります。P値の値が有意水準である<%= baseline_p_pct %>%より高ければ、選択された説明変数と<%= target %>の関係は統計的に有意とは言えません。逆に、P値が<%= baseline_p_pct %>%より低ければ、有意だと言えます。

{start_show_hide}
## その他の指標の説明

* 調整済みR2乗
  * 調整済みR2乗は、R2乗を改良した指標で、モデルに含まれる説明変数の数を考慮して調整されています。
  * R2乗と同じく、値は0から1の間で、1はモデルが完全に目的変数の値を予測できることを意味します。
  * 無意味な説明変数を追加すると調整済みR2乗が減少する特性があり、異なるモデル間の比較に適しています。
  * 調整済みR2乗について解説したノートは[こちら](https://exploratory.io/note/exploratory/R2-tjU2NHv6)をご覧ください。

* F値
  * F値はモデル全体の有意性を検定するための統計量です。
  * 「モデルが予測に役立っているか」を評価し、値が大きいほど偶然ではなく統計的に意味があると判断されます。
  * 1以上の値を取り、値が大きいほどモデルの有意性が高いことを示します。

* P値
  * P値はモデルやパラメータの統計的有意性を示す確率値です。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* 行数
  * 行数は分析に使用したデータの総数（サンプルサイズ）を示します。
  * サンプルサイズが大きいほど、統計的検定の検出力が高まり、結果の信頼性が向上します。
  * 説明変数にある数値型の列で欠損値が含まれている場合、その行が取り除かれて実行されます。

* 自由度
  * 自由度はモデルにおいて自由に変化できるパラメータ（係数）の数を表します。
  * 係数の表で確認できる変数の数（切片を除く）となります。

* 対数尤度
  * 対数尤度はデータがモデルにどれだけ適合しているかを数値化したものです。
  * 通常は負の値を取り、0に近いほどモデルの適合度が高いことを示します。
  * 主にAICやBICなどの情報量基準の計算に使用されます。

* AIC
  * AIC（赤池情報量基準）はモデルの複雑さと適合度のバランスを評価する指標です。
  * 値が小さいほど優れたモデルとされ、過学習を防ぎながら最適なモデルを選択するのに役立ちます。
  * 値は通常正ですが、対数尤度が大きい場合は負の値になることもあります。

* BIC
  * BIC（ベイズ情報量基準）はAICと同様にモデル選択のための指標ですが、サンプルサイズによる補正がより厳しくなっています。
  * AICよりも単純なモデルを選ぶ傾向があり、値が小さいほど良いモデルと判断されます。
  * 値は通常正ですが、対数尤度が大きい場合は負の値になることもあります。

* 残差逸脱度
  * 残差逸脱度は実測値とモデルによる予測値との差（残差）の二乗和を表します。
  * 値が小さいほどモデルの適合度が高く、モデル診断や比較に使用されます。
  * 0以上の値を取り、完璧なモデルでは0になります。

* 残差の自由度
  * 残差の自由度は残差に関連する自由度で、「データ量（行数） - モデルのパラメータ数」で計算されます。
  * 係数の表で確認できる全ての行の数をデータの行数から引いたものです。
  * 残差の評価や分散の推定に使用され、検定統計量の算出に必要です。

* VIF（最大値）
  * VIF（分散拡大要因）は説明変数間の多重共線性の程度を示す指標です。
  * 一般的にVIFが10以上の変数は多重共線性の問題があると判断されます。
  * 値は1から無限大の間で、1に近いほど多重共線性が少ないことを示します。

{end_show_hide}

## 実測値と予測値の関係

<% if (!test_mode) { %>
予測した結果、元の実測値と予測値にはズレがありますが、それらの関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。
<% } else { %>
予測した結果、元の実測値と予測値にはズレがありますが、それらの関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### チャート
{{actual_predicted}}
{end_lazy_show_hide}

## 予測値と残差の関係

<% if (!test_mode) { %>
予測した結果、予測値と残差（元の実測値と予測値のズレ）の関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。
<% } else { %>
予測した結果、予測値と残差（元の実測値と予測値のズレ）の関係を散布図を使って可視化したのが以下のチャートです。それぞれの点はそれぞれの行を表しています。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### チャート
{{predicted_residual}}
{end_lazy_show_hide}

## 残差の分布

<% if (!test_mode) { %>
残差（元の実測値と予測値のズレ）のばらつきをヒストグラムを使って可視化したのが以下のチャートです。
<% } else { %>
残差（元の実測値と予測値のズレ）のばらつきをヒストグラムを使って可視化したのが以下のチャートです。トレーニングデータは青色に、テストデータはオレンジ色として分けて可視化しています。
<% } %>

{start_lazy_show_hide}
### Chart
{{residual}}
{end_lazy_show_hide}

# Supplementary Information

## Next Steps

* Variable Selection Optimization: Excluding statistically non-significant variables (P-values ≥ <%= baseline_p_pct %>% (<%= baseline_p %>) to simplify the model can make interpretation easier and reduce overfitting risks. In that case, we recommend using [Adjusted R-squared](https://exploratory.io/note/exploratory/R2-tjU2NHv6) as a metric for model accuracy instead of R-squared. For variable selection guidelines, please see [this note](https://exploratory.io/note/exploratory/SWF4cTx8).
<% if (!repeat_by) { %>
* Group-wise Analysis: Creating separate models for each group can provide more detailed analysis of <%= target %> determinants within each group. In that case, you can select a grouping variable in "Repeat By" and re-run the analysis.
<% } %>
* Examining Non-linear Relationships: Explanatory variables with non-linear relationships to <%= target %> can be modeled more accurately by transforming the data.
* Outlier Verification: Checking for outliers that may affect prediction accuracy and addressing them as necessary may improve model reliability. For methods to remove outliers, please see [this note](https://exploratory.io/note/exploratory/Eep7kip3).
<% if (!test_mode) { %>
* Model Evaluation: To evaluate this model's prediction performance more rigorously, you can verify by splitting into training data and test data. In that case, set "Test Mode" to TRUE under the "Validation" section in [Settings](//analytics/settings) and re-run.
<% } %>
* Prediction on New Data: When you want to make predictions on new data using the created model, add a "Predict with Model (Analytics View)" step to the target data frame. For details, please refer to [this note](https://exploratory.io/note/exploratory/AAI3Mle3).

`;

module.exports = template; 