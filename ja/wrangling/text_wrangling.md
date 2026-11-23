---
title: "テキストデータの加工"
sidebarTitle: "テキストデータの加工"
description: "列ヘッダメニューの「テキストデータの加工」で、文字列を取り除く・置換する・抽出します。"
---

テキストデータの加工は、表記揺れや不要な文字を整えたり、文字列を置換・抽出したりする機能です。加工には、削除・置換・抽出・変換の4つのタイプがあります。列ヘッダメニューの「テキストデータの加工」から、操作タイプを選んで使います。

## 不要な文字列を取り除く

今回はユニコーン企業のデータを使用していきます。

![](images/ja/text_wrangling-01.png)

投資家の列にある「Softbank」に注目をしてみると、「Softbank Group」や「Softbank Corp」といった文字列になっていることがわかります。

![](images/ja/text_wrangling-02.png)

Softbank GroupのGroupの文字を取り除いて、Softbankにしていきたいです。

![](images/ja/text_wrangling-03.png)

列ヘッダメニューから「テキストデータの加工」の「取り除く」の「文字列」を選択します。

![](images/ja/text_wrangling-04.png)

テキストデータの加工のダイアログが表示されました。

![](images/ja/text_wrangling-05.png)

検索ボックスに「softbank」と指定することで、「softbank」の文字列が含まれる値のみが表示されます。

![](images/ja/text_wrangling-06.png)

「Softbank Group」の「Group」の文字を取り除いて、Softbankにしたいです。

![](images/ja/text_wrangling-07.png)

文字に「Group」を指定します。そうすることで、元の値のGroupという文字が太文字でハイライトされています。

![](images/ja/text_wrangling-08.png)

プレビューボタンをクリックすると、Groupを取り除いてSoftbankになっていることがわかります。

![](images/ja/text_wrangling-09.png)

ちなみに、「大文字・小文字を無視する」のオプションが適用されていたために、「group」といった先頭が全て小文字のものでも文字列が一緒なので取り除かれていました。

「大文字・小文字を無視する」のチェックを外すと、「文字」に指定したものと完璧にマッチしない限り、取り除かれないようになっています。

![](images/ja/text_wrangling-10.png)

今回は文字列さえ一致していれば大文字・小文字は関係なしに取り除きたいため、「大文字・小文字を無視する」にチェックをつけます。

![](images/ja/text_wrangling-11.png)

Groupの文字列は取り除くことができましたが、「Corp」や「Capital」といった文字列も一緒に取り除きたいです。

![](images/ja/text_wrangling-12.png)

タイプに「文字列（複数の候補）」を選択します。

![](images/ja/text_wrangling-13.png)

文字に「Group, Corp, Capital」のように、カンマ（,）区切りで取り除きたい文字列を複数指定します。

![](images/ja/text_wrangling-14.png)

プレビューボタンをクリックすることで、新しい値を「Softbank」としてきれいに整えることができました。

![](images/ja/text_wrangling-15.png)

実行をすることで、「Group」や「Corp」などの文字列を取り除き、「Softbank」のようにきれいに整えることができました。

![](images/ja/text_wrangling-16.png)

投資家の列の「i」をクリックすることで、「Softbank」が投資した企業数は31件あることがわかります。

![](images/ja/text_wrangling-17.png)

## 指定した文字列を置換する

今回はオンラインショップの売上のデータを使用していきます。1行が1つの注文、かつ商品ごとに行が分かれているデータです。

自分がコピー機の販売担当をしているケースとして、製品サブカテゴリを「コピー機」に絞り込んでいます。

![](images/ja/text_wrangling-18.png)

製品名の列に注目すると「Hewlett Packard」の製品は「HP」や「Hewlett」といった文字列になっており、表記が統一されていないことがわかります。

![](images/ja/text_wrangling-19.png)

そのため製品名の中にある「Hewlett」といった文字列を「HP」に置き換えたいです。

列ヘッダメニューから「テキストデータの加工」の「置換する」の「文字列」を選択します。

![](images/ja/text_wrangling-20.png)

テキストデータの加工のダイアログが表示されました。

![](images/ja/text_wrangling-21.png)

検索ボックスに「Hewlett」と指定することで、「Hewlett」の文字列が含まれる値のみが表示されます。

![](images/ja/text_wrangling-22.png)

変換元の文字に「Hewlett」を、変換先の文字に「HP」を指定します。そうすることで、元の値の「Hewlett」という文字が太文字でハイライトされています。

