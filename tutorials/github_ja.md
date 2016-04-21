これから、このGitHubのデータを利用して、issuesを閉じるのにかかった平均の時間や Pull Requestsを閉じるのにかかった平均の時間を計算してみるとプロジェクトを進める上で役に立つと思いませんか？その方法をこれから順を追って説明したいと思います。


###GitHubのデータから不必要なカラムを取り除く


いまここには、86カラムがあります。
![Alt text](./cc70fc82bcae1d47cda47de4b6850a01.png)





しかし、本当にすべてのカラムが必要でしょうか？
すべてのカラムの名前を見てみましょう。見るとわかるように、このデータは、Issuesだけでなく Pull Requestsも含んでいます。Issuesや Pull Requestsを閉じるのにかかった平均の時間を計算するために、私たちは、後で issuesのopenとclosedの2つのタイプを区別する必要があります。だから、今回はpull_requests.urlカラムを除いてurlという名前で終わるカラムは必要ありません。

つまり、私たちは、urlで終わる名前のカラムをすべて取り除く前に、pull_request.urlカラムの名前を変えておく必要があります。ここでは、pull_request.urlカラムの名前をpr_keyという名前に変えたいと思います。

    rename(pr_key = pull_request.url)

![Alt text](./b553986691e7738ce0f0266f42d0337f.png)
![Alt text](./d03e4b81747f64db89bf344a0ac0f6e1.png)



次にurlという名前で終わるカラムをすべて取り除きます。

    select(-ends_with("url"))

これで、元々が86カラムだったのに対して、38カラムになりました。

![Alt text](./ee682d503dbe76636fff41ff55ecea8f.png)



###名前を変えて、不必要なカラムをもっと減らす

私たちは、また、userやassigneeやmilestoneという名前で始まるたくさんのカラムを確認することができますね。

![Alt text](./398c99fa16b805031c20c2e582576b2e.png)




しかし、私たちに本当に必要なカラムは、おそらくそれぞれのカラムにつきたったひとつだけでしょう。例えば、 userカラムの場合は、開発者の名前が含まれているuser.loginカラムしかuserで始まるカラムは必要ではありません。

不必要なカラムを取り除く前に、わかりやすくするためにuser.loginカラムをreported_byに, assignee.loginをdeveloperに, and milestone.titleの名前をreleaseに変えましょう。

    rename(pr_key = pull_request.url,
           reported_by = user.login,
           developer = assignee.login,
           release = milestone.title)

![Alt text](./0f0528a035045fe9e159147c32b4335e.png)





下記のように、select()コマンドの中にstarts_with()関数を使うことによって、指定した文字から始まる不必要なカラムを取り除くことができます。また、titleカラムも使わないので取り除きます。

    select(-ends_with("url"), -starts_with("user"),
           -starts_with("assignee"), -starts_with("milestone"),
           -title)

これでたった14カラムだけになりましたね。

![Alt text](./9446879c74823765565b0d23a6c58029.png)


###データタイプをTextカラムからDateカラムに変えよう

created_atカラムやclosed_atカラムを利用すれば、 issueを閉じるのにどれくらい時間がかかったかを計算することができます。しかし、問題はこれらのカラムのデータのタイプが characterになっていることです。だから、まず私たちはデータのタイプをcharacterからdateに変える必要があります。

まず、どうやってデータを分析していくかの感覚を掴むために、このcreated_atカラムとclosed_atカラムの2つに絞ってみましょう。

    select(created_at, closed_at)

![Alt text](./962eedc1df194cd7d44f623d3664bf8c.png)




見てみると、データが年、月、日、時間、分、秒の順になっていますよね。この場合は、ymd_hms()関数を使うと、下記のようにデータタイプをcharacterからPOSIXctというdateタイプに変えることができます。


    mutate(created_at = ymd_hms(created_at),
           closed_at = ymd_hms(closed_at))


同じように見えるかもしれませんが、これで私たちは、データタイプがcharacterではなくPOSIXctとして表示されているデータを見ることができるようになりました。

