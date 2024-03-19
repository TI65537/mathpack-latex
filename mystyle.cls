\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{mystyle}[2024/03/19 mystyle class.]

% Created by Tamaki ISII on 2024/03/19

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newcommand{\doctitle}{}%    文書のタイトルを設定 未設定の場合はUntitled
%\newcommand{\docsubject}{}%    文書のサブタイトルを設定  無しの場合は空
%\newcommand{\docauthor}{}%    文書の著者を設定  無しの場合は空
%\newcommand{\dockeyword}{}%    キーワードを設定  無しの場合は空

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%初期タイトル設定
\ifdefined\doctitle\else\newcommand{\doctitle}{Untitled}\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcount\maxpage
\maxpage=0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%補助ファイルを開く
\makeatletter
\InputIfFileExists{\jobname_mystyle.aux}{}{}
\makeatother
\newwrite\myoutfile
\immediate\openout\myoutfile={\jobname_mystyle.aux}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[titlepage,a4paper,twoside,fleqn]{article}
\RequirePackage{datetime,anyfontsize}

\usepackage[%
    pdfdirection=L2R,%
    pdfduplex=DuplexFlipLongEdge,%
    pdfpicktraybypdfsize=true,%
%
    dvipdfmx,%
%
    pdfdisplaydoctitle,%
    pdfmenubar=false,%
    pdftoolbar=false,%
%
    bookmarksnumbered,%
    bookmarksdepth=10,%
    hidelinks%
]{hyperref}
\usepackage{pxjahyper}
\begingroup
\def\thanks#1{}
\hypersetup{%
    pdftitle=\doctitle,%
    pdfsubject=\ifdefined\docsubject\docsubject\else\fi,%
    pdfauthor=\ifdefined\docauthor\docauthor\else\fi,%
    pdfkeywords=\ifdefined\dockeyword\dockeyword\else\fi,%
    pdfcreationdate=\pdfcreationdate,%
    pdfmoddate=\pdfcreationdate,%
    pdfcreator=%
}
\endgroup

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%ページ設定

%段落を上に寄せる
\raggedbottom

%横
\newdimen\afourwidth
\afourwidth=210mm  %A4用紙の横幅
\hoffset=0cm
\advance\hoffset by 1.5cm  %外側の端の余白
\advance\hoffset by -1in
\marginparwidth=5zw  %傍注のテキスト幅
\marginparsep=0.5cm  %傍注とテキストの間の幅
\textwidth=44zw  %テキストの横幅
\evensidemargin=0cm
\oddsidemargin=\afourwidth
\advance\oddsidemargin by -2in
\advance\oddsidemargin by -2\hoffset
\advance\oddsidemargin by -\evensidemargin
\advance\oddsidemargin by -\textwidth

%縦
\newdimen\afourheight
\afourheight=297mm  %A4用紙の縦幅
\voffset=0cm
\advance\voffset by 1.5cm  %上側の余白
\advance\voffset by -1in
\topmargin=0cm
\headheight=0.5cm  %ヘッダーの高さ
\headsep=0.5cm  %ヘッダーと本文の間の高さ
\footskip=0cm
\advance\footskip by \headheight
\advance\footskip by \headsep
\textheight=\afourheight
\advance\textheight by -2in
\advance\textheight by -2\voffset
\advance\textheight by -\topmargin
\advance\textheight by -\headheight
\advance\textheight by -\headsep
\advance\textheight by -\footskip
%24.7cm

%傍注間の距離
\marginparpush=0.5cm

%傍注の位置を逆転
\reversemarginpar

%段落冒頭のインデント
\setlength{\parindent}{1zw}

%章の最初の段落もインデント
\makeatletter
\renewcommand{\@afterindentfalse}{}
\makeatother

%文章を左に揃える
\rightskip 0pt plus 1fil

%ヘッダーフッター設定

\newdateformat{@mydate}{\THEDAY.\ \shortmonthname[\THEMONTH].\ \THEYEAR}
\newtimeformat{@mytime}{\ \twodigit{\THEHOUR}:\twodigit{\THEMINUTE}:\twodigit{\THESECOND}}%日付時間のコマンド

\newcount\curpage
\curpage=1

\makeatletter
\def\@evenhead{\qquad\doctitle\hskip 0pt plus 1fill\@mydate\today\@mytime\qquad}
\def\@oddhead{\qquad\doctitle\hskip 0pt plus 1fill\@mydate\today\@mytime\qquad}
\def\@evenfoot{\qquad Page \the\curpage/\the\maxpage\hskip 0pt plus 1fill\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
\def\@oddfoot{\hskip 0pt plus 1fill Page \the\curpage/\the\maxpage\qquad\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%タイトル用コマンド

\makeatletter
\newcommand{\mymaketitle}{%
    \def\@titledisped{}%
    \title{%
        {\fontsize{42pt}{42pt}\selectfont\doctitle}%
        \ifdefined\docsubject\\\vspace{21pt}{\fontsize{31pt}{31pt}\selectfont\docsubject}\fi%
    }%
    \ifdefined\docauthor\author{%
        {\fontsize{21pt}{21pt}\selectfont\docauthor}%
    }\fi%
    \date{%
        {\fontsize{21pt}{21pt}\selectfont\@mydate\today\@mytime}%
    }%
    \maketitle%
}
%    \begin{document} の後に \mytitle と書いてタイトル挿入
\makeatother

%序文用環境
\newenvironment{myabs}{%
    \newpage%
    \vglue 0pt plus 1fill%
    \begin{section}{Abstract}%
    \begin{indentsec}%
}%
{%
    \end{indentsec}%
    \end{section}%
    \vskip 0pt plus 3fill%
    \newpage%
}

%参考文献用コマンド
\newcommand{\mybib}[1]{%
    \renewcommand{\refname}{}%
    \begin{section}{References}%
    \vspace{-2\baselineskip}%
    \bibliographystyle{plain}%
    \bibliography{#1}%
    \end{section}%
}
%    \mybib{ファイル名} と書いたところに参考文献挿入

%傍注用コマンド
\makeatletter
\def\mymarginpar{
    \@ifnextchar\bgroup{%
        \@mymarginparnoopt%
    }%
    {%
        \@mymarginparopt%
    }%
}
\def\@mymarginparnoopt#1{%
    \marginpar{\raggedright #1}%
}
\def\@mymarginparopt[#1]#2{%
    \marginpar[\raggedright #1]{\raggedright #2}%
}

\makeatother

%空白ページ挿入用コマンド
\newcommand{\blankpage}{\newpage\vglue 0pt plus 1fill\hskip 0pt plus 1fill{\fontsize{21pt}{21pt}\selectfont INTENTIONALLY LEFT BLANK}\hskip 0pt plus 1fill\vskip 0pt plus 2fill\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