![](images/ja/text_wrangling-23.png)

プレビューボタンをクリックすると、「Hewlett」が「HP」といった文字で置き換わっていることがわかります。

![](images/ja/text_wrangling-24.png)

「Hewlett」を「HP」に置き換えることはできましたが、他にも「Hewlett Packard」といった文字列が含まれていることがわかります。そのため、「Hewlett Packard」と「Hewlett」を同時に「HP」に置き換えたいです。

![](images/ja/text_wrangling-25.png)

タイプに「文字列（複数の候補）」を選択します。

![](images/ja/text_wrangling-26.png)

文字に「Hewlett Packard, Hewlett」のように、カンマ（,）区切りで置換したい文字列を複数指定します。

![](images/ja/text_wrangling-27.png)

プレビューボタンをクリックすることで、「Hewlett Packard」と「Hewlett」を「HP」として置き換えられていることがわかります。

![](images/ja/text_wrangling-28.png)

実行をすることで、「Hewlett Packard」と「Hewlett」を「HP」として置き換えることができ、異なる表記になっていた文字列を統一できました。

![](images/ja/text_wrangling-29.png)

## 製品名からブランド名を抽出する

製品名の列からブランド名を抽出することも可能です。

![](images/ja/text_wrangling-30.png)

製品名の列から「テキストデータの加工」の「抽出する」の「最初の単語」を選択します。

![](images/ja/text_wrangling-31.png)

抽出する単語のタイプには「最初の単語」を、区切り文字には「スペース ( )」を選ぶことで、最初の単語であるブランド名を抽出できます。

![](images/ja/text_wrangling-32.png)

ブランド名を抽出できたら、ブランド名の列の「i」をクリックすると、ブランドごとの行数を確認できます。今回のデータでは、「HP」は294件と最も多いことがわかります。

![](images/ja/text_wrangling-33.png)

## 指定した文字の間の文字列を抽出する

今回は日本の歴代の総理大臣のデータを使用していきます。

![](images/ja/text_wrangling-34.png)

死去年月日の列には死亡時の年齢を表す「享年」の情報が括弧の中に含まれてしまっています。

![](images/ja/text_wrangling-35.png)

今回は、死去年月日の文字列から括弧にある「享年」の情報を抽出して新しく列を作りたいです。

![](images/ja/text_wrangling-36.png)

列ヘッダメニューから「テキストデータの加工」の「抽出する」の「指定した文字の中の文字列」を選択します。

![](images/ja/text_wrangling-37.png)

テキストデータの加工のダイアログが表示されました。

![](images/ja/text_wrangling-38.png)

開始文字と末尾文字にそれぞれ、「括弧始まり」、「括弧閉じ」を指定します。そうすることで、元の値の括弧とその中に含まれる享年の文字が太文字でハイライトされています。

![](images/ja/text_wrangling-39.png)

プレビューボタンをクリックすると、元の値から括弧の中にある「享年」の情報を抽出できています。しかし、開始文字と末尾文字に指定をした括弧も同時に含まれています。

![](images/ja/text_wrangling-40.png)

今回のように開始文字と末尾文字に指定をした文字を含みたくない場合は、「指定した文字を含む」に「いいえ」を選択します。これによって、括弧を除いて89歳のように享年のみの情報を取り出すことができました。

![](images/ja/text_wrangling-41.png)

今回は**新しい列**として取り出した「享年」の列を作りたいため、「新しく列を作成」にチェックをつけて列名に「享年」と指定します。

![](images/ja/text_wrangling-42.png)

実行をすることで、死去年月日の列から「享年」の情報を抽出して、新しく列として作成できました。

![](images/ja/text_wrangling-43.png)

しかし、享年は数値情報となりますが、データタイプが文字列（Character）型になっています。そのため、数値（Numeric）型に変換をしていきましょう。

列ヘッダメニューから「データタイプを変換」を選び、「Numeric (数値) 型に変換」を選択します。

![](images/ja/text_wrangling-44.png)

計算を作成のダイアログが表示され、計算エディタには「parse_number」といった数値のみを取り出して、数値型に変換する関数が指定されています。

そのため、そのまま実行ボタンをクリックしましょう。

![](images/ja/text_wrangling-45.png)

これによって「享年」の列を数値（Numeric）型に変換できました。

![](images/ja/text_wrangling-36.png)

最後に、享年の列から「i」をクリックすることで、分布やサマリ情報を確認できます。

![](images/ja/text_wrangling-46.png)
