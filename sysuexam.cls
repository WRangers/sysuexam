% sysuexam.cls v1.2
%
% A LaTeX2e document class for SYSU exams.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%
% The work is modified based on BHCexam.cls, whose original author's
% information is shown below.
%
% BAO HONG CHANG
% Mathcrowd Inc.
% Shanghai
% charles@mathcrowd.cn
% 
% The newest version of original documentclass should always be available
% from my web page: https://github.com/mathedu4all/bhcexam

% This work modifies and refines the BCHexam.cls in pariticularly for Sun-
% Yat Sen University midterm or final exams.
%
% Junxu Wang
% SYSU
% wangjx77@mail2.sysu.edu.cn
%
% The update version is available on https://github.com/WRangers/sysuexam

\def\fileversion{1.0}
\def\filedate{2021/01/27}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sysuexam}[\filedate\space Version \fileversion\space by Junxu Wang]
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 文档类选项 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% answers  	显示解析
% list 		以列表项目格式显示试题
% twocolumn 使用A3纸张并分栏
% custom    使用私订字体
% adobe     使用adobe字体
% ubuntu    使用ubuntu字体
% windows   使用windows字体
% fandol    使用fandol字体，随texlive默认安装
% mac       使用mac字体
% csize5    默认字体大小为五号
% csize4    默认字体大小为小四
% 

\newif\if@printanswers \@printanswersfalse
\DeclareOption{answers}{\@printanswerstrue}

\newcommand\@fontsize{false}
\DeclareOption{csize5}{\renewcommand\@fontsize{5}}
\DeclareOption{csize4}{\renewcommand\@fontsize{-4}}

\newcommand\@fontset{windows}
\DeclareOption{adobe}{\renewcommand\@fontset{adobe}}
\DeclareOption{ubuntu}{\renewcommand\@fontset{ubuntu}}
\DeclareOption{mac}{\renewcommand\@fontset{mac}}
\DeclareOption{windows}{\renewcommand\@fontset{windows}}
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}

\newif\if@custom  \@customfalse
\DeclareOption{custom}{\@customtrue}

\newif\if@twocolumn  \@twocolumnfalse
\DeclareOption{twocolumn}{\@twocolumntrue}

\newif\if@list  \@listfalse
\DeclareOption{list}{\@listtrue}

% 声明文类为article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                加载宏包 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tabularx,ifthen} 			% 排选项用
\RequirePackage{xcolor,graphicx,caption} 	% 彩色、图片、图释
\colorlet{dr}{red!70!black}					% 链接颜色
\colorlet{jx}{red!70!black}					% 答案和解析颜色
\RequirePackage{geometry,fancyhdr} 			% 纸张、边距、页眉、页脚
\RequirePackage{etoolbox} 
\RequirePackage{pifont} 					% 带圈数字\ding
\RequirePackage{bbding} 					% 图案
\RequirePackage{romannum} 					% 罗马数字
\RequirePackage{enumitem}
\RequirePackage{fix-cm}                 	% 调整字号
\RequirePackage{siunitx}            		% 标准单位宏包
\RequirePackage{ragged2e}           		% 断词宏包
% \RequirePackage{arydshln}           		% 表格虚线,与longtable冲突
% \RequirePackage{longtable}
\RequirePackage{wrapfig}            		% 图文绕排
\RequirePackage{booktabs}           		% 图表线
\RequirePackage{multicol}           		% 多栏
\RequirePackage{paralist}	         		% 列表宏包
% \RequirePackage{stfloats}           		% 双栏排版图表浮动
% \RequirePackage{float}              		% 图表浮动
\RequirePackage{floatrow}           		% 图表浮动组.与float冲突
% \RequirePackage{svg}                		% svg插图
% \svgpath{{svg/}}
\RequirePackage{graphics}
\RequirePackage{hyperref}
	\hypersetup{hidelinks,
				colorlinks=true,
				breaklinks=true,
				allcolors=dr,
				bookmarksopen=false}
\RequirePackage{bookmark}
	\bookmarksetup{numbered}
\RequirePackage{url}                		% url宏包
% \RequirePackage{breakurl}           		% url折行,与url冲突
\RequirePackage[font=footnotesize,
            	labelsep=quad,
           		% labelfont={sf},
            	position=bottom,
            	figurename={图},
            	tablename={表}
            	]{caption}
