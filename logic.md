# 序

這本書探討的主題是**邏輯**。在最最開始，我要先說明邏輯到底是什麼。邏輯一詞起源於希臘文的λογική，經由拉丁文和古法文變為英文的logic，也有人意譯為*理則學*。至於邏輯的定義，數理邏輯的開創者弗雷格是這麼說的：

> 發現真實是所有科學的任務，邏輯便是用來辨別「真實性的定律」。我將邏輯學定義為發現真實性的定律的工作，而非發現斷言或想法的定律的工作。

**傳統邏輯**是古希臘人開創的邏輯學，亞里斯多德便是其中的先驅者。亞里斯多德對邏輯學最大的貢獻是**三段論**。三段論以兩個有效的前提推得一個結論。最著名的例子如下：

> 人都會死。
> 蘇格拉底是人。
> 所以人都會死。

其中，「人都會死」被稱為**大前提**，「蘇格拉底是人」則是**小前提**。有效的大前提和小前提能導出結果。前提和結論都被稱為**命題**。

19世紀中葉開始，**現代邏輯**崛起，數學家開始試圖將所有數學建構在嚴謹的邏輯上。一般來說，現代邏輯被分為**命題邏輯**、**一階邏輯**和**集合論**，命題邏輯能用來理解命題之間的關係是否為真，舉例來說，如果「A」此一命題是對的，則「A或B」必定是對的，但「A和B」則不然；命題邏輯讓我們有了關聯各命題的能力。建基於命題邏輯之上的一階邏輯則能讓我們表達「所有...都...」或者「存在...使得...」，例如上面提到的「人都會死。」這個命題以現代邏輯表示就必須使用到一階邏輯，一階邏輯有時也定義了何謂等號。在一階邏輯與數學之間的則是**集合論**，集合論規範了集合應有的表現。一個集合包含了零個或更多個**元素**；集合能以命題生成，例如我們可以說一個集合的內容即為所有滿足某命題的元素；集合可以嵌套，意即集合能包含其它集合。所有數學再依序被建構於集合論之上。

1900年，數學家希爾伯特在國際數學家大會上提出了意義深遠的23個問題，橫跨數學的各個領域，其中第二個就是證明邏輯系統的**一致性**，一個系統是一致的當它的所有命題並不都可證明：顯然，一個所有命題都正確的邏輯系統是沒什麼意義的。除了一致性之外，希爾伯特還希望邏輯系統具有**完備性**，也就是說一個命題一定能被證明為正確或錯誤；一致且完備的系統能為數學提供穩固的根基。很可惜的是，希爾伯特的夢想在1931年被徹底地粉碎了。哥德爾證明了一個一致的夠強邏輯系統必定是不完備的，而且這樣的系統也無法證明自身的一致性。

以上當時被做為根基的現代邏輯在現在被稱為**古典邏輯**（我必須承認這樣的名詞容易讓人困惑），在古典邏輯中，一個命題非真即假。這本書雖然會解釋古典邏輯，更重要的是想介紹**直覺主義邏輯**的精髓。在看到了現代邏輯引出了各個悖論，最終仍無法證明自身一致性且不完備後，數學家們採取的另一個路線是完全拋棄完備性，而只證明那些可被建構的命題。「可被建構」聽起來或許像是個模糊不清的詞彙，但感謝科技的發展，包括可攜帶的智慧型手機以及手錶，電腦已經成為家家戶戶皆有的一項電子產品，現在我們知道「可被建構」和「可被計算」是等價的，而直覺主義邏輯和**程式語言**有著一對一的對應關係。為了將讀者帶進直覺主義邏輯的世界中，本書會依序介紹三個程式語言：Scala、Haskell與Agda，最終使用Agda進行直覺主義邏輯上命題的證明。

---

# 抽象與遞迴

## 抽象

> 我們用診斷性的標籤整理並簡化（概念），但任何你如此得到的分類必須忽略其他很多事情，而你求你忽略的事情並沒有差。

心理學家Franz Epting是這麼說的。而這樣的「標籤」便被稱為**抽象**。哲學上，**化約論**提出這個複雜的世界能被分別以簡單的概念建構而被理解。在這邊舉幾個例子吧，首先是常識性的：