![Alt text](./4ca15a1e03dbc8f27f6abe6d30c1dbf7.png)



###closedになっているissuesだけに集中しよう

私たちは、このプロジェクトにおいて平均してissuesを閉じるのにどれくらいの時間がかかるかを計算しようと思っています。だから、すでにclosedになっているissuesだけに集中して見てみましょう。stateというissuesの状態を表したカラムがあります。 見てみると、openとclosedのどちらの値も入っていますね。

![Alt text](./e7a21e306b46a085abef91af09efe92c.png)


だから、stateの値が、closedになっているものだけfilterをかけましょう。

    filter(state == "closed")

これで1680rowsになりましたね。

![Alt text](./50f9cb6b11cb011f71f923ad126248e5.png)



###issueを閉じるのにどれくらいの日がかかったのかを計算してみましょう。

issueが閉じられた日付を表すclosed_atカラムの日付からissueが生まれた日付を表すcreated_atカラムの日付を引いて、issueを閉じるのにどれくらいの日がかかったのかを計算してみましょう

    mutate(age = closed_at - created_at)
    select(number, age)

![Alt text](./a5d9d33cb5c499b4d3058593fced5da8.png)

この計算された値のデータタイプは、difftimeになっています。そして、単位が分として表示されています。私たちは下記のように、as.numeric()関数を使うことによって、データタイプをdifftimeからnumericに、そして、unitsで指定することによって単位を分から日に変えることができます。

    mutate(age = as.numeric(closed_at - created_at, units = "days"))

![Alt text](./781bada2f0dfef90abcf36123a4adf4d.png)





###issuesを閉じるのにかかった平均の時間を計算してみましょう

issuesを閉じるのにかかった平均の時間を計算したいと思います。下記のように、summarizeコマンドと平均を計算するmean関数を使うことによって表示することができます。

    summarize(age_average = mean(age))

 ![Alt text](./5dc098428c96037567a2855b6ae5013a.png)


それぞれの開発者別の平均時間はどうなっているんでしょう？　summarize()コマンドの前にgroup_by()コマンドを加えると見ることができます。

    group_by(developer)

![Alt text](./1faa10f180a0383ae9a54eef29e94bf5.png)


Hadleyさんはissuesを閉じるのに約128日かかってますね。でも、私の記憶が正しければ、いくつかのissuesはずっと閉じられなかったはずです。ご存知のように、このデータは、IssuesとPull Requestsの両方を含んでいるんでしたね。なので、Pull Requestのissuesだけに集中して見てみましょう。


###Pull Requestsを閉じるのにかかった平均時間を計算しましょう

issueがIssuesかPull Requestsのものかを区別するために、わかりやすいように名前を変えたpr_keyカラムを使います。私たちは、カラムの値がNA値かそうでないかをチェックすることができ、下記のように、filter()関数を使って、NA値ではないカラムに集中して見ることができます。

    filter(state == "closed" & !is.na(pr_key))


![Alt text](./15426137bcf119fb0dc9366ddbbbdf9e.png)


これでHadleyがissuesを閉じるのにかかっている平均時間は 61.86 daysに減りましたね。でも、developer カラムのNA値がなにを意味してるのか不思議ではないでしょうか？　そこで、 NA値を含めていくつのissuesがそれぞれのdevelopersに割り当てられているのか計算してみましょう。

    summarize(age_average = mean(age), counts = n())

![Alt text](./8e8937008d4b374d2d9ba534e9b6633b.png)



あれ？pull requestsのほとんどは、特定の開発者に割り当てられていたわけではなかったということですね。私は、pull requestsのほとんどがhadleyかromainfrancoisによって閉じられたと確信しています。だから、少なくとも私たちが分析してきたやり方では、このプロジェクトのissuesやpull requestsを閉じるのにかかった平均の日付を出すことはできませんでした。しかし、このようにして、私たちはプロジェクトの開発の分析を行うことができました。あなたも、自分のプロジェクトの開発を分析してみませんか？

参考：https://medium.com/learn-dplyr/analyzing-issue-data-with-github-rest-api-63945017dedc#.5mzzt8gxd