\RequirePackage{subfigure}          		% 子图
\RequirePackage{tcolorbox}
\RequirePackage{array}
\RequirePackage{shapepar}
\RequirePackage{microtype}

\RequirePackage{amsmath,amsfonts,amssymb} 	% ams数学宏包
\RequirePackage[T1]{fontenc}				% 字体宏包
\RequirePackage{inputenc}
\RequirePackage[bb=ams,
				scr=rsfs]{mathalpha}		% 数学花体符号
\RequirePackage{hologo}				
\RequirePackage{extarrows}				
\RequirePackage{makecell}
% \RequirePackage[page]{totalcount}
\RequirePackage{lastpage}
\usepackage{zhnumber}

%% 字体设置
\RequirePackage[no-math]{fontspec}                  % 字体选择宏包
\RequirePackage[math-style=TeX,
            bold-style=ISO]{unicode-math}       % 数学unicode-math宏包
\setmathfont{XITS Math}                         % 设置数学字体为XITS Math
\setmathfont{XITS Math Bold}[version=bold]
\RequirePackage[fontset=\@fontset,zihao=\@fontsize]{ctex}
\ctexset{linestretch=1.245, autoindent=2\ccwd}      % 设置行距和缩进

\xeCJKsetup{PlainEquation=true}
\xeCJKsetup{CJKmath=true}
\xeCJKsetup{EmboldenFactor=2}  		            % 伪加粗程度设置为2

