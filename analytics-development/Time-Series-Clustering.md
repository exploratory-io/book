const template = `
# 分析結果

<%= value %>の時系列データを使って<%= group %>を<%= number_of_clusters %>つのクラスター（グループ）に分類しました。

{{summary_chart}}

# 主要な統計指標

* クラスター ID
  * クラスター ID はそれぞれの<%= group %>が属するグループを示す一意の識別子です。
  * 時系列の形状や変化の傾向に基づいて自動的に割り当てられますが、IDの値自体には意味はありません。

* グループの数
  * 各クラスターに含まれる<%= group %>の数を示します。
  * クラスター間で<%= group %>の数に大きな偏りがある場合は、クラスター数の調整や外れ値の確認が必要かもしれません。

* グループの数 (比率)
  * <%= group %>全体に対して、各クラスター内の<%= group %>が占める割合です。
  * 0〜1の値で表され、合計は1（つまり100%）になります。

* クラスター内の距離
  * 同じクラスター内の間の<%= group %>間の類似性の度合いを数値化したものです。
  * 値が小さいほど、クラスター内の時系列のパターンが類似していることを示します。
  * クラスター間で距離の値を比較することで、どのクラスターが最も均質か、どのクラスターに多様なパターンが含まれているかを判断できます。


<% if (normalize) { %>
## 標準化された時系列のパターン

以下のチャートでは、<%= group %>ごとの<%= value %>を標準化（平均0、標準偏差1に変換）して表示しています。標準化により、値の大きさの違いを排除し、変化のパターンのみに焦点を当てることができます。これにより<%= value %>の大きいグループと<%= value %>の小さいグループの変化率や変化の形状を同じスケールで比較でき、パターンの類似性をより明確に把握できます。

{{normalized_time_series}}

<% } %>

## 時系列のパターン

以下のチャートは、<%= group %>ごとの<%= value %>の実測値の推移を、クラスターごとに可視化しています。各線が一つの<%= group %>を表し、Y軸は実際の値、X軸は日付/時間を示しています。各クラスターがどのような実際の値の範囲や変動を示しているかを視覚的に確認できます。

{{time_series}}

## クラスターの中心パターン

以下のチャートでは、各クラスターの「代表的なパターン」を赤色の線で表示しています。この中心線は、クラスター内の<%= group %>の平均的な時系列データを表しており、そのクラスターの特徴を把握することに役立ちます。

{{cluster_centers}}

## クラスターのメンバー構成

以下の表は、各グループがどのクラスターに属しているかをテーブル形式で示しています。それぞれの<%= group %>がどのクラスターに属しているかを直感的に理解することに役立ちます。

{{cluster_members}}

# 補足情報

## データの有効性確認

以下のテーブルは、分析に使用したそれぞれの<%= group %>のデータが、十分にあるかを表します。

緑色の点は十分なデータがあることを示しており、データが欠損している、あるいは、足りない期間はグレーで表されます。この情報により、分析結果の信頼性や、特定の期間のデータ品質を評価できます。

{start_lazy_show_hide}
### チャート
{{data_confirmation}}
{end_lazy_show_hide}

## 時系列データ

以下のテーブルは、<%= group %>ごとの<%= value %>の集計データと時系列クラスタリングの結果を表しています。テーブルには各時点における<%= group %>ごとの集計値と標準化した値、クラスター ID、が含まれています。

{start_lazy_show_hide}
### チャート
{{data}}
{end_lazy_show_hide}

<% if (elbow_method_mode) { %>

# 最適なクラスター数

K-Means クラスタリングで「最適なクラスタ数（K）」を選ぶための視覚的な手法の1つとしてエルボー法が使えます。

仕組み：

1. クラスター数を1から10まで変化させながらK-Means クラスタリングを実行。
2. 各クラスター数に対してクラスター内のデータのばらつきの総和（クラスター内平方和）を計算。
3. クラスター数を横軸、クラスター内のばらつきを縦軸にラインチャートで可視化。
4. グラフの形が急激に減少したあとで緩やかになる「ひじ（Elbow）」となるあたりが最適なクラスター数。

必要ない場合は、[「設定」](//analytics/settings)より無効にできます。また最大クラスター数も変更可能です。

エルボー法についての詳細は、[こちらのノート](https://exploratory.io/note/exploratory/K-Means-QRV2jAz0#エルボーメソッドによるクラスター数の決定)をご参照ください。

## エルボーカーブ

エルボー法を使って、各クラスター数のクラスター内平方和をエルボーカーブと言われる線を使って可視化したのが以下のチャートです。

{{elbow}}

クラスタ数が少ないとクラスター内のデータのばらつきは大きいため、ある地点まではクラスター数を増やすとばらつきは大きく減少します。しかし、ある地点を過ぎると、ばらつきの減少量は徐々に小さくなります。この「急減から緩やかになる境目（ひじ（Elbow）」が「最適なクラスター数」としての目安です。ただ、ある数のクラスターに分けたあと、それぞれのクラスターの特徴が理解しやすく、有用であるかといった点も現実的には重要となるため、あくまでも参考程度にご使用ください。

## ばらつきの減少度

エルボーカーブのチャートでは、どこが「ひじ（Elbow）」となるのか視覚的にはっきりしない場合があります。そのような場合は、エルボーカーブの線の下降度（クラスター内のデータのばらつきの減少度）の数値を比べ、値が一定になる辺りが「最適なクラスター数」としての目安として参考にできます。

{{elbow_diff}}

<% } %>


# 次のステップ

* クラスター数の最適化：現在のクラスター数が適切かどうかを検討し、必要に応じて異なるクラスター数で分析を再実行してください。少ないクラスター数では大まかな傾向を、多いクラスター数ではより詳細なパターンを把握できます。
* 時間範囲の調整：異なる期間に焦点を当てることで、特定のイベントや季節性の影響をより詳細に分析できます。例えば、直近のデータのみを使用したクラスタリングと長期データを使用したクラスタリングの結果を比較することで、パターンの変化を理解できます。
* 定期的な再分析：時間の経過とともにパターンは変化する可能性があります。定期的にクラスタリングを再実行することで、新たなトレンドや変化を早期に把握できます。

`;
module.exports = template;