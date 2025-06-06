const template = `


<% if (algorithm == 'pearson') { %>
全ての変数の組み合わせに対し相関係数を計算しました。相関係数の計算のアルゴリズムは「ピアソン」が使われています。アルゴリズムは[「設定」](//analytics/settings/do_cor_argo)より変更可能です。
<% } else { %>
全ての変数の組み合わせに対し相関係数を計算しました。相関係数の計算のアルゴリズムは「スピアマン」が使われています。アルゴリズムは[「設定」](//analytics/settings/do_cor_argo)より変更可能です。

<% } %>

# 相関の強さ

<% if (!repeat_by) { %>
全ての変数の組み合わせの相関係数を計算し、それぞれの値を以下のルールに従って色付けし、ヒートマップと呼ばれる表にまとめました。

<% } else { %>
全ての変数の組み合わせの相関係数を計算し、それぞれの値を以下のルールに従って色付けし、<%= repeat_by %>ごとにヒートマップと呼ばれる表にまとめました。
<% } %>

* 1（正の相関の最大値）に近いほど濃い赤
* -1（負の相関の最大値）に近いほど濃い青
* 0（相関がない）に近いほどグレー

{{correlation_chart:0.8}}

「相関係数を表示」にチェックを付けるとヒートマップ上に相関係数が表示されます。


## 相関係数について

相関係数は-1から1の間の値をとり、変数間の相関関係の強さと方向を示します。

* 1に近いほど強い正の相関（一方が増加すると他方も増加）
* -1に近いほど強い負の相関（一方が増加すると他方は減少）
* 0に近いほど相関が弱い、または存在しない

相関係数の解釈の目安は以下となります。

* 0.8 ~ 1.0 (または -0.8 ~ -1.0): 非常に強い相関
* 0.6 ~ 0.8 (または -0.6 ~ -0.8): 強い相関
* 0.4 ~ 0.6 (または -0.4 ~ -0.6): 中程度の相関
* 0.2 ~ 0.4 (または -0.2 ~ -0.4): 弱い相関
* 0.0 ~ 0.2 (または -0.0 ~ -0.2): ほとんど相関なし、または無相関

## 注意点

* 相関係数は変数間の因果関係を示すものではなく、あくまで2つの数値型の変数が共に同じ方向に変動するという意味での関係の強さを示す指標です。
* 相関係数のアルゴリズムはデフォルトで**ピアソンの相関係数**が使われていますが、もし変数間に直線的（線形）ではないが何らかの単調な関係がある場合、**スピアマンの順位相関係数**の方が相関関係をより適切に捉えることができます。アルゴリズムは[「設定」](//analytics/settings/do_cor_argo)より変更可能です。
* スピアマンの順位相関係数は元の値を順位としての値に変化したあとに、ピアソンの相関係数と同じ方法で相関係数を計算します。2つの相関係数の詳細は、[こちらのノート](https://exploratory.io/note/exploratory/2-BsF1LQF4)をご参照ください。


# 相関の有意性

<% if (!repeat_by) { %>
全ての変数の組み合わせの相関係数の有意性を判断するための仮説検定を行い、その結果を以下のルールに従って散布図にまとめました。

<% } else { %>
全ての変数の組み合わせの相関係数の有意性を判断するための仮説検定を行い、その結果を以下のルールに従って<%= repeat_by %>ごとに散布図にまとめました。

<% } %>

* 赤：正の相関
* 青：負の相関
* グレー：有意と言えない場合
* 丸の大きさ：相関係数

{{significance_chart:0.8}}

## 仮説検定について

相関係数の仮説検定にはt検定が使われ、それぞれの相関係数に対してP値が算出されています。P値は相関係数がデータのばらつきによる偶然なものである確率を示します。

* P値が<%= baseline_p_pct %>%より小さい場合、算出された相関係数は統計的に有意であると言えます。
* P値が<%= baseline_p_pct %>%より大きい場合、算出された相関係数は統計的に有意とは言えません。

現在の有意水準（P値）は<%= baseline_p_pct %>% (<%= baseline_p %>)に設定されていますが、これは[「設定」](//analytics/settings)より変更可能です。

## 相関係数と検定結果のデータ

全ての変数間の組み合わせにおける相関係数やP値などを以下の表にリストしています。

{start_show_hide}
### テーブル（表）
{{data}}

## 統計指標の説明

* 相関係数
  * 相関係数は2つの変数間の線形関係の強さと方向を示す統計量です。
  * 値は-1から1の間で、1は完全な正の相関、-1は完全な負の相関、0は相関がないことを示します。

* P値
  * P値は観測された相関係数が偶然によるものである確率を示します。
  * 一般的に5%（0.05）未満であれば、統計的に有意であると判断されます。
  * 値は0から1の間で、P値が小さいほど統計的有意性が高いことを示します。

* t値
  * t値は相関係数の検定に使用されるt検定で使われる統計量で、「相関係数÷相関係数の標準誤差」で算出されます。
  * データのサイズが大きければt値の値は大きくなり、小さければt値の値も小さくなる傾向があります。
  * 絶対値が大きいほど、相関係数が0（無相関）ではない可能性が高いことを示します。
  * t値の絶対値が大きいほど、P値は小さくなります。
{end_show_hide}

# 補足情報

## 次のステップ

<% if (!repeat_by) { %>
* グループ別分析：グループごとに相関分析を実施することで、それぞれのグループ内での相関関係をより詳細に理解できるかもしれません。その場合は、「繰り返し」にグループとなる変数を選択し、実行し直すことができます。
<% } %>
* 外れ値の確認：変数の中で外れ値がないか確認し、必要に応じて対処することで、より正しい関係性の解釈ができる可能性があります。
* 多変量分析：2つの変数間に相関関係があったとしても、それは他の相関関係のある変数による影響である可能性もあります。そこで「線形回帰」などを使った多変量分析を使い、目的となる変数に対して他の変数による効果を考慮したうえで、変数間の関係をより適切に分析することをお薦めします。



`;

module.exports = template;
