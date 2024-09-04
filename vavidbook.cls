%%%%%%%%%%%%%%%%%%%%%%
%% start of file `vavidbook.cls'.
%% 
%% Copyright 2023-2024 vavidbook (sx12101184@qq.com)
%% This work may be distributed and/or modified freely
%% available at 
%%%%%%%%%%%%%%%%%%%%%
% % !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vavidbook}[2023/09/03 VividBook doc]
\author{LyshmilyY}


%%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=VIVID, prefix=VIVID@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{VIVID}{#1}}

% ----- Configuration -----
% ----- 1. Device  设备参数----
\DeclareStringOption[normal]{device}

\DeclareVoidOption{normal}{\ekv{device=normal}}
\DeclareVoidOption{pad}{\ekv{device=pad}}

% ----- 2. Language  语言参数----
\DeclareStringOption[en]{lang}

\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}

% ----- 3. Colors  颜色参数-----
\DeclareStringOption[blue]{color}

\DeclareVoidOption{green}{\ekv{color=green}}
\DeclareVoidOption{cyan}{\ekv{color=cyan}}
\DeclareVoidOption{blue}{\ekv{color=blue}}
\DeclareVoidOption{gray}{\ekv{color=gray}}
\DeclareVoidOption{black}{\ekv{color=black}}
\DeclareVoidOption{nocolor}{\ekv{color=none}}

% ----- 4. Mode  模式参数----
\DeclareStringOption[fancy]{mode}

\DeclareVoidOption{fancy}{\ekv{mode=fancy}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

% ----- 5. ChineseFont  中文字体参数----
\DeclareStringOption[ctexfont]{chinesefont}

\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

% ----- 6. MathFont  数学字体参数----
\DeclareStringOption[cm]{maths}

\DeclareVoidOption{newtx}{\ekv{maths=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{maths=mtpro2}}
\DeclareVoidOption{cm}{\ekv{maths=cm}}

% ----- 7. Result  习题参数----
\DeclareStringOption[answer]{result}

\DeclareVoidOption{answer}{\ekv{result=answer}}
\DeclareVoidOption{noanswer}{\ekv{result=noanswer}}

% ----- 8. TCO 定理计数参数----
\DeclareStringOption[chapter]{thmcnt}

\DeclareVoidOption{chapter}{\ekv{thmcnt=chapter}}
\DeclareVoidOption{section}{\ekv{thmcnt=section}}

% ----- 9. Margin 侧栏标注参数----
\DeclareStringOption[marginfalse]{marginpar}

\DeclareVoidOption{margintrue}{\ekv{marginpar=margintrue}}
\DeclareVoidOption{marginfalse}{\ekv{marginpar=marginfalse}}

% ----- 10. TOC 目录分栏参数----
\DeclareStringOption[onecol]{toc}

\DeclareVoidOption{onecol}{\ekv{toc=onecol}}
\DeclareVoidOption{twocol}{\ekv{toc=twocol}}

% ----- 11. Title Style  标题样式参数----
\DeclareStringOption[hang]{titlestyle}

\DeclareVoidOption{hang}{\ekv{titlestyle=hang}}
\DeclareVoidOption{display}{\ekv{titlestyle=display}}

% ----- 12. CiteStyle  引用样式参数----
\DeclareStringOption[numeric-comp]{citestyle}

\DeclareVoidOption{numeric-comp}{\ekv{citestyle=numeric-comp}}

% ----- 13. BibStyle  Bib样式参数----
\DeclareStringOption[numeric]{bibstyle}

\DeclareVoidOption{numeric}{\ekv{bibstyle=numeric}}

% ----- 14. Scheme  方案参数----
\DeclareStringOption{scheme}

\DeclareVoidOption{chinese}{\ekv{scheme=chinese}}

% ----- 15. Bibend 引用参数----
\DeclareStringOption[biber]{bibend}

\DeclareVoidOption{biber}{\ekv{bibend=biber}}
\DeclareVoidOption{bibtex}{\ekv{bibend=bibtex}}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax

\LoadClass[a4paper,oneside]{book}

\RequirePackage{setspace}

\RequirePackage{csquotes}


\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  pdfkeywords={VIVIDBook},
  colorlinks,
  linkcolor=pink,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}
\newif\ifVIVID@Hy@later
  \@ifpackagelater{hyperref}{2022/05/16}
    {\VIVID@Hy@latertrue}
    {\VIVID@Hy@laterfalse}

%% device settings
\RequirePackage{geometry}
\ifdefstring{\VIVID@device}{normal}{
  \geometry{
    a4paper,
    top=25.4mm, bottom=25.4mm,
    left=20mm, right=20mm,
    headheight=2.17cm,
    headsep=4mm,
    footskip=12mm
  }
  \ifdefstring{\VIVID@marginpar}{margintrue}{
    \geometry{
      marginparwidth=5cm, marginparsep=5mm,
      left=2cm,right=7cm}}{\relax}}{
    \relax}

\ifdefstring{\VIVID@device}{pad}{
\geometry{
  paperwidth=7.5in, 
  paperheight=10in,
  margin=16mm,
  headheight=2.17cm,
  footskip=4mm
}}{\relax}


\RequirePackage{indentfirst,comment}
% fontsetting
\ifdefstring{\VIVID@maths}{mtpro2}{
  \let\Bbbk\relax
  \RequirePackage[lite]{mtpro2}
}{\relax}

\setcounter{tocdepth}{1}
\renewcommand{\baselinestretch}{1.2}

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{iftex}

\ifpdftex
  \RequirePackage{newtxtext}
  \RequirePackage[scaled=.90]{helvet}
\else
  \RequirePackage[no-math]{fontspec}
  \setmainfont{TeXGyreTermesX}[
    UprightFont = *-Regular ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic ,
    Extension = .otf ,
    Scale = 1.0]
    
  \setsansfont{texgyreheros}[
    UprightFont = *-regular ,
    BoldFont = *-bold ,
    ItalicFont = *-italic ,
    BoldItalicFont = *-bolditalic ,
    Extension = .otf ,
    Scale = 0.9]
\fi

\ifdefstring{\VIVID@lang}{cn}{
  \ifdefstring{\VIVID@chinesefont}{founder}{
    \RequirePackage{fontawesome}
    \RequirePackage[UTF8, scheme=plain, fontset=none]{ctex}
    \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03},BoldItalicFont={FZHei-B01}]{FZShuSong-Z01}
    \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
    \setCJKfamilyfont{zhhei}[BoldFont={FZHei-B01}]{FZHei-B01}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{FontAwesome}[BoldFont={FontAwesome}]{FontAwesome}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
    
  \ifdefstring{\VIVID@chinesefont}{nofont}{
    \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}

  \ifdefstring{\VIVID@chinesefont}{ctexfont}{
    \RequirePackage[UTF8,scheme=plain]{ctex}
    \xeCJKsetup{AutoFakeBold=true}
    }{\relax}
  
  \AfterEndPreamble{
    \setlength\parindent{2\ccwd}}
}{\relax}

\ifcsname heiti\endcsname
  \newcommand{\cbfseries}{\heiti}
\else
  \newcommand{\cbfseries}{\bfseries}
\fi


\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

\RequirePackage{anyfontsize}
\ifdefstring{\VIVID@maths}{newtx}{
  \let\oldencodingdefault\encodingdefault
  \let\oldrmdefault\rmdefault
  \let\oldsfdefault\sfdefault
  \let\oldttdefault\ttdefault
  \def\encodingdefault{T1}
  \renewcommand{\rmdefault}{ntxtlf}
  \renewcommand{\sfdefault}{qhv}
  \renewcommand{\ttdefault}{ntxtt}
  \RequirePackage{newtxmath}
  \let\encodingdefault\oldencodingdefault
  \let\rmdefault\oldrmdefault
  \let\sfdefault\oldsfdefault
  \let\ttdefault\oldttdefault
  \let\Bbbk\relax
  \RequirePackage{esint}


  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \let\sumop\relax\let\prodop\relax
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}


% ----- Handle Colors -----
%% 章节以及页脚图形

\RequirePackage[table]{xcolor}
\definecolor{deepBlue}{RGB}{61,124,222}
\definecolor{lightergray}{gray}{0.99}
\definecolor{azures1}{RGB}{250, 252, 254}
\definecolor{azures2}{RGB}{41, 119, 196}
\definecolor{Beige}{RGB}{245,245,220}
\definecolor{Rhodamine}{RGB}{239,84,159}
\definecolor{Magenta}{RGB}{236,0,141}
\definecolor{RubineRed}{RGB}{236,2,126}
\definecolor{DarkCyan}{RGB}{0, 140, 140}
\definecolor{RedViolet}{RGB}{160,34,108}
\definecolor{finegray}{RGB}{248,248,245}
\definecolor{magenta5}{RGB}{199, 42, 199}
\definecolor{Emerald}{RGB}{0, 169, 159}
\definecolor{DeepPink}{RGB}{255, 20, 147}

\ifdefstring{\VIVID@color}{green}{
  \definecolor{structurecolor}{RGB}{0, 174, 247}%
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{230,90,7}%
  \definecolor{third}{RGB}{0,160,152}%
}{\relax}
\ifdefstring{\VIVID@color}{cyan}{
  \definecolor{structurecolor}{RGB}{0, 174, 247}%
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{175,153,8}%
  \definecolor{third}{RGB}{244,105,102}%
}{\relax}
\ifdefstring{\VIVID@color}{blue}{
  \definecolor{structurecolor}{RGB}{60,113,183}
  \definecolor{main}{RGB}{101, 238, 222}%
  \definecolor{second}{RGB}{244, 105, 102}%
  \definecolor{third}{RGB}{0,174,247}%
}{\relax}
\ifdefstring{\VIVID@color}{gray}{
  \definecolor{structurecolor}{RGB}{150,150,150}
  \definecolor{main}{RGB}{150,150,150}%
  \definecolor{second}{RGB}{150,150,150}%
  \definecolor{third}{RGB}{150,150,150}%
}{\relax}
\ifdefstring{\VIVID@color}{black}{
  \definecolor{structurecolor}{RGB}{0,0,0}
  \definecolor{main}{RGB}{0,0,0}%
  \definecolor{second}{RGB}{0,0,0}%
  \definecolor{third}{RGB}{0,0,0}%
}{\relax}

% corlor definition
\definecolor{winered}{RGB}{212, 51, 131}
\definecolor{bule}{RGB}{18,29,57}
\colorlet{coverlinecolor}{second}


% ----- Title Style -----
\ifdefstring{\VIVID@titlestyle}{hang}{\def\style{hang}}{\relax}
\ifdefstring{\VIVID@titlestyle}{display}{\def\style{display}}{\relax}

% reference: 
% https://tex.stackexchange.com/questions/58506/how-to-make-a-new-command-similar-to-author
% https://pastebin.com/C8W4axzV
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}
\newcommand{\extrainfo}[1]{\gdef\@extrainfo{#1}}

\RequirePackage{mwe}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}

\newcommand{\question}[1]{{\par\citshape #1}\\[0.2ex]}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[labelfont={bf,color=structurecolor}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin,stable]{footmisc}
  \setlength{\footnotesep}{12pt}
}



\RequirePackage{graphicx}
%\RequirePackage{enumerate}
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
% \providecommand\qed{}
% \renewcommand{\qed}{\hfill\ensuremath{\square}}
\RequirePackage{booktabs}
\RequirePackage{multicol,multirow}

\RequirePackage{fancyvrb}
\RequirePackage{makecell,lipsum,hologo}
%%中文结构名字


%%   章节设置
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}


\RequirePackage[
  backend=\VIVID@bibend,
  citestyle=\VIVID@citestyle,
  bibstyle=\VIVID@bibstyle]{biblatex}

\ifdefstring{\VIVID@lang}{cn}{
  \renewcommand{\baselinestretch}{1.3}
  \renewcommand{\contentsname}{目录}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\partname}{\color{structurecolor}}
  \renewcommand{\thepart}{第\zhnumber{\arabic{part}}部分}
  \renewcommand{\listfigurename}{插图目录}
  \renewcommand{\listtablename}{表格目录}
  \renewcommand{\bibname}{参考文献}
  \newcommand{\ebibname}{参考文献}
  \renewcommand{\appendixname}{附录}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\indexname}{索\hspace{2em}引}
  \newcommand\figref[1]{\textbf{图}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{表}~\ref{#1}}
  \newcommand{\authorname}{\citshape 作者：}
  \newcommand{\institutename}{\citshape 组织：}
  \newcommand{\datename}{\citshape 时间：}
  \newcommand{\versionname}{\citshape 版本：}
  \newcommand{\notename}{笔记}
  \renewcommand*{\proofname}{证明}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\postulatename}{公设}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例题} %
  \newcommand{\instancename}{示例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{练习} % 练习=习题
  \newcommand{\remarkname}{注}
  \newcommand{\assumptionname}{假设}
  \newcommand{\conclusionname}{结论}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
  \newcommand{\introductionname}{内容提要}
  \newcommand{\introductionsname}{内容概述}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{{\citshape #1}：#2}}
  \newcommand{\updatename}{更新：}
  \newcommand{\historyname}{版本更新历史}
  \newcommand{\beforechap}{第}
  \newcommand{\afterchap}{章}
}{\relax}


\ifdefstring{\VIVID@lang}{en}{
  \setlength\parindent{2em}
  \newcommand\figref[1]{\textbf{Figure}~\ref{#1}}
  \newcommand\tabref[1]{\textbf{Table}~\ref{#1}}
  \renewcommand{\chaptername}{Chapter}
  \renewcommand{\partname}{\color{structurecolor} Part}
  \newcommand{\authorname}{\textbf{Author: }}
  \newcommand{\institutename}{\textbf{Institute: }}
  \newcommand{\datename}{\textbf{Date: }}
  \newcommand{\versionname}{\textbf{Version: }}
  \newcommand{\notename}{Note}
  \newcommand{\proofname}{Proof}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\postulatename}{Postulate}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposition}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Example}
  \newcommand{\exercisename}{Exercise}
  \newcommand{\remarkname}{Remark}
  \newcommand{\assumptionname}{Assumption}
  \newcommand{\conclusionname}{Conclusion}
  \newcommand{\solutionname}{Solution}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Introduction}
  \renewcommand{\appendixname}{Appendix}
  \newcommand{\ebibname}{Bibliography}
  % \newcommand{\problemsetname}{Exercise}
  \newcommand\bioinfo[2]{\gdef\@bioinfo{\textbf{#1}: #2}}
  \newcommand{\updatename}{Updates:}
  \newcommand{\historyname}{Version History}
}{\relax}



\graphicspath{{./figure/}}

\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%  https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=structurecolor,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=structurecolor,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=structurecolor,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{structurecolor}\arabic*.}
\setlist[enumerate,2]{label=\color{structurecolor}(\alph*).}
\setlist[enumerate,3]{label=\color{structurecolor}\Roman*.}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlist[itemize,1]{label={\eitemiii}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

\RequirePackage{apptools}

% appendix chapter:

\ifdefstring{\VIVID@lang}{cn}{
  \ifdefstring{\VIVID@scheme}{chinese}{
    \newcommand{\xchaptertitle}{第\zhnumber{\arabic{chapter}}章} }{
    \newcommand{\xchaptertitle}{第 \thechapter{} 章}}
% Hyperref 2022/05/16's changelog.txt said
% * nameref is loaded always and earlier (issue#235) 
    \AtBeginDocument{
      \ifVIVID@Hy@later
        \patchcmd{\NR@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \else    
        \patchcmd{\Hy@org@chapter}%
          {\numberline{\thechapter}}{\numberline{\xchaptertitle}}%
          {}{\fail}
      \fi
    }
  }
  {\newcommand{\xchaptertitle}{\chaptername~\thechapter~}}

\setcounter{secnumdepth}{5}
\titleformat{\chapter}[\style]{\bfseries}{
  \filcenter\LARGE\enspace\bfseries{\color{structurecolor} \IfAppendix{\appendixname\;\thechapter\;}{\xchaptertitle\;}}}{1pt}{
  \LARGE\bfseries\color{structurecolor}\filcenter}[]
\titleformat{\section}[hang]{\bfseries}{
  \Large\bfseries{\color{structurecolor}\faGg ~\thesection}\enspace}{1pt}{%
  \color{structurecolor}\Large\bfseries\filright}
\titleformat{\subsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}
\titleformat{\subsubsection}[hang]{\bfseries}{
  \large\bfseries\color{structurecolor}\thesubsubsection\enspace}{1pt}{%
  \color{structurecolor}\large\bfseries\filright}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%\titlespacing{\subsection}{0pt}{0.5\baselineskip}{-\baselineskip}



%%define the 
%%definition theorem postulate axiom corollary lemma proposition 
%%and proof environment
\RequirePackage{pifont,manfnt,bbding}
\RequirePackage[many]{tcolorbox}
% \newlength{\normalparindent}
% \setlength{\normalparindent}{\parindent}
\definecolor{axiomcolor}{RGB}{255, 134, 24}%
\ifdefstring{\VIVID@mode}{fancy}{
  \tcbset{
    common/.style={
      fontupper=\citshape,
      lower separated=false,
      % before upper={\setlength{\parindent}{\normalparindent}},
      coltitle=black,
      colback=gray!5,
      boxrule=0.5pt,
      fonttitle=\bfseries,
      enhanced,
      breakable,
      top=8pt,
      before skip=8pt,
      attach boxed title to top left={
        yshift=-0.11in,
        xshift=0.15in},
      boxed title style={
        boxrule=0pt,
        colframe=white,
        arc=0pt,
        outer arc=0pt},
      separator sign={.},},
    defstyle/.style={  %定义
      common,
      colframe=main,  
      colback=main!5,
      colbacktitle=main, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{main}{$\clubsuit$}};}},
    thmstyle/.style={ %定理
      common,
      coltitle=white,
      colframe=second,  
      colback=second!5,
      colbacktitle=second, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{second}{$\heartsuit$}};}},
    axiostyle/.style={ %公理
      common,
      coltitle=white,
      colframe=cyan,  
      colback=cyan!5,
      colbacktitle=cyan, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{pink}{$\spadesuit$}};}},
    prostyle/.style={ %公设
      common,
      colframe=violet,
      coltitle=white,
      colback=violet!5,
      colbacktitle=violet!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{violet}{$\spadesuit$}};}},
    propostyle/.style={ %命题
      common,
      colframe=blue,
      coltitle=white,
      colback=blue!5,
      colbacktitle=blue!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{blue}{$\spadesuit$}};}},
    corostyle/.style={ %推论
      common,
      colframe=magenta!60,
      coltitle=white,
      colback=magenta!5,
      colbacktitle=magenta!80, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{magenta}{$\spadesuit$}};}},
    lemostyle/.style={ %引理
      common,
      colframe=orange,
      coltitle=white,
      colback=orange!5,
      colbacktitle=orange!70, 
      overlay unbroken and last={
        \node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
          \textcolor{orange}{$\spadesuit$}};}},
    VIVID@title/.code n args={2}
      {
        \ifblank{#2}
          {\tcbset{title={\csname #1name\endcsname~\thetcbcounter}}}
          {\tcbset{title={\csname #1name\endcsname~\thetcbcounter\ (#2)}}}
      },
    VIVID@label/.code n args={2}
      {
        \ifblank{#2}
          {}{\tcbset{label={#1:#2}}}
      }
    }
  
  % define an internal control sequence \VIVID@newtheorem for fancy mode's newtheorem
  % #1 is the environment name, #2 is the prefix of label, #3 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \VIVID@newtheorem{theorem}{thm}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \newcommand{\VIVID@newtheorem}[3]{
    \ifcsundef{#1name}{%
      \ClassError{VIVIDbook}{%
        \ #1name undefined, \MessageBreak
        Please check in language setting
      }{}
    }{\relax}
    \DeclareTColorBox[auto counter,number within=\VIVID@thmcnt]{#1}{ g o t\label g }{
        common,#3,
        IfValueTF={##1}
          {VIVID@title={#1}{##1}}
          {
            IfValueTF={##2}
            {VIVID@title={#1}{##2}}
            {VIVID@title={#1}{}}
          },
        IfValueT={##4}
          {
            IfBooleanTF={##3}
              {label={##4}}
              {VIVID@label={#2}{##4}}
          }
      }
    \DeclareTColorBox{#1*}{ g o }{
        common,#3,
        IfValueTF={##1}
          {VIVID@title={#1}{##1}}
          {
            IfValueTF={##2}
            {VIVID@title={#1}{##2}}
            {VIVID@title={#1}{}}
          },
      }
  }
  % define several environment 
  % we define headers like \definitionname before
  \VIVID@newtheorem{definition}{def}{defstyle}
  \VIVID@newtheorem{theorem}{thm}{thmstyle}
  \VIVID@newtheorem{postulate}{pos}{prostyle} % prostyle
  \VIVID@newtheorem{axiom}{axi}{axiostyle}
  \VIVID@newtheorem{corollary}{cor}{corostyle}
  
  \VIVID@newtheorem{lemma}{lem}{lemostyle}
  \VIVID@newtheorem{proposition}{pro}{propostyle}
}{\relax}


\ifdefstring{\VIVID@mode}{simple}{
  \let\openbox\relax
  \RequirePackage{amsthm}
  \let\proof\relax
  % \let\proofname\relax
  \let\endproof\relax

  % declare new theorem styles: defstyle, thmstyle, prostyle
  \newtheoremstyle{defstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{main}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{thmstyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{second}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
  \newtheoremstyle{prostyle}{3pt}{3pt}{\citshape}{-3pt}{
    \bfseries\color{third}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

  % define an internal control sequence \VIVID@newtheorem for simple mode's newtheorem
  % #1 is the environment name, #2 is the style
  % style: thmstyle, defstyle, prostyle
  % e.g. \VIVID@newtheorem{theorem}{thmstyle}
  % will define two environments: numbered ``theorem'' and no-numbered ``theorem*''
  % WARNING FOR MULTILINGUAL: this cs will automatically find \theoremname's definition,
  % WARNING FOR MULTILINGUAL: it should be defined in language settings.
  \newcommand{\VIVID@newtheorem}[2]{
    \theoremstyle{#2}
    \newtheorem{#1}{\csname #1name\endcsname}[\VIVID@thmcnt]
    \newtheorem*{#1*}{\csname #1name\endcsname}
  }

  % define several environment 
  % we define headers like \definitionname before
  \VIVID@newtheorem{definition}{defstyle}
  \VIVID@newtheorem{theorem}{thmstyle}
  \VIVID@newtheorem{postulate}{prostyle}
  \VIVID@newtheorem{axiom}{axiostyle}
  \VIVID@newtheorem{corollary}{thmstyle}
  \VIVID@newtheorem{lemma}{thmstyle}
  \VIVID@newtheorem{proposition}{prostyle}
}{\relax}

% define an user control sequence \VIVIDnewtheorem
% #1 is the evironment, #2 is the theorem header
% #3 is the style       #4 is the prefix for fancy mode
% style: thmstyle, defstyle, prostyle
% if #4 is given in simple mode, an error will be raised
% if #4 isn't given in fancy mode, the prefix will be set equal to #1,
%   and a warning will be raised
\newcommand{\VIVID@newtheorem@warning}{}
\newcommand{\VIVID@newtheorem@error}{}
\NewDocumentCommand\VIVIDnewtheorem{ m m m g }
  {
    \renewcommand{\VIVID@newtheorem@warning}{
      \ClassWarning{VIVIDbook}{%
        Because you didn't provide a prefix. \MessageBreak
        We use #1 as the default prefix. \MessageBreak
        You have to use \MessageBreak
        \ref{#1:label} to refer a \MessageBreak
        \begin{#1}{name}{label} environment. \MessageBreak
      }
    }
    \renewcommand{\VIVID@newtheorem@error}{
      \ClassError{VIVIDbook}{%
        You can't set a prefix in mode ``simple''.\MessageBreak
        Just use \MessageBreak
        \VIVIDnewtheorem{#1}{#2}{#3}
      }{%
        We are using ``amsthm'' package to \MessageBreak
        generate theorem-like theorem. \MessageBreak
        The 4th parameter ``prefix'' isn't allowed.
      }
    }
    \expandafter\def\csname #1name\endcsname{#2}
    \ifdefstring{\VIVID@mode}{simple}{%
        \IfValueTF{#4}
          {\VIVID@newtheorem@error}
          {\VIVID@newtheorem{#1}{#3}}
      }{\relax}
    \ifdefstring{\VIVID@mode}{fancy}{%
        \IfValueTF{#4}
          {
            \def\VIVID@temp@prefix{#4}
            \ifdefempty{\VIVID@temp@prefix}
              {
                \VIVID@newtheorem{#1}{#1}{#3}
                \VIVID@newtheorem@warning
              }
              {\VIVID@newtheorem{#1}{#4}{#3}}
          }
          {
            \VIVID@newtheorem{#1}{#1}{#3}
            \VIVID@newtheorem@warning
          }
      }{\relax}
  }

% main（green-def): example exercise problem solution
% second（orange-thm）: proof note remark  
% third（blue-prop):  assumptions property conclusion custom

%% Example with counter  % 手动注释
%\newcounter{exam}[chapter]
%\setcounter{exam}{0}
%\renewcommand{\theexam}{\thechapter.\arabic{exam}}
%\newenvironment{example}[1][]{
%  \refstepcounter{exam}
%  \par\noindent\textbf{\color{main}{\examplename} \theexam #1 }\rmfamily}{
%  \par\ignorespacesafterend}

%% Exercise with counter
\newcounter{exer}[chapter]
\setcounter{exer}{0}
\renewcommand{\theexer}{\thechapter.\arabic{exer}}
\newenvironment{exercise}[1][]{
  \refstepcounter{exer}
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\HandPencilLeft\quad}
    \textbf{\color{main}{\exercisename} \theexer #1 }\rmfamily}{
    \par\ignorespacesafterend}

%% Problem with counter
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{main}{\problemname} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend}

\newenvironment{note}{
  \par\noindent\makebox[-3pt][r]{
    \scriptsize\color{red!90}\textdbend\quad}
    \textbf{\color{second}\notename} \citshape}{\par}

\newenvironment{proof}{
  \par\noindent\textbf{\color{second}\proofname\;}
  \color{black!90}\cfs}{
  % \hfill$\Box$\quad
  \par}

\newenvironment{solution}{\par\noindent\textbf{\color{main}\solutionname} \citshape}{\par}
\newenvironment{remark}{\noindent\textbf{\color{second}\remarkname}}{\par}
%\newenvironment{assumption}{\par\noindent\textbf{\color{third}\assumptionname} \citshape}{\par}  %这三个暂时移除
%\newenvironment{conclusion}{\par\noindent\textbf{\color{third}\conclusionname} \citshape}{\par}
%\newenvironment{property}{\par\noindent\textbf{\color{third}\propertyname} \citshape}{\par}
\newenvironment{custom}[1]{\par\noindent\textbf{\color{third} #1} \citshape}{\par}

\RequirePackage{multicol}
\tcbset{
  introductionsty/.style={
    enhanced,
    breakable,
    colback=structurecolor!10,
    colframe=structurecolor,
    fonttitle=\bfseries,
    colbacktitle=structurecolor,
    fontupper=\citshape,
    attach boxed title to top center={yshift=-3mm,yshifttext=-1mm},
    boxrule=0pt,
    toprule=0.5pt,
    bottomrule=0.5pt,
    top=8pt,
    before skip=8pt,
    sharp corners
  },
}


\newenvironment{introduction}[1][\introductionname]{
  \begin{tcolorbox}[introductionsty,title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
      \end{itemize}
    \end{multicols}
  \end{tcolorbox}}

\tcbset{
    alphasty/.style={
        enhanced,
        breakable,
        colback=azures1,
        colframe=azures2,
        boxrule=0pt,
        top=8pt,
        before skip=12pt,
        sharp corners,
        arc=0mm,
        drop lifted shadow={color=black!20!white,opacity=.3,shadow xshift=0.1cm},%盒子阴影
        overlay = {%
            %标题盒子
            \node[rectangle, %opacity=.3,
            text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
            inner sep=1.5mm,fill=azures2,
            anchor=west,
            font=\bfseries] at ([xshift=.45\textwidth,yshift=.5mm]frame.north west)%
            {\bf \introductionsname};
        },
    }
}
%%--------------------------------------------------%%
\newenvironment{introductions}[1][\introductionsname]{\smallskip
    \begin{tcolorbox}[alphasty]
        \begin{multicols}{2}
            \begin{itemize}[label=\textcolor{structurecolor}{\upshape\scriptsize\SquareShadowBottomRight}]}{
            \end{itemize}
        \end{multicols}
    \end{tcolorbox}\smallskip}

%%%%%%%%%%%%%%%%%%
\RequirePackage{adforn}

\newenvironment{problemset}[1][\xchaptertitle~\exercisename]{
  \vspace*{10pt}
  \begin{center}
    \phantomsection\addcontentsline{toc}{section}{\texorpdfstring{\xchaptertitle~\exercisename}{\exercisename}}
    % \markboth{#1}{\rightmark}
    \markright{#1}
    \textcolor{structurecolor}{\Large\bfseries\adftripleflourishleft~#1~\adftripleflourishright}
  \end{center}
  \begin{enumerate}}{
  \end{enumerate}}

\def\relsec{\endgroup start}
\def\endrelsec{end\begingroup\def \@currenvir {relsec}}

\ifdefstring{\VIVID@result}{noanswer}{
  \AtBeginDocument{
  \excludecomment{solution}
  \excludecomment{proof}
  \excludecomment{inline}
  }
}{\relax}







%页眉页脚

%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome}
\RequirePackage{xhfill}
\fancyhf{}

\fancyfoot[c]{\color{structurecolor} \faGg 第~\color{black}{\thepage}\color{structurecolor}~页 \faGg}

\if@twoside
\fancyhead[EL]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[ER]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[OR]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyhead[OL]{\color{structurecolor}\cnormal\rightmark}
\fancyfoot[EL]{\color{red}{\faLink} }
\fancyfoot[ER]{\color{red}{\faLink} }
\fancyfoot[OR]{\color{structurecolor}{\faUnlink}}
\fancyfoot[OL]{\color{structurecolor}{\faUnlink}}
\else
\fancyhead[R]{\color{structurecolor}\cnormal\rightmark}
\fancyhead[L]{\color{structurecolor}{\faPaperPlaneO}\cnormal\leftmark} % E表示偶数页
\fancyfoot[L]{\color{red}{\faLink}}
\fancyfoot[R]{\color{cyan}{\faUnlink}}
\fi
\renewcommand{\headrule}{\color{orange!90}\hrule width\textwidth}
\pagestyle{fancy}
\fancypagestyle{plain}{\renewcommand{\headrulewidth}{0pt}\fancyhf{}\renewcommand{\headrule}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\, #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}
%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand*{\maketitle}{%
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \ifdefstring{\VIVID@device}{normal}{
    \ifcsname @cover\endcsname
      \includegraphics[width=\linewidth]{\@cover}
    \else
      \includegraphics[width=\linewidth]{example-image}
    \fi
  }{\relax}
  \ifdefstring{\VIVID@device}{pad}{
    \ifcsname @cover\endcsname
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{\@cover}
    \else
      \includegraphics[trim=0 26bp 0 26bp,clip=true, width=\linewidth]{example-image}
    \fi
  }{\relax}
  \setlength{\fboxsep}{0pt}
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{
    \bfseries\Huge 
      \ifcsname @title\endcsname \@title \fi
    \par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\bfseries\Large
      \ifcsname @subtitle\endcsname\@subtitle\\[2ex]\fi}
    \color{gray}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{l}
      % \ifcsname @author\endcsname \authorname \@author\\\fi
      \ifx\@author\empty\else\authorname\cnormal\@author\\ \fi
      \ifcsname @institute\endcsname \institutename \cnormal\@institute\\ \fi
      % \ifcsname @date\endcsname  \@date\\\fi
      \ifx\@date\empty\else\datename\cnormal\@date \\ \fi
      \ifcsname @version\endcsname \cnormal\versionname\@version\\ \fi
      \ifcsname @bioinfo\endcsname \cnormal\@bioinfo\\ \fi
    \end{tabular}}
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
  \begin{tikzpicture}[remember picture,overlay]
    \begin{pgfonlayer}{background}
      \node[opacity=0.8,
            anchor=south east,
            outer sep=0pt,
            inner sep=0pt] at ($(current page.south east) +(-0.8in,1.5in)$) {
              \ifcsname @logo\endcsname\includegraphics[width=4.2cm]{\@logo}\fi};
    \end{pgfonlayer}
  \end{tikzpicture}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering \citshape 
      \ifcsname @extrainfo\endcsname\@extrainfo\fi}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\thispagestyle{empty}}


\newcommand{\dollar}{\mbox{\textdollar}}

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
  texcsstyle=*\color{winered},
  numbers=none,
  mathescape=false,
  breaklines=true,
  keywordstyle=\color{winered},
  commentstyle=\color{gray},
  emph={VIVIDpaper,fontenc,fontspec,xeCJK,citestyle,FiraMono,xunicode,figure,fig,image,img,table,itemize,enumerate,ctex,microtype,description,times,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,device,color,mode,lang,amsthm,tcolorbox,titlestyle,cite,ctex,listings,base,math,scheme,toc,esint,chinesefont,amsmath,bibstyle,natbib,pgfornament},
  emphstyle={\color{frenchplum}},
  morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,section,hypersetup,mainmatter,frontmatter,tableofcontents,VIVIDpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf,VIVIDnewtheorem,thmcnt,colorlet},
  frame=single,
  tabsize=2,
  rulecolor=\color{structurecolor},
  framerule=0.2pt,
  columns=flexible,
  % backgroundcolor=\color{lightgrey}
}

\newcommand\bmmax{0}
\RequirePackage{bm}

% add the list of change history
\newcommand{\dateinfoline}[2]{
  \noindent\makebox[0pt][r]{%
  \makebox[-3em][r]{%
    \small
    \textbf{\textcolor{structurecolor}{#1}}}\;\;}%
  {\citshape\updatename\ignorespaces#2}}

\newcommand{\datechange}[2]{%
  \noindent{\makebox[\textwidth][r]{\color{structurecolor}\rule{1.15\textwidth}{.4pt}}}
  \dateinfoline{#1}{#2}
  \addcontentsline{dates}{section}{#1 -- #2}}

\newcommand{\listofchanges}{%
  \begingroup
   \renewcommand{\contentsname}{\historyname}
    \let\old@starttoc\@starttoc
    \def\@starttoc##1{
      \old@starttoc{dates}}
    \tableofcontents%
 \endgroup}
% https://tex.stackexchange.com/questions/472931/list-of-all-dates-in-a-document

\newenvironment{change}{
  \begin{enumerate}[label=\small\protect\circled{\arabic*}]}{
  \end{enumerate}}



\renewcommand\tableofcontents{%
  \hypersetup{linktoc=all, linkcolor=black}
    \if@twocolumn
     \@restonecoltrue\onecolumn
   \else
    \@restonecolfalse
  \fi
   \chapter*{\contentsname
       \@mkboth{%
          \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
 \ifdefstring{\VIVID@toc}{twocol}{
     \setlength{\columnsep}{2em}
     \begin{multicols}{2}%
       \@starttoc{toc}
      \end{multicols}}{
     \@starttoc{toc}}
   \if@restonecol\twocolumn\fi
   \hypersetup{linkcolor=winered}}


\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{empty}%
beforechap\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% https://tex.stackexchange.com/questions/56839/chaptername-is-used-even-for-appendix-chapters-in-toc
\RequirePackage{calc}
\RequirePackage[titles]{tocloft}
\ifdefstring{\VIVID@lang}{cn}{
  % \renewcommand{\cftchappresnum}{\beforechap\space}
  % \renewcommand{\cftchapaftersnum}{\space\afterchap}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{附录~999}}}
  \g@addto@macro\appendix{%
    % recover \thechapter in the \NR@chapter's \numberline
    \ifVIVID@Hy@later
      \patchcmd{\NR@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}      
    \else
      \patchcmd{\Hy@org@chapter}%
        {\numberline{\xchaptertitle}}{\numberline{\thechapter}}%
        {}{\fail}  
    \fi
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
    }%
  }
}{
  \renewcommand{\cftchappresnum}{\chaptername\space}
  \renewcommand{\cftchapaftersnum}{\space}
  \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~9}}}
  \g@addto@macro\appendix{%
    \addtocontents{toc}{%
      \protect\renewcommand{\protect\cftchappresnum}{\appendixname\space}%
      \protect\renewcommand{\protect\cftchapaftersnum}{}%
      \setlength{\cftchapnumwidth}{\widthof{\textbf{Appendix~999}}}
    }%
  }
}

% restore the tt default family to lmodern tt family
\renewcommand\ttdefault{lmtt}









%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontawesome}
\RequirePackage{xhfill}
\RequirePackage[object=vectorian]{pgfornament} 
\definecolor{ocre}{RGB}{146, 218, 243}
%%%%%%%%%%%目录,chapter图片定制开始%%%%%%%%%%%%%%%
\newif\ifusechapterimage
\usechapterimagetrue
\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\ifusechapterimage\renewcommand{\thechapterimage}{#1}\fi}%
\newcommand{\autodot}{{\color{structurecolor}\faModx}}
\def\@makechapterhead#1{%
	{\parindent \z@ \raggedright \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\kaishu\bfseries\color{black} 第 \thechapter 章  \autodot\color{black}~#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\else
		\begin{tikzpicture}[remember picture,overlay]
			\node at (current page.north west)
			{\begin{tikzpicture}[remember picture,overlay]
					\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
					\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
					\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\kaishu\bfseries\color{black}#1\strut};
			\end{tikzpicture}};
		\end{tikzpicture}
		\fi\fi\par\vspace*{230\p@}}
	\thispagestyle{fancy}
	}

\def\@makeschapterhead#1{%
	\begin{tikzpicture}[remember picture,overlay]
		\node at (current page.north west)
		{\begin{tikzpicture}[remember picture,overlay]
				\node[anchor=north west,inner sep=0pt] at (0,0) {\ifusechapterimage\includegraphics[width=\paperwidth]{\thechapterimage}\fi};
				\draw[anchor=west] (\Gm@lmargin+3.3cm,-9cm) node [line width=2pt,rounded corners=15pt,draw=ocre,fill=white,fill opacity=0.5,inner sep=15pt]{\strut\makebox[22cm]{}};
				\draw[anchor=west] (\Gm@lmargin+3.9cm,-9cm) node {\huge\sffamily\bfseries\color{black}#1\strut};
		\end{tikzpicture}};
	\end{tikzpicture}
	\par\vspace*{230\p@}}
%%%%%%%%%%%目录,chapter图片定制结束%%%%%%%%%%%%%%%

\newcommand{\@mptof}[2]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{1.1cm}{\color{orange}\Large\bfseries\centering#1}}
\hspace{4pt}
    \colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth-1.3cm}{\partname\Large\centering 第#1部分 * #2}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{%
	\setlength\fboxsep{0pt}%
	\noindent\colorbox{ocre!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\titlecontents{part}
[-2pt] % Left indentation
{\addvspace{10pt}\bfseries} % Spacing and font options for parts
{}
{}
{}
[\addvspace{-12pt}]
\titlecontents{chapter}
[14mm] % Left indentation
{\bfseries\hspace{-1pt}} %
{\contentslabel[\heiti \thecontentslabel]{14mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{~}\contentspage}
%%%%%%%%PART,chpter目录样式部分定制结束%%%%%%%%%%%%%%%

\titlecontents{section}
[14mm] % Left indentation
{\hspace{-2pt}} %
{\contentslabel[\heiti \thecontentslabel]{7mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{$.$}\contentspage}

\titlecontents{subsection}
[25mm] % Left indentation
{\hspace{-2pt}} %
{\contentslabel[\heiti \thecontentslabel]{10mm}}
{}
%{[0.5pc]{$\cdot$}\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
{\bfseries\ttfamily\titlerule*[0.5pc]{$.$}\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{wallpaper}
%%%%%%%%%%%PART页面定制%%%%%%%%%%%%%%%%%%%%%
\newcommand{\thepartimages}{}%
\newcommand{\partimages}[1]{\ifusepartimage\renewcommand{\thepartimages}{#1}\fi}%

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
	\refstepcounter{part}%
	\addcontentsline{toc}{part}{
	\texorpdfstring{\protect\@mptof{\arabic{part}}{#1}}
	{\arabic{part}~\thepart\ ---\ #1}
}
	\else
	\addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	{\ThisCenterWallPaper{1}{\thepartsimage}
		\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
\vskip 2cm	\huge\bfseries 	 \partname  \thepart  \\ 
    \pgfornament[scale=.3]{72}  #2 
        \pgfornament[scale=.3]{73}\\[-5pt]
        \pgfornament[scale=.5]{85} \\
		\vskip 80\p@
		\fi
    \begin{minipage}[c]{.95\textwidth}
        \begin{tcolorbox}[enhanced jigsaw,
            opacityframe=0.5,opacityback=0.25,opacitybacktitle=0.25,
            colback=cyan!0,colframe=cyan,colbacktitle=cyan,
            boxrule=0pt,
            toprule=1.5pt,
            bottomrule=1.5pt,
            arc=0mm,
            overlay = {%
                %标题盒子
                \node[rectangle, %opacity=.3,
                text=white, drop shadow={opacity=.3, shadow xshift=0.1cm},rounded corners=2pt,
                inner sep=1.5mm,fill=cyan,
                anchor=west,
                font=\bfseries] at ([xshift=.4\textwidth,yshift=.5mm]frame.north west)%
                {\bf \large 第 \arabic{part} 部分目录};
            }
            ]
            \color{cyan}{
           \normalsize
           \startcontents
           \printcontents{l}{0}[1]{}}
        \end{tcolorbox}
     \end{minipage}
				%   \thispagestyle{empty}
    \vfill
	}%
	\@endpart}
\def\@spart#1{%
	{\centering
		\interlinepenalty \@M
		\normalfont
		\Huge \bfseries #1\par}%
	\@endpart}
\def\@endpart{\vfil\newpage
	\if@twoside
	\if@openright
	\null
	\thispagestyle{empty} %
	\fi
	\fi
	\if@tempswa
	\twocolumn
	\fi}
\newif\ifusepartsimage
\usepartsimagetrue
\newcommand{\thepartsimage}{}%
\newcommand{\partsimage}[1]{\ifusepartsimage\renewcommand{\thepartsimage}{#1}\fi}%
%%%%%%%%%%%%%% PART部分定制结束%%%%%%%%%%%%%%%%%%

\definecolor{mlred}{RGB}{253,243,242}
\definecolor{mred}{RGB}{220,53,69}
\definecolor{bg}{rgb}{0.99,0.99,0.99}
\definecolor{mlblue}{RGB}{236,243,255}
\definecolor{mblue}{RGB}{0,123,255}
\definecolor{lsp}{RGB}{0,174,247}
\definecolor{mlblue3}{RGB}{44, 49, 51} % mycmd颜色
\definecolor{mlblue2}{RGB}{35, 41, 55}


%%%%%%%%%%%%%%%%代码抄录定制类%%%%%%%%%%%%%%%%%%%
\RequirePackage{tcolorbox}
\tcbuselibrary{listings,breakable}


\newcommand{\md}[1]{{\color{purple}#1}}
\newcommand{\keypoint}[1]{\textbf{\textcolor{red}{#1}}}
\definecolor{structurecolor}{RGB}{0, 174, 247}%




\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\small\fi
}

\lstset{basicstyle=\ttfamily,style=mystyle,breaklines=true}

\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{red!40!orange},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{red!40!orange},
	commentstyle=\color{gray},
emph={equation,itemize,assumption,solution,math,tcolorbox,lstlisting,dinglist,ctex,VIVIDpaper,microtype,fontspec,base,lemma,description,bibstyle,warning,XeLaTeX,minted,exercise,amsthm,booktabs,device,proposition,ascolorbox5,mode,gather,python,iiint,amsmath,example, conclusion,type1cm,mycmd2,ascolorbox1,corollary,sBox,shell,note,macboxd,toc,cite,ascolorbox4,aligned,FiraMono,scheme,color,problem,macbox,pgfornament,xunicode,ascolorbox0,table,PDFLaTeX,titlestyle,property,iint,theorem,figure,introduction,nginx,ascolorbox3,chinesefont,definition,citestyle,ascolorbox10,fontenc,fig,ascolorbox16,axiom,vim,code,enumerate,ascolorbox17,lang,int,ascolorbox19,img,times,BibTeX,image,tabular,proof,postulate,align,xeCJK,ascolorbox11,natbib,remark,esint,listings},
morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,definecolor,extrainfo,logo,cover,subtitle,appendix,chapter,hypersetup,mainmatter,frontmatter,tableofcontents,VIVIDpar,heiti,kaishu,lstset,pagecolor,zhnumber,marginpar,part,equote,marginnote,bioinfo,datechange,listofchange,lvert,lastpage,songti,heiti,fangsong,setCJKfamilyfont,textbf},
	emphstyle={\color{cyan}},
    breakatwhitespace=true,
	frame=single,
	rulecolor=\color{structurecolor},
	framerule=0pt,
	columns=flexible,
}

\setmonofont{CMU Typewriter Text}

%%--------------------------------------------------%%

%%%%% 自定义-----%%%%%%%%%%%%
\newcommand{\emb}[2][Magenta]{{\bf\color{#1}\uuline{#2}}}


%%%%%%%%%%%%%%%%性质
\newcounter{property}
\setcounter{property}{1}
\renewcommand{\theproperty}{\arabic{property}}

\newtcolorbox{wwproposition3}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=structurecolor,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} 性质~\theproperty. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  性质~\theproperty. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=structurecolor]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{property}{O{} O{} O{}}{\smallskip\begin{wwproposition3}{#1}{#2}#3}{\end{wwproposition3} }

%%%%%%%%%%%%%%%%
\tikzset{
    wnodeTheorem/.style={%
        rectangle,top color=lightergray, bottom color=lightergray,
        inner sep=1mm,anchor=west,font=\bf\rmfamily},
    % wnodeminimum/.style={%
        % 	rectangle,  top color=white, bottom color=white,
        % 	text=Emerald,inner sep=1mm,anchor=west,font=\bf\rmfamily}
}
%评析环境-------------------------------------------------------
\newtcolorbox{anybox}[2][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=6mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} #2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} #2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    #1
}
%
\NewDocumentEnvironment{anymark}{O{} O{} O{}}{\smallskip\begin{anybox}{#1}{#2} #3}{\end{anybox}}
% 结束评析
% 例题开始 --------------------------------------------------
% Example with counter
\newcounter{exam}[chapter]
\setcounter{exam}{0}
\renewcommand{\theexam}{\thechapter.\arabic{exam}}
% 例题环境
\newtcolorbox{wwexample}[3][]{%
    arc=0mm,
    breakable,drop fuzzy shadow=black!20!white,
    enhanced,
    colback=lightergray,
    boxrule=0pt,
    top=8mm, %分隔垂直-开始文本
    % enlarge top by=\baselineskip/2+1mm,
    % enlarge top at break by=0mm,pad at break=2mm,
    fontupper=\normalsize,
    step and label={exam}{#3},%标签
    overlay unbroken = {%
        %垂直线段%更改有效
        %\draw[color=gray!5,line width=3pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%更改有效
        \fill[fill=Emerald] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
        % 图像框示例
        %\node[rectangle,
        %         text=black, ,fill=ALamarillo!20,
        %         inner sep=1mm,anchor=west,font=\small\bf\sffamily] at ([xshift=-10.3pt,yshift=-3.2mm]frame.north west)%
        %{ };
        %框编号和描述%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=Emerald,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{black}例题 \theexam. ~#2};%标题
    },
    % fin overlay
    overlay first  = {%
        %标题框编号和描述%跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=Emerald,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf \color{white} 例题 \theexam.~#2};
    },
    % overlay
    %边缘改变%跨页时生效
    overlay middle={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
    },
    overlay last={\draw[color=lightergray,line width=3pt] ([xshift=3pt] frame.north west)--([xshift=2pt] frame.south west);
        %底部装饰矩形%跨页时生效
        \fill[fill=Emerald] (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm); }
    #1}
%
\NewDocumentEnvironment{example}{O{} O{} O{}}{\smallskip\begin{wwexample}{#1}{#2}%
        #3}{\end{wwexample} }
%例题结束-----------------------------------------------------------------

\newcounter{assumption}
\setcounter{assumption}{1}
\renewcommand{\theassumption}{\arabic{assumption}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtcolorbox{wwproposition}[2][]{
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,top=8mm,drop fuzzy shadow=black!20!white,
    fontupper=\normalsize, 
    overlay unbroken = {
        %左上边缘细线%更改有效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %标题%更改有效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white} 假设~\theassumption. ~#2}; %这里可以补计数器
        %底部 (下边缘)颜色装饰矩形%更改有效
        \fill[fill=DeepPink]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    },%上面是实际控制代码,下面的代码仅在跨页分割时生效
    overlay first = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.north west)--([xshift=0pt]frame.north east);
        %标题 %跨页时生效
        \node[rectangle, %opacity=.3,
        text=black, drop shadow={opacity=.3, shadow xshift=0.1cm},
        inner sep=1.5mm,fill=DeepPink,
        anchor=west,
        font=\normalsize] at ([xshift=0cm,yshift=-3.mm]frame.north west)%
        {\bf  \color{white}  假设~\theassumption. #2};
    },%保持边缘的变化
    overlay last = {%跨页时生效
        % \draw[color=gray,  line width=0.2pt] (frame.south west)--([xshift=0pt]frame.south east);
        %底部%跨页时生效
        \fill[fill=DeepPink]  (.9\textwidth,0.2cm) rectangle(\textwidth,-0.0cm);
    }
    #1
}
\NewDocumentEnvironment{assumption}{O{} O{} O{}}{\smallskip\begin{wwproposition}{#1}{#2}#3}{\end{wwproposition} }


\newtcolorbox{keypointbox}[2][]{%
    arc=0mm,breakable,enhanced,colback=lightergray,boxrule=0pt,
    top=6mm,fontupper=\normalsize,%step and label={tcbremark}{#3},
    overlay unbroken  = {
        %垂直条%更改有效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题：定义%更改有效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} 性质~#2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    overlay first  = {
        %垂直线段%跨页时生效
        \draw[color=structurecolor,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
        %标题:定义 %跨页时生效
        \node[wnodeTheorem](title) at ([xshift=4.5pt, yshift=-3mm]frame.north west)
        {\textbf{\color{magenta5} 性质~#2}};
        % \draw[color=magenta5,line width=2pt] ([xshift=3.5pt,yshift=-5.5mm] frame.north west)--([yshift=-5.5mm] frame.north east);
    }, %overlay
    % 保持边缘的变化
    overlay last    = {
        %垂直线段%跨页时生效
        \draw[color=magenta5,  line width=2pt] ([xshift=2pt] frame.north west)--([xshift=2pt] frame.south west);
    }
    #1
}
%
\NewDocumentEnvironment{conclusion}{O{} O{} O{}}{\smallskip\begin{keypointbox}{#1}{#2} #3}{\end{keypointbox}}