% 私订字体设置
\if@custom
% 中文字体设置
\setCJKmainfont[ItalicFont={方正楷体简体}]{Noto Serif CJK SC}
\setCJKmonofont{方正仿宋_GBK.ttf}
\setCJKsansfont[AutoFakeBold=true]{黑体}
% 英文字体
\setmainfont{XITS}
\setmonofont{Courier New}
\setsansfont{Arial}
\fi
% 其他字体
% \newcommand{\kaiti}{\CJKfontspec[AutoFakeBold=true]{方正楷体简体}}
% \newcommand{\xjl}{\CJKfontspec[AutoFakeBold=true]{方正细金陵简体}}
% \newcommand{\optima}{\fontspec{Optima}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                数学符号设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\everymath{\displaystyle}					% 数学为display模式
\allowdisplaybreaks[4]						% 数学公式允许跨页
% 重设\sum符号
\DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\msum}{\mathop}{largesymbols}{"50}
% 重设\pi符号
\DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
\DeclareMathSymbol{\mpi}{\mathord}{letters}{"19}
% 更新符号命令
\renewcommand{\boldsymbol}{\symbf}
\renewcommand{\mathscr}{\symscr}
% \let\pi\mpi
% \let\sum\msum

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                绘图设置 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[siunitx,RPvoltages,european]{circuitikz}  % 使用英式符号
\def\killdepth#1{{\raisebox{0pt}[\height][0pt]{#1}}}  	  % 对齐命令,保持元器件的基线一致

\RequirePackage{tikz,tikz-3dplot}
\usetikzlibrary{datavisualization}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{intersections,angles,quotes}
\usetikzlibrary {arrows.meta}
\usetikzlibrary {arrows,shapes.arrows}
\usetikzlibrary {automata,positioning}
\usetikzlibrary{datavisualization.formats.functions}
\usetikzlibrary{calc}
\tikzset{marrow/.style={>={Stealth[round]},shorten >=1pt}}

\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\usepgfplotslibrary{groupplots,dateplot}
\usetikzlibrary{patterns,shapes.arrows}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                代码环境 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings}
\lstset{
    columns=fixed,
    numbers=left,                                        % 在左侧显示行号
    frame=tb,                                            % 背景边框
    %  backgroundcolor=\color[RGB]{245,245,244},         % 设定背景颜色
    keywordstyle=\bfseries\color[HTML]{008000},          % 设定关键字颜色
    numberstyle=\scriptsize\color{darkgray},           	 % 行号颜色
    commentstyle=\it\color[HTML]{438282},                % 设置代码注释的格式
    stringstyle=\kaiti\color[HTML]{ba2121},   			 % 设置字符串格式
    showstringspaces=false,                              % 不显示字符串中的空格
    % emph={wire,reg,prod},
    % emphstyle=\color[HTML]{b00040},
    % language=verilog,                                  % 设置语言
    basicstyle=\ttfamily\small,
    % belowskip=1em,                               		 % 代码块结束间隔 
    aboveskip=1.5em,                               		 % 代码块开始间隔 
    breaklines=true,                               		 % 断行
    breakatwhitespace=true,                        		 % 在空格处断行
    captionpos=b,                                  		 % 设置标题位置
    escapeinside={(*@}{@*)}
}
\renewcommand{\lstlistingname}{程序}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                页面设置 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页眉设置
\def\studenttype#1{\gdef\@studenttype{#1}}
\def\examperiod#1{\gdef\@examperiod{#1}}
\fancyhead{}
\fancyhead[C]{\zihao{-5}\sffamily\ttbz{}{\kaishu 中山大学\@studenttype\@examperiod{}考试试卷}\ttbz}
\renewcommand{\headrulewidth}{0pt}

% PDF Title
% \hypersetup{pdftitle={中山大学\@studenttype\@examtype{}考试试卷}}

\fancyfoot[C]{\zihao{-4}\kaishu 第~{\normalfont{\thepage}}~页\quad 共~{\normalfont{\color{black}\pageref*{LastPage}}}~页} % 页脚设置

\AtBeginDocument{
	\pagenumbering{arabic}  % 使用阿拉伯数字页码
	\renewcommand{\parallel}{\mathrel{\mathpalette\new@parallel\relax}} % 重定义平行符号
	\newcommand{\new@parallel}[2]{%
		\begingroup
		\sbox\z@{高度}% get the height of an uppercase letter
		\resizebox{!}{\ht\z@}{\raisebox{\depth}{$\m@th#1/\mkern-10mu/$}}%
		\endgroup
	}
}

%
% 双栏显示
%
\if@twocolumn
\geometry{a3paper,landscape,twocolumn,columnsep=40mm,left=20mm,%
right=25mm,top=25mm,bottom=25mm,headheight=20mm}			   % 双栏设置
\else														   % 单栏设置
\geometry{a4paper,left=25mm,right=25mm,top=25mm,bottom=25mm, headheight=20mm}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                试卷信息 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\subject#1{\gdef\@subject{#1}}
\def\papertype#1{\gdef\@papertype{#1}}
\def\termyear#1#2{\gdef\@termyearfrom{#1}\gdef\@termyearto{#2}}
\def\term#1{\gdef\@term{#1}}
\def\school#1{\gdef\@school{#1}}
\def\examtype#1{\gdef\@examtype{#1}}
\def\examtime#1{\gdef\@examtime{#1}}
\def\numofq#1{\gdef\@numofq{#1}}

\renewcommand\maketitle{\begingroup
	\renewcommand\arraystretch{1.5}
	\renewcommand{\baselinestretch}{1.5}
	\begin{center}
		{\zihao{2}
		\textbf{中山大学\@studenttype\@examperiod{}考试}

		\vspace{1em}}
		
		{\zihao{3}
		\textbf{考试科目:《\@subject{}》(\@papertype{}卷)}}
	\end{center}
	\bigskip
	\noindent{\kaishu
	\begin{tabular*}{\linewidth}{p{0.114\linewidth}p{0.386\linewidth}p{0.114\linewidth}p{0.386\linewidth}}
		学年学期: 			   &\nfbf{\@termyearfrom}--\nfbf{\@termyearto}学年第\nfbf{\@term}学期 & 姓\hspace{2em}名: & \xsxx \\
		学\hspace{0.7em}院/系: & \@school 														 & 学\hspace{2em}号: & \xsxx\\
		考试方式:              &\@examtype 													     & 年级专业:         & \xsxx\\
		考试时长:              &\nfbf{\@examtime}分钟                                            & 班\hspace{2em}别: & \xsxx\\
	\end{tabular*}}

	\vspace{1.5em}
	\alarm
	\vspace{2.5em}

	\noindent
	\tikz[remember picture, overlay]{\node[outer sep=0pt,inner sep=0pt] (N) at (0.5\linewidth,0) {%
	\colorbox{gray!50}{\kaishu\zihao{5} 以下为试题区域{\normalfont ,}共$\@numofq$道大题{\normalfont ,}总分\nf{100}分{\normalfont ,}考生请在答题纸上作答}};
	\draw (N.west)--+(-2.44,0) (N.east)--+(2.5,0);}
	\vspace{2.5em}
\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              试题、解答环境定义 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{Group}
\newcounter{Question}
\newcounter{Example}
\newcounter{Exercise}
\newcounter{Method}[Question]

\newif\if@showscore
\@showscorefalse
\newif\if@showskip
\@showskipfalse
\newif\if@showparen
\@showparenfalse
\newif\if@resetcounter
\@resetcounterfalse
\newlength{\myvertspace}


% 定义题组环境
\newenvironment{groups}{
	\if@list
		\list{\normalsize\heiti\chinese{Group}、}{\usecounter{Group}}
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
}

% 定义新增题组命令
\newcommand{\group}[2]{
	\if@list
		\item\normalsize \hspace{-0.5em}\heiti{#1}(\kaishu #2) \normalfont\par
	\else
		\stepcounter{Group}
		\par \heiti{\par \chinese{Group} 、#1} ({\kaishu #2}) \normalfont \normalsize \par
	\fi

}

% 定义试题环境
\newenvironment{questions}[1][]{
	\@tfor \@opt :=#1\do
		{\if\@opt s\global\@showscoretrue\fi
		 \if\@opt t\global\@showskiptrue\fi
	 	 \if\@opt p\global\@showparentrue\fi
 	 	 \if\@opt r\global\@resetcountertrue\fi}
  	\if@resetcounter
  		\setcounter{Question}{0}
	 \fi
	\if@list
		\list{\arabic{Question}.}{\setlength{\leftmargin}{0pt}} % 修改\leftmargin{<距离>}中的参数即可修改缩进距离
	\else
		\par \begingroup \par
	\fi
}{
	\if@list
		\endlist
	\else
		\par \endgroup \par
	\fi
	
	\global\@showscorefalse
	\global\@showskipfalse
	\global\@showparenfalse
	\global\@resetcounterfalse
}

% 定义新增试题命令
\newcommand{\question}[1][0]{
	\stepcounter{Question}
	\if@list
		\item \if@showscore \kaishu (#1{}分) \normalfont \fi
	\else
		\vspace{2mm}

		\arabic{Question}. 
		\if@showscore \kaishu (#1{}分) \normalfont \fi
	\fi
}

% 定义新增例题命令
\newcommand{\example}[1][0]{
	\stepcounter{Example}
	\if@list
		\item[例题\arabic{Example}. ]
		\if@showscore \kaishu (#1{}分) \normalfont \fi
	\else
		\vspace{2mm}
		\par 例题\arabic{Example}. 
		\if@showscore \kaishu (#1{}分) \normalfont \fi
	\fi
}

% 定义新增习题命令
\newcommand{\exercise}[1][0]{
	\stepcounter{Exercise}
	\if@list
		\item[习题\arabic{Exercise}. ]
		\if@showscore \kaishu (#1{}分) \normalfont \fi
	\else
		\vspace{2mm}
		\par 习题\arabic{Exercise}. 
		\if@showscore \kaishu (#1{}分) \normalfont \fi
	\fi
}

% 定义小问环境
\newlist{subquestions}{enumerate}{2}
\setlist[subquestions,1]{label=(\arabic*)}
\setlist[subquestions,2]{label=(\roman*)}

% 定义小问答案环境
\newlist{subsolutions}{enumerate}{2}
\setlist[subsolutions,1]{label=(\arabic*)}
\setlist[subsolutions,2]{label=(\roman*)}

% 定义新增小问命令
\newcommand{\subquestion}[1][0]{\item \if@showscore \kaishu (#1{}分) \normalfont \fi} 

% 定义新增小问答案命令
\newcommand{\subsolution}[1][0]{\item} 

\newenvironment{solution}[1][0cm]{
	\setlength{\myvertspace}{#1}
	\par \if@printanswers \color{dr} \par \begingroup  \else \if@showskip \vspace*{\myvertspace} \fi \setbox\z@\vbox\bgroup\fi \normalfont
}{
	\par \if@printanswers \endgroup \else \egroup \fi \par 
}

\newcommand{\hint}{
	\par \normalfont\textbf{提示}\quad \normalfont
}
\newcommand{\method}{
	\stepcounter{Method}
    \textbf{解法\chinese{Method}}\quad
}
	
\newcommand{\answer}{
	\par \normalfont \textbf{答案}\quad \normalfont
}

% \newcommand{\answers}{
% 	\par \normalfont \textbf{解}\quad \normalfont
% }
\newcommand{\answers}[1][解]{
	\par \normalfont \makebox[0pt][r]{\textbf{#1\:}}\sj\ignorespaces
}
\newcommand{\subanswers}[1][解]{
	\normalfont \makebox[0pt][r]{\textbf{#1\qquad}}\ignorespaces
}

\newcommand{\proofover}{\hfill$\square$}

\newcommand{\analysis}{
	\par \normalfont \textbf{解析}\quad \normalfont
}

\newcommand{\thought}{
	\par \normalfont \textbf{分析}\quad \normalfont
}

\newcommand{\remark}[1][注]{
	\par \normalfont \textbf{#1}\quad \normalfont
}

\def\cdotfill{%
  \leavevmode
  \cleaders \hb@xt@ .44em{\hss\hbox{$\cdot$}\hss}\hfill
  \kern\z@}
\newcommand{\score}[2]{
	\cdotfill \kaishu\small 本步骤{}#1{}分,累计{}#2{}分\normalfont\normalsize
	\par}
\newcommand{\scoreremark}[1]{
	\cdotfill \kaishu\small #1
	\normalfont\normalsize
	\par}
\newcommand{\equscore}[3]{\par\hfill #1 \score{#2}{#3}}
\newcommand{\equscoreremark}[2]{\par\hfill #1 \scoreremark{#2}}

\makeatletter
\newcommand{\build}[2]{\leavevmode
	\count@=\z@ \toks@={}%
	\loop\ifnum\count@<\numexpr#1\relax
	\toks@=\expandafter{\the\toks@#2}%
	\advance\count@\@ne
	\repeat
	\the\toks@}
\makeatletter

\newlength{\keylength}
\newcommand{\key}[1]{
	\if@printanswers
	\underline{\color{dr}~~#1~~}
	\else
	\settowidth{\keylength}{~~#1~~}
	\build{13}{\hskip1sp\kern-1sp\hbox to 0.1\keylength{\hrulefill}}
	\fi}
\newcommand{\pkey}[1]{
	\if@printanswers
	({\color{dr}~#1~})
	\else
	\kh
	\fi}

\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\choicelengthe}
\newlength{\maxlength}
\newlength{\chiocelinewidth}
\setlength{\chiocelinewidth}{0.93\textwidth}

% 选择题括号
\newcommand{\kh}[1][1]{(\hspace{#1em})}
% 填空题横线
\newcommand{\hx}[1][4]{\,\rule[-2.85pt]{#1em}{0.5pt}}

% 三个选项
\newcommand{\threechoices}[3]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}

	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\chiocelinewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
		\end{tabularx}
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.5\chiocelinewidth}p{0.5\chiocelinewidth}}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & \\
			\end{tabular*}
		}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ &\\ 
			\end{tabular*}
		}
	}
	\unskip \unskip 
}

% 四个选项
\newcommand{\fourchoices}[4]{
	\if@showparen \dotfill (\qquad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}
	\ifthenelse{\lengthtest{\maxlength>0.45\linewidth}}
	{	
		\begin{tabularx}{\chiocelinewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
		\end{tabularx}
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.25\linewidth}}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.5\chiocelinewidth}p{0.5\chiocelinewidth}}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
			\end{tabular*}
		}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~\\ 
			\end{tabular*}
		}
	}
	\unskip \unskip 
}

% 五个选项
\newcommand{\fivechoices}[5]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{E.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\chiocelinewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
		\end{tabularx}
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.5\chiocelinewidth}p{0.5\chiocelinewidth}}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ &         \\
			\end{tabular*}
		}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#5~~~  &          &          &          \\
			\end{tabular*}
		}
	}
	\unskip \unskip 
}

% 六个选项
\newcommand{\sixchoices}[6]{
	\if@showparen \hfill \dotfill (\quad) \fi
	\par
	\settowidth{\choicelengtha}{A.~#1~~~}
	\settowidth{\choicelengthb}{B.~#2~~~}
	\settowidth{\choicelengthc}{C.~#3~~~}
	\settowidth{\choicelengthd}{D.~#4~~~}
	\settowidth{\choicelengthe}{D.~#5~~~}
	\ifthenelse{\lengthtest{\choicelengtha>\choicelengthb}}{\setlength{\maxlength}{\choicelengtha}}{\setlength{\maxlength}{\choicelengthb}}
	\ifthenelse{\lengthtest{\choicelengthc>\maxlength}}{\setlength{\maxlength}{\choicelengthc}}{}
	\ifthenelse{\lengthtest{\choicelengthd>\maxlength}}{\setlength{\maxlength}{\choicelengthd}}{}	\ifthenelse{\lengthtest{\choicelengthe>\maxlength}}{\setlength{\maxlength}{\choicelengthe}}{}
	
	\ifthenelse{\lengthtest{\maxlength>0.4\linewidth}}
	{
		\begin{tabularx}{\chiocelinewidth}{X}
			\setlength\tabcolsep{0pt}
			A.~#1~~~\\
			B.~#2~~~\\
			C.~#3~~~\\
			D.~#4~~~\\
			E.~#5~~~\\
			F.~#6~~~\\
		\end{tabularx}
	}
	{
		\ifthenelse{\lengthtest{\maxlength>0.2\linewidth}}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.5\chiocelinewidth}p{0.5\chiocelinewidth}}
				A.~#1~~~ & B.~#2~~~\\
				C.~#3~~~ & D.~#4~~~\\
				E.~#5~~~ & F.~#6~~~\\
			\end{tabular*}
		}
		{	\tabcolsep=0.0mm
			\begin{tabular*}{\chiocelinewidth}{p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}p{0.25\chiocelinewidth}}
				A.~#1~~~  & B.~#2~~~ & C.~#3~~~ & D.~#4~~~ \\
				E.~#2~~~  & F.~#6~~~ &          &          \\
			\end{tabular*}
		}
	}
	\unskip \unskip 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 自定义命令
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ttbz}{\raisebox{-2pt}{\tikz{
  \clip (0,0) rectangle (1.04em,1.14em);
  \fill[black] (0.52em,0) rectangle ++(0.5em,1.14em) 
  node[above right=0pt,inner sep=0pt,outer sep=-0.02pt] at (0,0) {▒}
  node[above right=0pt,inner sep=0pt,outer sep=-0.02pt] at (0.52em,0) {\color{white}▒} 
  ;}}}
\newcommand{\alarm}{\noindent\tikz[baseline]{\node at (0,0){
	\makebox{\begin{tcolorbox}[colback=gray!50,
	  colframe=gray!90,
	  width=1.8cm,
	  height=1cm,
	  arc=1mm, auto outer arc,
	  boxrule=1pt,
	  left=2mm,
	  right=2mm]
	\centering\vspace{-3pt}\fontsize{16.06pt}{0pt}\selectfont\textsf{警示}
	\end{tcolorbox}}}
	node[right] at (1cm,0) {\fangsong 《中山大学授予学士学位工作细则》第八条:“考试作弊者\nf{,}不授予学士学位.”};}}
\newcommand{\hc}[1]{\textbf{\textsf{#1}}}  							  % 加粗sf黑体
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\newcommand{\longline}{\noindent\hrulefill}
\newcommand{\zm}{\textbf{证明}\quad}
\newcommand{\jie}{\textbf{解}\quad}
\newcommand{\dr}[1]{{\color{dr}#1}}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}  % 表格内换行居中
\newcommand{\nfbf}[1]{{\normalfont\textbf{#1}}}
\newcommand{\xsxx}{\rule[-3pt]{0.75\linewidth}{1pt}}
\newcommand{\nf}[1]{{\normalfont #1}}
\newcommand{\ver}[2]{\noindent\textbf{#1}\hfill#2}
\newcommand{\todo}{\textbf{Todo List}}
\newcommand{\miktex}{MiK\TeX}
\newcommand{\texlive}{\TeX{}Live}
\newcommand{\ml}[2]{\noindent\texttt{#1}\par #2\par}
\newcommand{\mt}[1]{$\text{\texttt{#1}}$}
\newcommand{\sj}{\hspace{2\ccwd}}
\newcommand{\lk}[1][4pt]{\setlength{\arraycolsep}{#1}}

\newcommand*{\dif}{\mathop{}\!\mathrm{d}}
\newcommand{\T}{^\top}

\endinput
