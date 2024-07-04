\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{myreportstyle}[2024/07/05 myreportstyle class.]

% Created by Tamaki ISII on 2024/07/05

\LoadClass{article}

\setlength{\parindent}{1zw}

\makeatletter
\renewcommand{\@afterindentfalse}{}
\makeatother

\newcount\maxpage
\maxpage=0

\makeatletter
\InputIfFileExists{\jobname_myreportstyle.aux}{}{}
\makeatother
\newwrite\myoutfile
\immediate\openout\myoutfile={\jobname_myreportstyle.aux}

\newcount\curpage
\curpage=1

\makeatletter
\def\ps@my{
\def\@evenfoot{\hskip 0pt plus 1fill Page \the\curpage/\the\maxpage\hskip 0pt plus 1fill\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
\def\@oddfoot{\hskip 0pt plus 1fill Page \the\curpage/\the\maxpage\hskip 0pt plus 1fill\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
}
\makeatother

\pagestyle{my}

\newcommand{\makereporttitle}{\maketitle\thispagestyle{my}}%タイトル生成用コマンド
