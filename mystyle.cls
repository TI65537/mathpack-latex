\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{mystyle}[2024/03/19 mystyle class.]

% Created by Tamaki ISII on 2024/03/19

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newcommand{\doctitle}{}%    �����̃^�C�g����ݒ� ���ݒ�̏ꍇ��Untitled
%\newcommand{\docsubject}{}%    �����̃T�u�^�C�g����ݒ�  �����̏ꍇ�͋�
%\newcommand{\docauthor}{}%    �����̒��҂�ݒ�  �����̏ꍇ�͋�
%\newcommand{\dockeyword}{}%    �L�[���[�h��ݒ�  �����̏ꍇ�͋�

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�����^�C�g���ݒ�
\ifdefined\doctitle\else\newcommand{\doctitle}{Untitled}\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcount\maxpage
\maxpage=0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�⏕�t�@�C�����J��
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

%�y�[�W�ݒ�

%�i������Ɋ񂹂�
\raggedbottom

%��
\newdimen\afourwidth
\afourwidth=210mm  %A4�p���̉���
\hoffset=0cm
\advance\hoffset by 1.5cm  %�O���̒[�̗]��
\advance\hoffset by -1in
\marginparwidth=5zw  %�T���̃e�L�X�g��
\marginparsep=0.5cm  %�T���ƃe�L�X�g�̊Ԃ̕�
\textwidth=44zw  %�e�L�X�g�̉���
\evensidemargin=0cm
\oddsidemargin=\afourwidth
\advance\oddsidemargin by -2in
\advance\oddsidemargin by -2\hoffset
\advance\oddsidemargin by -\evensidemargin
\advance\oddsidemargin by -\textwidth

%�c
\newdimen\afourheight
\afourheight=297mm  %A4�p���̏c��
\voffset=0cm
\advance\voffset by 1.5cm  %�㑤�̗]��
\advance\voffset by -1in
\topmargin=0cm
\headheight=0.5cm  %�w�b�_�[�̍���
\headsep=0.5cm  %�w�b�_�[�Ɩ{���̊Ԃ̍���
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

%�T���Ԃ̋���
\marginparpush=0.5cm

%�T���̈ʒu���t�]
\reversemarginpar

%�i���`���̃C���f���g
\setlength{\parindent}{1zw}

%�͂̍ŏ��̒i�����C���f���g
\makeatletter
\renewcommand{\@afterindentfalse}{}
\makeatother

%���͂����ɑ�����
\rightskip 0pt plus 1fil

%�w�b�_�[�t�b�^�[�ݒ�

\newdateformat{@mydate}{\THEDAY.\ \shortmonthname[\THEMONTH].\ \THEYEAR}
\newtimeformat{@mytime}{\ \twodigit{\THEHOUR}:\twodigit{\THEMINUTE}:\twodigit{\THESECOND}}%���t���Ԃ̃R�}���h

\newcount\curpage
\curpage=1

\makeatletter
\def\@evenhead{\qquad\doctitle\hskip 0pt plus 1fill\@mydate\today\@mytime\qquad}
\def\@oddhead{\qquad\doctitle\hskip 0pt plus 1fill\@mydate\today\@mytime\qquad}
\def\@evenfoot{\qquad Page \the\curpage/\the\maxpage\hskip 0pt plus 1fill\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
\def\@oddfoot{\hskip 0pt plus 1fill Page \the\curpage/\the\maxpage\qquad\immediate\write\myoutfile{\noexpand\maxpage\noexpand=\the\curpage\noexpand\relax}\global\advance\curpage by 1}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%�^�C�g���p�R�}���h

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
%    \begin{document} �̌�� \mytitle �Ə����ă^�C�g���}��
\makeatother

%�����p��
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

%�Q�l�����p�R�}���h
\newcommand{\mybib}[1]{%
    \renewcommand{\refname}{}%
    \begin{section}{References}%
    \vspace{-2\baselineskip}%
    \bibliographystyle{plain}%
    \bibliography{#1}%
    \end{section}%
}
%    \mybib{�t�@�C����} �Ə������Ƃ���ɎQ�l�����}��

%�T���p�R�}���h
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

%�󔒃y�[�W�}���p�R�}���h
\newcommand{\blankpage}{\newpage\vglue 0pt plus 1fill\hskip 0pt plus 1fill{\fontsize{21pt}{21pt}\selectfont INTENTIONALLY LEFT BLANK}\hskip 0pt plus 1fill\vskip 0pt plus 2fill\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%