![透視法](https://upload.wikimedia.org/wikipedia/en/e/e7/Perspective_Cubes.png)

儘管從不同的角度看來，一個長方體的樣子會不同，但由於你的經驗，即便有光影上的差別，你可以看出它們都是一樣的長方體。

![魚](https://upload.wikimedia.org/wikipedia/commons/6/6d/A_table_with_36_different_fish._Engraving_by_R._Scott_after_Wellcome_V0020485ER.jpg?uselang=zh-tw)

儘管圖上的生物有著不一樣的各種特徵，但你知道牠們都是*魚*；相近的不同生物便被你賦予了「魚」這樣的標籤。

又例如每個人具有不同的身體特徵，其中大約一半的人會長鬍鬚，有陰莖，青春期時會變聲；另一半的人則聲音較細，有陰道，青春期時胸部會變大，這樣人的特質被賦予了*性別*的概念。

舉個物理上的例子吧。牛頓在觀察物體的運動後，提出了萬有引力和運動三大定律，這樣的理論不但能在現實生活被確認，還能預測天體之間的相對移動，也就是對原本日常生活的觀察和對天體的觀測進行了抽象。

再來是數學上的例子：我要提到抽象的*包裝*。大家都知道數字是什麼吧？在操作數字的時候，經常會用到接收一個或數個數字的動作，例如當$x = 1$時，$x + x = 2$，加法便是一個接收兩個**參數**的動作，而$\sqrt{9} = 3$，根號是一個接收一個參數的動作。
動作可以被*組合*，或說是**合成**，舉例來說，四則運算和次方這樣的動作能組合成多項式如$x^3 + 3x^2 + 3x + 1$。這些動作被共同賦予了一個抽象概念：**函數**。一個函數把一個或數個可能不同的東西導向唯一一個輸出，例如加法把左邊的值和右邊的值導向加起來的值；上述的「東西」甚至也不一定要是數字，例如我可以把反轉一個字的所有字母當作一個函數，這麼一來，以參數"stressed"調用這個函數之後，輸出值便是"desserts"，在數學上，函數的調用通常以這樣的方式書寫：$\mbox{反轉}\left("stressed"\right)$，其中「反轉」是函數的名稱。當然，$\mbox{反轉}\left("stressed"\right) = "desserts"$，在未來，我也可能會把函數調用寫成這樣：$\mbox{反轉} \; "stressed" = "desserts"$，直接省略了參數外頭的括號。某些特別重要的函數有著特別的*語法*，所以它們的調用方式和一般函數不同，例如加法是個*中綴運算子*，它的兩個參數分別被寫在加法符號的左右兩邊，或者例如根號接收的參數被寫在根號上頭橫槓的下面。如果一個函數$f$接收了多個參數，參數之間一般以逗號隔開，例如$f(a, b, c)$，如果用省略型的寫法的話則是一樣不用逗號，所以會是$f \; a \; b \; c$。

再舉幾個數學上的抽象作為例子：我要說的是**么半群**和**群**。一個么半群的定義包含了一個集合和集合之上的二元運算，在上句話中，「之上」代表的是它接收的參數和回傳值屬於同樣那個集合，而「二元」表示它接收兩個參數，我在接下來會把那個二元運算以中綴的方式寫成$a \cdot b$。舉例來說，加法便可以是整數集合上的二元運算。除了集合和二元運算之外，么半群還必須滿足兩個命題：

1. 對於所有集合內的元素$a, b, c$，$(a \cdot b) \cdot c = a \cdot (b \cdot c)$。這個命題被稱為**結合律**。

2. 存在**單位元**$e$，使得所有集合內的元素$a$都會符合$e \cdot a = a = a \cdot e$。

注意一下以上的定義是如何能用古典邏輯的方式描述（函數能在集合論中以集合定義）。

什麼樣的集合和二元運算能形成么半群呢？舉例來說，正整數和加法形成了一個么半群，結合律在這個么半群內顯然成立($(a + b) + c = a + (b + c)$)，而單位元是$0$($0 + a = a = a + 0$)。字串的集合和字串相接也形成了一個么半群，其中的二元運算字串相接是把第二個字串接在第一個字串的後面，舉例來說$\mbox{字串相接}\left("car", "pet"\right) = "carpet"$，而單位元是什麼都沒有的空字串("")。更廣義的說，對於所有*有序列表*的集合，它和相接列表的動作形成了一個么半群，其中單位元是空列表，而字串只不過是字元的列表而已。注意當我說「更廣義的說」時，其實便是建立了另一層抽象。

一個群同樣包含一個集合和它之上的二元運算，並滿足以下命題：

1. 一個群是一個么半群。

2. 對於集合內的$a$，存在集合內的**反元素**$b$，使得$a \cdot b = b \cdot a = e$，其中$e$為單位元。

我同樣舉兩個例子。第一個例子是加法在整數上的群，上面已經解釋為什麼加法在正整數上是么半群，加法在整數上也是么半群應該是顯而易見的。至於每個整數$a$的反元素則是$-a$，這麼一來我們有$a + (-a) = (-a) + a = 0$，所以加法在整數上是群。

第二個例子。乘法在正整數上是個群。首先我們要先確認這是個么半群：乘法符合結合律($(a * b) * c = a * (b * c)$)且單位元為$1$($1 * a = a = a * 1$)，對任意$a$，反元素則是$\frac{1}{a}$，請自行確認。（要確認什麼？如果你知道的話代表你懂了。）

最後來提一提寫程式的部分吧，程式語言裡面也提供了很多建構抽象的方法，例如（高階）函數／副程式、自訂資料型態（如類別）、介面、(kind上的)多型、反射、元編程......等。目前（甚至整本書）不會解釋到上面這些概念的全部，所以不用害怕這些名詞，這邊只不過要解釋抽象在程式上的重要性而已。

為什麼要在程式語言中提供抽象？主要是因為想減少程式碼的冗余，精簡程式碼。這麼一來我們能有兩個好處，第一是我們每次寫的程式碼更少了，因此可以節省時間，但更重要的是，如果抽象改變了（這在寫程式時經常發生），我們能直接修改抽象本身，而非逐一修改散亂無章的類似程式碼。順帶一提，這也之所以是寫程式需要被學習的主要原因，要寫出低抽象的程式碼是很簡單的，但那樣的程式碼將難以維護，而高層次的抽象和數學一樣，是需要藉由經驗學習的。

## 遞迴

> 為了要理解遞迴，你必須先理解遞迴。

這是個玩笑。什麼是**遞迴**呢？遞迴是*自我指涉*。舉例來說，「這是一句話」是一句話，「『這是一句話』是一句話」也是一句話，然後我們能再說「『「這是一句話」是一句話』是一句話」是一句話、「『「『這是一句話』是一句話」是一句話』是一句話」......依此類推。人的大腦的新皮質是個不斷重複的結構，好讓人有和其他動物截然不同的抽象性思考，而從自我指涉中挖出更多知識的寶藏。心理學上來說，**心智理論**提出人有高級的意象能力，一級意向是最原始的思考，二級意向則是揣測他人意向，三級意向是揣測他人對他人意向的意向......依此類推，看到遞迴這個概念的有用之處了嗎？英文甚至有個字首meta-描述*關於什麼的什麼*，例如metadata就是*關於數據的數據*，metamathematics則是*關於數學的數學*。

在數學和程式的領域內，遞迴都是很重要的概念，先從最簡單的例子開始好了：非負整數的乘法可以用遞迴以加減法定義。

$\begin{array}{c|c|c|c}
a * b & = & 0 & \mbox{if } a = 0 \\
a * b & = & b + ((a - 1) * b) & \mbox{if } a \neq 0
\end{array}$

來解釋這樣的定義：當$a = 0$時，$a + b$顯然等於$0$，但如果$a \neq 0$時，注意乘法可以被視為連續加法，這時候先把一個$b$取出來，取出一個$b$之後，接著後面就能少加一次$b$，所以是$(a - 1) * b$。這樣的定義之所以是遞迴的原因是因為在定義乘法時，等號右邊又用了乘法。

我們可以用類似的方式定義次方，我在這裡用$\uparrow$表示次方：

$\begin{array}{c|c|c|c}
a \uparrow b & = & 1 & \mbox{if } a = 0 \\
a \uparrow b & = & b * ((a - 1) \uparrow b) & \mbox{if } a \neq 0
\end{array}$

差別僅在於加法的單位元為$0$而乘法的單位元為$1$而已，因此我們在定義次方時必須從$1$開始。（為什麼？）

但，難道我們一定要停在這裡嗎？乘法是連加、加法是連乘，那為什麼不定義一個新運算子，用來表達連續的次方？當然可以！而且我們現在就要這麼做。

$\begin{array}{c|c|c|c}
a \uparrow \uparrow b & = & 1 & \mbox{if } a = 0 \\
a \uparrow \uparrow b & = & b \uparrow ((a - 1) \uparrow \uparrow b) & \mbox{if } a \neq 0
\end{array}$

接下來我們可以定義$\uparrow \uparrow \uparrow$為連續的$\uparrow \uparrow$，$\uparrow \uparrow \uparrow \uparrow$為連續的$\uparrow \uparrow \uparrow$......等等。但這樣再定義下去不是很煩嗎？畢竟接下來運算的定義幾乎都是一模一樣的，為什麼不更*抽象*，定義一個$\uparrow^n$表示$n$個$\uparrow$？而我把這定為給讀者的作業。

程式語言方面，除了一般的函數遞迴之外，還有資料型態上的遞迴，遞迴甚至以其它更古怪的形式到處存在。我們可以這麼說，遞迴是定義抽象很重要的工具。

---

# 古典邏輯

## 命題邏輯

在命題邏輯中，我們只考慮*真假值*，也就是*對錯*之間的關係。舉個例子來說好了，「爸爸是男的或媽媽是男的」是*對*的（或說是真的），「爸爸是男的且媽媽是男的」則是*錯*的（或說是假的）。命題邏輯不對「爸爸」、「媽媽」、「是」、「男」這些概念進行抽象，而是把「爸爸是男的」視為一個不可分割的*原子*，無論「爸爸是男的」、「媽媽是女的」、「明天的昨天是今天」、「太陽從東邊升起」在命題邏輯中都用同一個*值*，也就是**真**被抽象著，而它們的反面（「爸爸不是男的」）則全部被抽象為**假**。在命題邏輯中，我們探討的便是原子命題在用運算子（「或」、「且」......）連接後的真假值。

### 布林代數

\newcommand{\propvar}[1]{\textcolor{blue}{#1}}
\newcommand{\propmetavar}[1]{\textcolor{lightskyblue}{#1}}

首先，我將要介紹最簡單的運算子：否定。一個命題$\propvar{p}$的否定被以符號寫作$\neg \propvar{p}$，當$\propvar{p}$（爸爸是男的）為真時，$\neg \propvar{p}$（爸爸不是男的）為假，當$\propvar{p}$（媽媽是男的）為假時，$\neg \propvar{p}$（媽媽不是男的）為真，用表格可以表示成這樣：

| $\propvar{p}$ | $\neg \propvar{p}$ |
|:-:|:-:|
| T | F |
| F | T |

在表格中，我用T(Truth，「真」的英文)表示真，用F(False，「假」的英文)表示假，這樣的表格被稱為**真值表**，之後我會常常使用它們。

考慮兩個二元運算子「或」和「且」，它們都接收兩個真假值作為參數，但「或」的兩個參數只要有一個為真整體就為真，「且」的參數則是要兩者都為真才為真，「或」的符號是$\lor$，「且」的符號則是$\land$，他們的真值表分別如下：

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \lor \propvar{q}$ |
|:-:|:-:|:-:|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \land \propvar{q}$ |
|:-:|:-:|:-:|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

現在我要介紹第一個**定理**，首先，我要解釋何謂*定理*：定理是恆為真的命題。在命題邏輯中，定理又被稱為**套套句**，以下的這個定理被稱為**排中律**，排中律告訴了我們$p$或$\neg p$一定是對的，真值表如下：

| $\propvar{p}$ | $\neg \propvar{p}$ | $\propvar{p} \lor \neg \propvar{p}$ |
|:-:|:-:|:-:|
| T | F | T |
| F | T | T |

我們要的結果$\propvar{p} \lor \neg \propvar{p}$一定為真，因此排中律是個定理。

接著介紹**蘊含**運算子，寫作$\rightarrow$，它對我們日常生活的「若......則......」進行抽象，舉例來說，「若爸爸是男的則媽媽是女的」是對的，「若爸爸是男的則媽媽是男的」則是錯的。$\rightarrow$的真值表如下：

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \rightarrow \propvar{q}$ |
|:-:|:-:|:-:|
| T | T | T |
| T | F | F |
| F | T | ? |
| F | F | ? |

現在的問題是這樣：當前提為錯誤時，蘊含關係到底為真還是為假？就日常使用「若......則......」的方式來看，這個問題似乎有點難被回答，為了給蘊含一個好的定義，我們先來看看顯然為真且使用到$\rightarrow$的定理，然後再倒推看能不能求得$\rightarrow$的定義吧。這邊我要介紹所謂的**換質換位律**，以符號表示寫作$(\propvar{p} \rightarrow \propvar{q}) \rightarrow (\neg \propvar{q} \rightarrow \neg \propvar{p})$，用文字表示是這樣：如果由前提能推得結論，則結論的反面意味著前提的反面。它的真值表如下：

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \rightarrow \propvar{q}$ | $\neg \propvar{q} \rightarrow \neg \propvar{p}$ | $(\propvar{p} \rightarrow \propvar{q}) \rightarrow (\neg \propvar{q} \rightarrow \neg \propvar{p})$ |
|:-:|:-:|:-:|:-:|:-:|
| T | T | T | ? | T |
| T | F | F | F | T |
| F | T | ? | ? | T |
| F | F | ? | T | T |

因為換質換位律是個定理，所以最右邊一欄，也就是定理本身，一定為真。你可以注意到上面有一列是完整沒有問號的，這麼一來，我們能夠確定若前提和結論都為假時，蘊含關係為真，如此一來，我們能填入上面表格裡的兩個問號：

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \rightarrow \propvar{q}$ | $\neg \propvar{q} \rightarrow \neg \propvar{p}$ | $(\propvar{p} \rightarrow \propvar{q}) \rightarrow (\neg \propvar{q} \rightarrow \neg \propvar{p})$ |
|:-:|:-:|:-:|:-:|:-:|
| T | T | T | T | T |
| T | F | F | F | T |
| F | T | ? | ? | T |
| F | F | T | T | T |

現在只剩下前提為假但結論為真的狀況要釐清了，假設這種情況下蘊含為假的話，那麼$\propvar{p} \rightarrow \propvar{q}$和$\propvar{q} \rightarrow \propvar{p}$會是相等的，但「若$\propvar{p}$則$\propvar{q}$」和「若$\propvar{q}$則$\propvar{p}$」似乎不該是相等的命題，因此我們得到了這樣的真值表：

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \rightarrow \propvar{q}$ |
|:-:|:-:|:-:|
| T | T | T |
| T | F | F |
| F | T | T |
| F | F | T |

如果你還是對這樣蘊含的定義有疑惑的話，先姑且接受它吧，你會越來越相信它應該是對的。

### 公理系統

現在來介紹命題邏輯的**公理系統**，什麼是公理系統呢？用最最簡單的方式來說，它是一套接近機械化的系統，用來以嚴格且純粹不帶感情的方式證明定理，更進一步地說，這樣的系統主要分為三部分：

1. **語法**：描述什麼樣的字串是合法的公式，*合法的公式*在這邊指的不一定是邏輯上對的公式，而是只要符合一些格式上的要求，舉例來說，$\land \rightarrow \lor$就是不合法的公式。

2. **公理**：一些最最基本的定理，用來作為其它所有定理的基礎。

3. **推論規則**：或者簡稱*規則*，用來從一個定理推論到另一個定理。

這邊要介紹的公理系統是數學家武卡謝維奇所發現的命題邏輯公理系統，它能證明所有套套句，且只證明所有套套句。在這樣的系統中只有兩個運算子$\neg$和$\rightarrow$被定義，其它運算子被用這兩個運算子定義，這個系統有3條*公理模式*（接下來會解釋這是什麼）以及1個*推論規則模式*（同樣會在之後解釋）。

#### 語法

1. <span style="color:blue">藍色</span>的字串是合法的公式。他們被稱作**變數**

2. 對於所有合法的公式$\propmetavar{\phi}$，$\neg \propmetavar{\phi}$是合法的公式。

3. 對於所有合法的公式$\propmetavar{\phi}$和$\propmetavar{\psi}$，$(\propmetavar{\phi} \rightarrow \propmetavar{\psi})$是合法的公式。理論上括號是必要的，所以$(\propvar{p} \rightarrow \propvar{q}) \rightarrow (\neg \propvar{q} \rightarrow \neg \propvar{p})$應該要寫成$((\propvar{p} \rightarrow \propvar{q}) \rightarrow (\neg \propvar{q} \rightarrow \neg \propvar{p}))$，但實際上我們經常省略最外層的括號。

4. 除此之外的字串都不是合法的公式。這邊可能要特別澄清一下，像是$\land$或是$\lor$之類的運算子會在檢查語法前就先展開成使用$\neg$和$\rightarrow$的形式，如此能避過語法的檢查階段。

#### 公理

\newcommand{\propaxiom1}{\propmetavar{\phi} \rightarrow (\propmetavar{\psi} \rightarrow \propmetavar{\phi})}
\newcommand{\propaxiom2}{(\propmetavar{\phi} \rightarrow (\propmetavar{\psi} \rightarrow \propmetavar{\chi})) \rightarrow ((\propmetavar{\phi} \rightarrow \propmetavar{\psi}) \rightarrow (\propmetavar{\phi} \rightarrow \propmetavar{\chi}))}
\newcommand{\propaxiom3}{(\neg \propmetavar{\phi} \rightarrow \neg \propmetavar{\psi}) \rightarrow (\propmetavar{\psi} \rightarrow \propmetavar{\phi})}

1. $\propaxiom1$
2. $\propaxiom2$
3. $\propaxiom3$

差不多該是時候解釋這堆淺藍色的希臘符號是什麼了，它們是**元變數**，它們並不只是系統內的變數而已，而是可以被代換成任意合法的公式。以公理1為例好了，我們可以把$\propvar{p}$代入$\propmetavar{\phi}$並且把$\neg \propvar{p}$代入$\propmetavar{\psi}$，如此一來，公理1就變成了$\propvar{p} \rightarrow (\neg \propvar{p} \rightarrow \propvar{p})$，這是一個公理。再舉一個例子，假設$\propmetavar{\phi}$是$\propvar{p}$而$\propmetavar{\psi}$是$\propvar{q} \rightarrow \propvar{r}$，那麼公理3就是$(\neg \propvar{p} \rightarrow \neg (\propvar{q} \rightarrow \propvar{r})) \rightarrow ((\propvar{q} \rightarrow \propvar{r}) \rightarrow \propvar{p})$。當然，出現在一個公理裡同樣的元變數要被代換成同樣的公式。從上面的例子，你能知道這3個公理事實上並不只是3個*公理*，而比較像是三個*公理的模板*，因此，他們被稱為*公理模式*，事實上的公理是有無限多個的。儘管如此，我還是常常會簡稱它們為公理。

#### 規則

$\frac{\propmetavar{\phi} \rightarrow \propmetavar{\psi} \qquad \propmetavar{\phi}}{\propmetavar{\psi}}$

這是命題邏輯唯一的推理規則模式，和上頭的公理類似，它事實上代表著無限條規則。只要橫線上頭所有公式都是定理，那麼橫線下面的公式便是定理。它叫作**肯定前件**，說明了如果前提是對的，能依此推導出結果。直接看例子大概比較好解釋，因此，我們要來證明我們的第一條定理了。

#### 一個證明

現在，我要來證明$\propvar{p} \rightarrow \propvar{p}$。來大概猜一下要怎麼證明吧：因為$\propvar{p} \rightarrow \propvar{p}$裡面沒用到$\neg$，所以可以合理推測或許我們能用公理1和2證明它。現在看看公理1$\propaxiom1$，它和公理2的左邊
$\propmetavar{\phi} \rightarrow (\propmetavar{\psi} \rightarrow \propmetavar{\chi})$是不是有點像？當我們把$\propmetavar{\chi}$代換成$\propmetavar{\phi}$時，它就會變得和公理1一樣。因此，根據推論規則，我們能夠推論出公理2的右邊，也就是$(\propmetavar{\phi} \rightarrow \propmetavar{\psi}) \rightarrow (\propmetavar{\phi} \rightarrow \propmetavar{\phi})$是個定理，注意這時$\propmetavar{\chi}$已經變成$\propmetavar{\phi}$了。接下來假如想證明$\propmetavar{\phi} \rightarrow \propmetavar{\phi}$，只要證明它的前提$\propmetavar{\phi} \rightarrow \propmetavar{\psi}$是對的就好，而只要把$\propmetavar{\psi}$代換成$\propmetavar{\psi} \rightarrow \propmetavar{\phi}$，它就變成公理1的形式了，這麼一來，我們便能證明$\propmetavar{\phi} \rightarrow \propmetavar{\phi}$。

以下將會更嚴謹地進行一次完整的證明。

首先，要確認$\propvar{p} \rightarrow \propvar{p}$是合法的公式。我們知道嚴謹來說，這個公式應該被寫成$(\propvar{p} \rightarrow \propvar{p})$，根據語法3，可以知道這是合法的式子。現在把公理模式2的$\propmetavar{\phi}$和$\propmetavar{\chi}$代入$\propvar{p}$，$\propmetavar{\psi}$代入$\propvar{q} \rightarrow \propvar{p}$，我們能得到以下的公理：

$(\propvar{p} \rightarrow ((\propvar{q} \rightarrow \propvar{p}) \rightarrow \propvar{p})) \rightarrow ((\propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})) \rightarrow (\propvar{p} \rightarrow \propvar{p}))$

還記得要做什麼吧？我們要證明箭頭左邊的式子，使用推論規則推導出箭頭右邊的式子，首先我們想證明的是$\propvar{p} \rightarrow ((\propvar{q} \rightarrow \propvar{p}) \rightarrow \propvar{p})$，這事實上是公理模式1的一個形式，只要把$\propaxiom1$的$\propmetavar{\phi}$代換成$\propvar{p}$，$\propmetavar{\psi}$代換成$\propvar{q} \rightarrow \propvar{p}$就能得到它：

$\propvar{p} \rightarrow ((\propvar{q} \rightarrow \propvar{p}) \rightarrow \propvar{p})$

現在，我們能使用推論規則得到一個新的定理：

$\frac{(\propvar{p} \rightarrow ((\propvar{q} \rightarrow \propvar{p}) \rightarrow \propvar{p})) \rightarrow ((\propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})) \rightarrow (\propvar{p} \rightarrow \propvar{p})) \qquad \propvar{p} \rightarrow ((\propvar{q} \rightarrow \propvar{p}) \rightarrow \propvar{p})}{(\propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})) \rightarrow (\propvar{p} \rightarrow \propvar{p})}$

