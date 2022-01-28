# 國立中央大學 LaTeX 論文樣板(中文)
這是基於我論文製作的樣板，所以是可以過校方審核的，請安心服用 :D

封面及 config.tex 變數參考了 [羅吉昌教授](https://code.google.com/archive/p/ncu-thesis-latex-template/) 的樣板。

## 使用方法
見本專案的 [Wiki](https://github.com/sppmg/TW_Thesis_Template/wiki) 。

或是你想從[無腦手冊](https://github.com/sppmg/TW_Thesis_Template/wiki/%E7%84%A1%E8%85%A6%E6%89%8B%E5%86%8A)開始。

## 論文相關說明

### 插入文件

中英文版`審定書`、`授權書`等文件均已附上，亦於 2018-01-09 確認過與教務處相同。
中央版附上自動填單（章節），設定完 `config.tex` 中個資部份即可自動將必要資訊填入文件。

### 書脊
中央沒有規定要附上書脊，所以我這裡也不放。我相信學校附近的影印店比我專業的多 :D ，而且我不知道你做了書脊他們會如何使用。

如果仍然希望自製書脊者，請參考台大版(NTU_patch)的製作方式。

## 其餘資訊
### 其他網友樣板
見[同好連結](https://github.com/sppmg/TW_Thesis_Template/wiki/%E5%90%8C%E5%A5%BD%E9%80%A3%E7%B5%90)

## RA 友情提示
### 基本操作
封面相關資訊，以下資訊請到 `config.tex` 中修改：
- \def\deptshort  系所簡稱
- \def\dept       系所全名
- \def\degree     系級(碩士/博士)
- \def\titleZh    中文標題
- \def\titleEn    英文標題
- \def\title      主標題 (你可以選擇填\titleZh或\titleEn)
- \def\subtitle   副標題 (你可以選擇填\titleZh或\titleEn)
- \def\author     論文作者(你的名字)
- \def\profs      教授名稱
- \def\degreedate 畢業年月

目錄、增刪章節"檔案"，請到 `main.tex` 中修改：
- \frontmatter 下面應該會放摘要、目錄
- \mainmatter 下面會放所以章節
- \backmatter 下面會放參考文獻
- \appendix 下面會放附錄
如果要插入新的檔案（無論是章節還是附錄，都是一樣的方法），直接在對應的地方加入 `\input{檔案名稱}`，舉例來說，如果你要在追加一個章節(chapter_new.tex)、一個附錄(appendix_new.tex)，那麼你應該這樣寫：
```latex
\mainmatter
	\input{chapter_1.tex}
	\input{chapter_2.tex}
	\input{chapter_3.tex}
	\input{chapter_new.tex}
\appendix
	\input{appendix_A.tex}
	\input{appendix_B.tex}
	\input{appendix_new.tex}
```
如果要知道哪個章節是哪個檔案，請直接看 main.tex，裡面有註解。

要新增章節，你可以直接複製 chapter_template.tex，而章節層次依序是
1. \chapter         => (4)
2. \section         => 4.(1)
3. \subsection      => 4.1.(2)
4. \subsubsection   => 4.1.2.(3)
5. \paragraph       => 4.1.2.3.(4)
6. \subparagraph    => 4.1.2.3.(4).5

對於文字，你可以用一些方法來改變它的樣式：
- 粗體 \textbf{文字}
- 斜體 \textit{文字}
- 底線 \underlined{文字}
- 強調 \emph{文字}
- 等寬   \texttt{文字}
- 無襯線 \textsf{文字}
- 有襯線 \textrm{文字}

如果你要強制換行，你可以試著用：
- \newline
- \\
- \break

如果你要強制換頁，你可以試著用：
- \newpage
- \clearpage 

如果要加上撰寫的 TODO，你可以這樣用：
- \todoUnsure{unsure}
- \todoChange{change this}
- \todoInfo{info}

### 程式碼
如果你要插入程式碼，你可以這樣做：
- \lstinline|printf("hello");|
- 多行請用 \begin 及 \end:
```
\begin{lstlisting}[frame=single]
	for i:=maxint to 0 do
	begin
		{ do nothing }
	end;
	Write('Case insensitive ');
	Write('Pascal keywords.');
\end{lstlisting}
```
- \lstinputlisting{檔案名稱}
請注意，檔案必須放在 codes 這個資料夾裡面！如果你想增加 label 或是其他設定，你可以追加 Option：
- \lstinputlisting[language=語言, caption="Code說明", label=標籤]{檔案名稱}

### 圖片
如果你想放入圖片，你可以這樣做：
```
\includegraphics[width=12cm]{檔案名稱}
```
請注意，檔案必須放在 figures 這個資料夾裡面！如果你想增加 label 或是 caption 的話，你可以這樣做：
```
\begin{figure}[h]
    \centering 
    \includegraphics[width=12cm]{檔案名稱}
    \caption{圖片說明}
    \label{fig:標籤名稱}
\end{figure}
```

### 表格
如果你想放入表格，你可以這樣做：
```
\begin{table}[h]
    \begin{tabular}{|c|c|} 
        \hline
        \multicolumn{2}{|c|}{Host}  \\ \hline
        OS & Ubuntu 18.04.1 LTS     \\ \hline
        Kernel & 4.15.0             \\ \hline
        Virtual Machine Software & QEMU   \\ \hline
        \multicolumn{2}{|c|}{Guest}       \\ \hline
        OS & Ubuntu                 \\ \hline
        Kernal & (Modified)         \\ \hline
    \end{tabular}
    \label{tab:environ}
\end{table}
```
第一行的 `|c|c|` 表示有幾欄，因此每一行基本上就是 `A & B \\` 的形式，中間的 & 就是分隔符號，每一行的最後要有 `\\` 來換行。如果你要加入分隔線（這個表格不會自己加水平分隔線），你可以加入 `\hline`，它後面可以不用加 `\\`，如果你要把兩個欄位合成一個欄位，你可以用 `\multicolumn{2}{|c|}{文字}`。

也可以改用 `tabularx`，當一行過長時會自動換行。另外，原版的分隔線其實不太美觀，可以嘗試 *booktab* 模組，使用時要在 macro 中加入 `\usepackage{booktabs}`：
```
\begin{table}[h]
    \begin{tabularx}{0.7\textwidth}{cXX} 
        \toprule
            & Host & Guest \\
        \midrule
        OS & Ubuntu 18.04.1 LTS (with lots of modifications such as this and that) & Ubuntu 18.04.1 LTS (this is also a long line) \\
        Kernel & 4.15.0 & 3.9.0 \\
        \bottomrule
    \end{tabularx}
\end{table}
```

### 引用
有些時候你可能想要寫「如圖2.1所示」，這部分需要透過 label 跟 ref 這兩個方法來使用，你可以這樣做：
```
如圖\ref{fig:標籤名稱}所示。
\begin{figure}[h]
\centering 
\includegraphics[width=12cm]{檔案名稱}
\caption{圖片說明}
\label{fig:標籤名稱}
\end{figure}
```
請特別注意，如果你要用 caption，那它務必要放在 label 前面，不然一定會出錯。

緊接著，如果你要加入參考文獻，你可以在 "references.bib" 中修改，詳細的格式你可以參考 [BibTeX Style Examples][1]，不過通常大型的論文網站都可以讓你下載 bib 格式的 cite 文件或字串，因此你可以直接用它寫好的，不用自己寫。引用網路文章時，使用 BibLaTex 的 `@online` 項目會好看很多。
當你今天加了一個文獻長這樣：
```
@article{AAA,
  author  = {HAHA}, 
  title   = {ABC},
  journal = {Journal},
  year    = 2018,
}
```
想要在章節中引用它，你可以用 \autocite{AAA} 來做引用，這樣產出的 pdf 中應該會出現一個像是 [1] 的東西，如果你想顯示作者名稱，你可以用 \citeauthor{AAA}，這樣應該會在 pdf 中顯示 "HAHA et al."。
如果你想把參考文獻分成多個檔案，你可以在 macros_preamble.tex 這個檔案中的找到 \addbibresource{檔案名稱} 的字串，你只要複製一行，把檔名改成你要的檔案就可以了。
如果引用的是技術網站，格式可以參考[維基百科的引用工具][2]。
請注意，我們的模板會把標題全部轉成小寫的，這是學校的要求。所以如果有關鍵字必須保留大小寫 (如 "PHP")，[請使用引號加上大括號][3]。

### 編譯
最後有關編譯，論文需要使用 XeLaTex 進行編譯，你如果用錯編譯器，編譯會直接失敗。
同時， latex 有很多東西需要二次編譯才會正常顯示，所以如果沒有正常顯示 pdf ，但是又沒有錯誤訊息，請再按一次編譯。(根據之前的經驗，只要是有動到目錄、ref 這兩樣東西，通常需要兩次編譯。)
如果你有異動到參考文獻的 bib 檔案，你必須先進行一次 XeLaTex 編譯，再用 biber 編譯一次，最後再用 XeLaTex 編譯一次，文獻跟引用才都會正常顯示。
你也可以考慮直接使用 latex 線上編輯器 (如 Overleaf)，省得兩次編譯的麻煩。

最後的最後，為了避免你論文有個三長兩短，建議用 Git 作版本控制！



[1]: https://www.verbosus.com/bibtex-style-examples.html
[2]: https://en.wikipedia.org/wiki/Special:CiteThisPage
[3]: https://tex.stackexchange.com/questions/10772/bibtex-loses-capitals-when-creating-bbl-file
