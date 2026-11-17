const template = `
<% const info = typeof basic_info !== 'undefined' ? basic_info : {}; %>
<% const distribution = typeof target_distribution !== 'undefined' ? target_distribution : { categories: [] }; %>
<% const allTrueRatio = distribution && distribution.shares && distribution.shares.TRUE !== undefined ? (Math.round(distribution.shares.TRUE * 1000) / 10) + '%' : '—'; %>
<% const metrics = typeof logical_metrics !== 'undefined' ? logical_metrics : {}; %>
<% const cut = typeof threshold_analysis !== 'undefined' && threshold_analysis ? threshold_analysis : null; %>
<% const cutObjective = cut ? cut.objective : (typeof threshold_objective !== 'undefined' ? threshold_objective : 'balanced_accuracy'); %>
<% const cutHasMinRecall = !!(cut && cut.minimum_recall_display); %>
<% const cutHasMinPrecision = !!(cut && cut.minimum_precision_display); %>
<% const cutMinRecall = cutHasMinRecall ? cut.minimum_recall_display : '未設定'; %>
<% const cutMinPrecision = cutHasMinPrecision ? cut.minimum_precision_display : '未設定'; %>
<% const cutMethodShort = cutObjective === 'f1' ? 'F1スコアを最大化' : cutObjective === 'precision_at_recall' ? (cutHasMinRecall ? '再現率' + cutMinRecall + '以上の中で適合率を最大化' : '再現率の下限を満たす中で適合率を最大化') : cutObjective === 'recall_at_precision' ? (cutHasMinPrecision ? '適合率' + cutMinPrecision + '以上の中で再現率を最大化' : '適合率の下限を満たす中で再現率を最大化') : '均衡正解率を最大化'; %>
<% const cutMethodShortLabel = cut && cut.available ? cutMethodShort : '—'; %>
<% const cutMethodSentence = cutObjective === 'f1' ? '適合率と再現率のバランスをとるF1スコアが最大になる境界値' : cutObjective === 'precision_at_recall' ? ('再現率が' + cutMinRecall + '以上になる境界値の中で、適合率が最大になる境界値') : cutObjective === 'recall_at_precision' ? ('適合率が' + cutMinPrecision + '以上になる境界値の中で、再現率が最大になる境界値') : 'TRUEとFALSEをバランスよく分類できるように、均衡正解率が最大になる境界値'; %>

# サマリ

選択した説明変数から、ロジカル型の目的変数 **\`<%= target %>\`** を予測するCatBoostのモデルを作成しました。

## データとモデルの基本情報

{{basic_info}}

## 目的変数の分布

{{target_distribution}}


# 予測に関係する変数

## 変数重要度

\`<%= target %>\`を予測するためにどの説明変数が相対的により重要なのかを表したのが以下のチャートです。

{{variable_importance}}

各変数の重要度を<%= typeof importance_method_label !== 'undefined' ? importance_method_label : '予測性能の低下量（Permutation）' %>で計算し、最大値が100になるよう正規化しています。変数の重要度の仕組みについては、[こちら](https://exploratory.io/note/exploratory/dLm5rwn5)のノートをご覧ください。

## 変数の値と予測確率

各説明変数の値に対するTRUEの予測確率を表したのが以下のチャートです。

{{variable_effect}}

# 予測精度

<% if (test_mode) { %>モデルを作成したトレーニングデータと、モデル作成には使用していないテストデータの予測性能を比較します。テストデータの結果を見ることで、モデルが未知のデータに対しても同じように予測できるかを確認できます。<% } else { %>現在の指標はトレーニングデータに対する予測結果をもとに計算されています。未知データに対する予測精度を評価するにはテストデータを使うことを推奨します。その場合は、[設定](chrome-extension://analytics/settings/test_mode)より「テストモード」を有効にしてください。<% } %>

## モデルの評価指標

{{summary}}

- ROC AUCとPR AUCは、特定の境界値に限定せず、さまざまな境界値におけるモデルの識別性能を評価します。その他の指標は、現在の境界値である<%= cut && cut.current_threshold_display ? cut.current_threshold_display : true_false_criteria %>を使ってTRUEとFALSEに分類した結果です。境界値は[「設定」](chrome-extension://analytics/settings/true_false_criteria)より変更可能です。
<% if (test_mode) { %>- モデルの実際の予測性能を評価するときは、モデル作成に使用していないテストデータの結果を重視します。テストデータの指標が学習データより大きく低い場合は、モデルが学習データに適合しすぎており、未知のデータでは十分な性能を発揮できない可能性があります。
<% } %>- TRUEとFALSEの件数に偏りがある場合、正解率は、多数派のカテゴリを予測するだけでも高くなることがあります。そのため、均衡正解率、再現率、適合率、F1スコアなどとあわせて評価してください。
- 特にTRUEの件数が少ない場合は、PR AUCを確認することで、TRUEを見つける性能と、誤ってTRUEと予測するケースのバランスを捉えやすくなります。

{start_show_hide}
## モデルの指標の詳細

* ROC AUC
  * ROC AUCは、TRUEとFALSEを予測するモデルの分類性能を評価するために、一般的によく使われる指標です。
  * さまざまな境界値において、モデルがTRUEのデータにFALSEのデータよりも高い予測確率を与えられるかを総合的に評価します。
  * 値は通常0.5から1の間で、0.5はランダムな予測と同程度、1はTRUEとFALSEを完全に区別できることを意味します。
  * 一般的には、0.6以上で一定の分類性能があり、0.8以上で良好、0.9以上で非常に高い分類性能があると解釈されます。
  * ROC AUCは「Receiver Operating Characteristic Area Under the Curve」の略で、ROC曲線の下の面積を表します。

* PR AUC
  * PR AUCは、適合率（Precision）と再現率（Recall）の関係を表すPR曲線の下の面積です。
  * さまざまな境界値における適合率と再現率を総合的に評価し、モデルがTRUEのデータをどの程度正確に、かつ漏れなく見つけられるかを測ります。
  * 値は0から1の間で、1に近いほど、適合率と再現率の両方が高いことを意味します。
  * 元データのTRUEが少ない場合など、TRUEとFALSEの割合に大きな差があるデータの評価に特に有用です。
  * PR AUCは「Precision-Recall Area Under the Curve」の略で、PR曲線の下の面積を表します。

* F1スコア
  * F1スコアは、適合率と再現率の調和平均で、両方のバランスを評価する指標です。
  * 値は0から1の間で、1に近いほど、TRUEと予測した結果の正確さと、実際のTRUEを見逃さない能力の両方が高いことを意味します。
  * FALSEを正しく予測できた割合は直接評価しないため、TRUEの検出を重視する場合に適しています。
  * 元データのTRUEが少ない場合など、正解率だけではモデルの性能を適切に評価しにくい場合に特に有用です。

* 均衡正解率
  * 均衡正解率（Balanced Accuracy）は、再現率と特異度の平均で、TRUEとFALSEの両方を正しく予測できているかをバランスよく評価する指標です。
  * 値は0から1の間で、1に近いほどTRUEとFALSEの両方を正確に分類できることを意味します。
  * 0.5はランダムな予測と同程度、1はTRUEとFALSEを完全に分類できることを示します。
  * 元データのTRUEとFALSEの割合に大きな差がある場合でも、多数派のカテゴリに偏らずモデルを評価できるため、正解率よりも適している場合があります。

* 正解率
  * 正解率は、すべての予測のうち、TRUEまたはFALSEを正しく予測できた割合を示します。
  * 値は0から1の間で、1に近いほど、全体として多くのデータを正しく分類できていることを意味します。
  * 直感的で分かりやすい指標ですが、元データのTRUEとFALSEの割合に大きな差がある場合は、モデルの性能を過大評価する可能性があります。
  * 例えば、FALSEが大部分を占めるデータでは、すべてをFALSEと予測しても高い正解率になることがあるため、再現率、適合率、均衡正解率などとあわせて確認する必要があります。

* 誤分類率
  * 誤分類率は、すべての予測のうち、TRUEまたはFALSEを誤って予測した割合を示します。
  * 「1 − 正解率」で計算され、値は0から1の間です。0に近いほど、誤った予測が少ないことを意味します。
  * 正解率と表裏の関係にあるため、元データのTRUEとFALSEの割合に大きな差がある場合は、モデルの性能を適切に表さないことがあります。
  * どのような誤分類が起きているかを確認するには、適合率、再現率、特異度などとあわせて評価する必要があります。

* 適合率 (Precision)
  * 適合率は、「TRUEと予測したもののうち、実際にTRUEだった割合」を示します。
  * 値は0から1の間で、1に近いほど、TRUEという予測の信頼性が高いことを意味します。
  * 実際はFALSEであるものを誤ってTRUEと予測する、偽陽性を少なくしたい場合に重視される指標です。
  * 例えば、TRUEと判定した対象に費用や対応作業が発生する場合は、適合率が重要になります。

* 再現率 (Recall)
  * 再現率は、「実際にTRUEであるもののうち、TRUEと正しく予測できた割合」を示します。
  * 値は0から1の間で、1に近いほど、実際のTRUEを見逃さずに検出できていることを意味します。
  * 実際はTRUEであるものを誤ってFALSEと予測する、偽陰性を少なくしたい場合に重視される指標です。
  * 例えば、重要な対象をできるだけ漏れなく発見する必要がある場合は、再現率が重要になります。

* 特異度（Specificity）
  * 特異度（Specificity）は、「実際にFALSEであるもののうち、FALSEと正しく予測できた割合」を示します。
  * 値は0から1の間で、1に近いほど「実際のFALSEのケースを誤ってTRUEと予測しない能力」が高いことを意味します。
  * 偽陽性（実際はFALSEなのにTRUEと予測）を最小化したい場合に重視される指標です。
  * 再現率（Recall）が実際のTRUEを正しく分類する能力を示すのに対し、特異度は実際のFALSEを正しく分類する能力を示します。

{end_show_hide}

## 混同行列 - 全体に対する割合

<% if (test_mode) { %>モデルがトレーニングデータとテストデータの各行に対して予測したうち、どれだけが実測値と同じ、または違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**全データに占める割合（％）**です。<% } else { %>モデルがトレーニングデータの各行に対して予測したうち、どれだけが実測値と同じ、または違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**全データに占める割合（％）**です。<% } %>

{{confusion_matrix_total}}

## 混同行列 - 実測値ごとの割合

<% if (test_mode) { %>モデルがトレーニングデータとテストデータの各行に対して予測したうち、どれだけが実測値と同じまたは違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**各実測値に占める割合（％）**です。<% } else { %>モデルがトレーニングデータの各行に対して予測したうち、どれだけが実測値と同じまたは違った値だったのかを対応表としてまとめたのが以下の表です。数値は各組み合わせの行数と**各実測値に占める割合（％）**です。<% } %>

{{confusion_matrix_row}}

## 予測確率の分布

モデルが各行に対して予測したTRUEの確率を、実測値がTRUEのグループとFALSEのグループに分けて表示します。2つの分布を比較することで、モデルがTRUEとFALSEをどの程度区別できているかを確認できます。

{{probability_distribution}}

- 実測値がTRUEのグループ（青）が右側の1に近い範囲に、実測値がFALSEのグループ（オレンジ）が左側の0に近い範囲に分かれ、2つの分布の重なりが小さいほど、モデルの識別性能が高いと考えられます。
- 2つの分布が重なっている範囲では、FALSEをTRUEと予測する誤検出や、TRUEをFALSEと予測する見逃しが発生しやすくなります。
- 縦軸は行数ではなく、分布の形を比較するための密度を表しています。そのため、曲線の高さからTRUEとFALSEの行数を比較することはできません。

## ROC曲線

ROC曲線は、TRUEと判定する境界値を変えたときに、TRUEを正しく見つける割合と、FALSEを誤ってTRUEと判定する割合がどのように変化するかを示します。縦軸の真陽性率は、実際のTRUEを正しくTRUEと判定できた割合で、再現率と同じです。横軸の偽陽性率は、実際のFALSEを誤ってTRUEと判定した割合で、1 − 特異度を表します。

{{roc_curve}}

<% if (test_mode) { %>- 青い線はトレーニングデータ、オレンジの線はテストデータの結果です。曲線が左上に近いほど、FALSEの誤検出を抑えながらTRUEを正しく見つけられており、分類性能が高いことを示します。灰色の対角線はランダムな予測と同程度の性能を表します。
- 実際の予測性能を評価する際は、テストデータの曲線を重視します。テストデータの曲線がトレーニングデータより大きく下にある場合は、未知のデータで性能が低下している可能性があります。
<% } else { %>- 青い線はトレーニングデータに対する結果です。曲線が左上に近いほど、FALSEの誤検出を抑えながらTRUEを正しく見つけられており、分類性能が高いことを示します。灰色の対角線はランダムな予測と同程度の性能を表します。
<% } %>- ROC AUCはROC曲線の下側の面積を表す指標です。1に近いほどTRUEとFALSEを区別する性能が高く、0.5の場合はランダムに分類した場合と同程度であることを示します。

## Precision-Recall曲線（PR曲線）

PR曲線は、TRUEと判定する境界値を変えたときに、適合率と再現率がどのように変化するかを示します。縦軸の適合率は、TRUEと予測した行のうち、実際にTRUEだった割合です。横軸の再現率は、実際のTRUEのうち、正しくTRUEと予測できた割合です。

{{pr_curve}}

<% if (test_mode) { %>- 青い線はトレーニングデータ、オレンジの線はテストデータの結果です。曲線が右上に近いほど、TRUEを多く見つけながら、誤ってTRUEと判定するケースも少なく、モデルの性能が高いことを示します。
<% } else { %>- 青い線はトレーニングデータに対する結果です。曲線が右上に近いほど、TRUEを多く見つけながら、誤ってTRUEと判定するケースも少なく、モデルの性能が高いことを示します。
<% } %>- 一般に、再現率を高めると適合率が低下し、適合率を高めると再現率が低下するため、この曲線から両者のトレードオフを確認できます。
- PR AUCはPR曲線の下側の面積を表す指標です。TRUEの件数が少ないデータでは、ROC AUCよりも、TRUEを見つける性能と誤検出のバランスを捉えやすい傾向があります。

# 境界値の検討

予測確率が境界値以上の行をTRUE、境界値未満の行をFALSEと予測します。境界値を変更すると、TRUEの見つけやすさを表す再現率、TRUE予測の正確さを表す適合率、FALSEを正しく判定する特異度などの評価指標が変化します。

## 推奨境界値

<% if (cut && cut.available) { %>以下は、TRUEとFALSEを分ける現在の境界値と、\`<%= cutMethodShort %>\`を前提に計算された推奨境界値です。<% } %>

<% if (cut && cut.available) { %>
{{threshold_recommendation}}
<% } else if (cut && (cut.status === 'missing_minimum_recall' || cut.status === 'missing_minimum_precision')) { %>
プロパティの「<%= cut.status === 'missing_minimum_recall' ? '最低再現率' : '最低適合率' %>」が未入力です。値を入力してから実行し直してください。
<% } else if (cut && cut.recommended_is_above_max) { %>
すべてをFALSEと予測する境界値が最も良い評価になりました。このモデルではTRUEを識別できていない可能性があるため、説明変数やデータを見直してください。
<% } else if (cut && (cut.status === 'no_threshold_for_minimum_recall' || cut.status === 'no_threshold_for_minimum_precision')) { %>
指定した<%= cut.status === 'no_threshold_for_minimum_recall' ? '再現率' : '適合率' %><%= cut.status_value_display %>以上を満たす境界値がありません。<% if (cut.best_achievable_display) { %>このデータで到達できるのは<%= cut.best_achievable_display %>までです。<% } %>条件を緩めるか、モデルを見直してから実行し直してください。
<% } else { %>
推奨境界値の計算には、評価対象にTRUEとFALSEの両方が必要です。このデータでは推奨値を計算できません。
<% } %>

<% if (cut && cut.available) { %>
推奨境界値は、\`推奨値計算の前提\`に基づいて算出された値です。\`推奨値計算の前提\`は[「設定」](chrome-extension://analytics/settings/threshold_objective)より変更できます。
<% } %>

<% if (cut && cut.available) { %>
## 現在値と推奨値の比較

<% if (cut.is_same_as_current) { %>
現在の境界値はすでに推奨値と同じため、これらの指標は変わりません。
<% } else { %>
境界値を<%= cut.current_threshold_display %>から<%= cut.recommended_threshold_display %>に<% if (parseFloat(cut.recommended_threshold_display) < parseFloat(cut.current_threshold_display)) { %>下げると<% } else { %>上げると<% } %>、再現率は<%= cut.by_id.recall.current_display %>から<%= cut.by_id.recall.recommended_display %>に<% if (cut.by_id.recall.delta > 0) { %>上がります<% } else if (cut.by_id.recall.delta < 0) { %>下がります<% } else { %>保たれます<% } %>。一方、TRUEと予測される対象は<%= cut.by_id.predicted_positive.current_display %>件から<%= cut.by_id.predicted_positive.recommended_display %>件に<% if (cut.by_id.predicted_positive.delta > 0) { %>増え<% } else if (cut.by_id.predicted_positive.delta < 0) { %>減り<% } else { %>保たれ<% } %>、適合率は<%= cut.by_id.precision.current_display %>から<%= cut.by_id.precision.recommended_display %>に<% if (cut.by_id.precision.delta > 0) { %>上昇します<% } else if (cut.by_id.precision.delta < 0) { %>低下します<% } else { %>保たれます<% } %>。
<% } %>

### 予測件数

{{threshold_prediction_counts}}

### 予測性能指標

{{threshold_comparison}}

<% } %>

<% if (cut && cut.has_curve) { %>
## 境界値チャート

予測確率をTRUEまたはFALSEに分類する境界値を変えたときに、再現率、適合率、均衡正解率などの評価指標がどのように変化するかを示します。

{{threshold_chart}}

境界値を下げると、より多くの行がTRUEと予測されるため、一般に再現率は高くなります。一方で、実際にはFALSEの行もTRUEと予測されやすくなるため、適合率や特異度は低下する傾向があります。

<% if (cut && cut.available) { %>現在の境界値と推奨境界値を比較することで、TRUEの見逃しをどの程度減らせるか、また、その代わりに誤ったTRUE予測がどの程度増えるかを確認できます。<% } %>特異度やF1スコアなどの指標は、設定の「境界値の検討」で選択するとチャートに追加できます。
<% } %>

## 学習回数と精度の向上

{start_lazy_show_hide}
### チャート
{{learning_curve_logical}}
{end_lazy_show_hide}

# 予測結果

{{data}}

# 補足情報

モデルの評価：このモデルの予測性能をより厳密に評価するために、トレーニングデータとテストデータに分けて検証することができます。その場合は、[「設定」](chrome-extension://analytics/settings/test_mode)より「検証」セクションの下の「テストモード」をTRUEに設定し、実行し直してください。

新しいデータに対する予測：作成したモデルを使って新しいデータに対して予測をしたいときには、予測をしたい対象のデータフレームに「モデルで予測（アナリティクス・ビュー）」のステップを追加します。詳細は、[こちらのノート](https://exploratory.io/note/exploratory/AAI3Mle3)をご参照ください。
`;
module.exports = template;