接下來就簡單了，我們只要證明$\propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})$就好，而這顯然是公理模式1的一個實例，接著，我們能再使用那唯一的一條推理規則：

$\frac{(\propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})) \rightarrow (\propvar{p} \rightarrow \propvar{p}) \qquad \propvar{p} \rightarrow (\propvar{q} \rightarrow \propvar{p})}{\propvar{p} \rightarrow \propvar{p}}$

得到我們想要證明的定理$\propvar{p} \rightarrow \propvar{p}$。

如果對這樣的證明方式有興趣的話，可以瀏覽[Metamath]網站，裡面所有的證明都是用這樣非～常嚴謹的方式完成的，它使用的[命題邏輯公理](http://us.metamath.org/mpegif/mmset.html#scaxioms)和我在這邊描述的是一模一樣的，而$\propvar{p} \rightarrow \propvar{p}$這個定理的證明在[這裡](http://us.metamath.org/mpegif/id1.html)，[這邊](http://us.metamath.org/mpegif/mmtheorems1.html#mm3b)則列出了它所證明的全部命題邏輯定理。雖然它的做法和我在這邊做的還是有點不同，和上面的做法相比，Metamath的做法更為**後設**，後設是英文meta的翻譯，在這邊指的是後設邏輯(metalogic)，也就是說，它使用了更多邏輯系統之上的邏輯技巧，舉例來說，它的所有定理事實上都是*定理模式*，而且也能在後設邏輯上假定命題作為前提。或許讀者還是能藉由閱讀這些證明獲得對公理系統更加清晰的認識。

[Metamath]: http://us.metamath.org

#### 其它運算子

\newcommand{\definedas}{:\equiv}

啊，這樣的系統裡面只有兩個運算子，我們還必須定義其它的運算子，這樣的定義是發生在*系統之外*的，可以被視為早於開始運用公理系統時就被替換掉了。我將會使用$\definedas$這個符號表示系統之外的定義。

$\begin{array}{c|c|c}
(\propmetavar{\phi} \lor \propmetavar{\psi}) & \definedas & (\neg \propmetavar{\phi} \rightarrow \propmetavar{\psi}) \\
(\propmetavar{\phi} \land \propmetavar{\psi}) & \definedas & \neg (\propmetavar{\phi} \rightarrow \neg \propmetavar{\psi})
\end{array}$

\newcommand{\iff}{\leftrightarrow}

使用真值表確認以上定義的正確性是讀者的作業。除此之外，這邊要介紹一個新的運算子：**若且唯若**，$\propvar{p} \iff \propvar{q}$的定義是「若$\propvar{p}$則$\propvar{q}$且若$\propvar{q}$則$\propvar{p}$」。也可以這麼說，這個運算子左右兩邊的值是相等的。

$(\propmetavar{\phi} \iff \propmetavar{\psi}) \definedas ((\propmetavar{\phi} \rightarrow \propmetavar{\psi}) \land (\propmetavar{\psi} \rightarrow \propmetavar{\phi}))$

| $\propvar{p}$ | $\propvar{q}$ | $\propvar{p} \iff \propvar{q}$ |
|:-:|:-:|:-:|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | T |

#### 總結

要確認一個命題邏輯的證明是對的，你需要經過幾個階段：

1. 補上所有省略的括號。
2. 展開以$\definedas$定義的運算子。目前都還沒進入真正的公理系統的範圍。
3. 確認語法是否正確。
4. 確認所有證明中的公理和推論規則都是正確地以它們的模式造出來的。
5. 確認定理證明的每一步是否都是以公理或是前面證明的定理，用推論規則得到結論。

命題邏輯的部分，就在此告一段落。

## 一階邏輯

\newcommand{\setvar}[1]{\textcolor{red}{#1}}

一階邏輯會導入*物件*的概念，以之後要介紹的集合論為例，集合便是一種物件。但除了集合之外，還可以存在其它種類的物件，以後會再深入討論這部分。一階邏輯是建構在命題邏輯之上的，要怎麼把物件和命題邏輯關聯起來呢？我們同時要導入**謂詞**的概念，謂詞將一或多個物件轉化為命題；舉例來說，等號$=$便是一個謂詞，他接收左右兩個參數，輸出一個命題，舉例來說$\setvar{a} = \setvar{b}$就是一個命題。除了$=$之外，未來在講集合論的時候還會介紹第二個基本的謂詞：$\in$，$\setvar{a} \in \setvar{b}$表示的是$\setvar{a}$是$\setvar{b}$集合中的一個元素。命題之間能用前面命題邏輯介紹的運算子互相連接得到更複雜的謂詞，例如像是$\setvar{a} = \setvar{b} \rightarrow \setvar{b} = \setvar{a}$。

除此之外，我們還將導入**量詞對於所有($\forall$)**以及**存在($\exists$)**
