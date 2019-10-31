%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% uos-thesis.cls - LaTeX2e class for UoS Theses.
%% To conform to the University of Sheffield
%% Specifications (April 2016) for
%% Preparation of Master's Thesis and Doctoral Dissertations
%% Version 1.0 written by Romain Guicherd, 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uos-thesis}[2016/10/18 UoS Thesis LaTeX class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Use the class book as the base class
\newcommand{\fileversion}{1.0}
\newcommand{\filedate}{2017/01/17}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%% Load the book class
\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Required packages unmodified
\RequirePackage[inner=4cm,outer=3cm,top=4cm,bottom=3.5cm,pdftex]{geometry} % https://ctan.org/pkg/geometry
\RequirePackage{setspace} % https://ctan.org/pkg/setspace
\RequirePackage{graphicx} % https://www.ctan.org/pkg/graphicx
\RequirePackage{fancyhdr} % https://www.ctan.org/pkg/fancyhdr
\RequirePackage{natbib} % https://www.ctan.org/pkg/natbib
\RequirePackage{blindtext} % https://www.ctan.org/pkg/blindtext
\RequirePackage{hyperref} % https://www.ctan.org/pkg/hyperref
\RequirePackage[xindy]{glossaries-extra} % https://www.ctan.org/pkg/glossaries
\RequirePackage[intoc]{nomencl} % https://www.ctan.org/pkg/nomencl
\RequirePackage{etoolbox} % https://ctan.org/pkg/etoolbox
\RequirePackage{xstring} % https://ctan.org/pkg/xstring
\RequirePackage{amsmath} % https://ctan.org/pkg/amsmath
\RequirePackage{amsfonts} % https://ctan.org/pkg/amsfonts
\RequirePackage{amssymb} % https://ctan.org/pkg/amsmath
\RequirePackage{amsthm} % https://ctan.org/pkg/amsthm
\RequirePackage{stmaryrd} % https://ctan.org/pkg/stmaryrd
\RequirePackage{subdepth} % https://ctan.org/pkg/subdepth
\RequirePackage{booktabs} % https://www.ctan.org/pkg/booktabs
\RequirePackage[algo2e,ruled,noline,algochapter]{algorithm2e} % https://ctan.org/pkg/algorithm2e
\RequirePackage{tikz} % https://www.ctan.org/pkg/pgf
\usetikzlibrary{shapes,patterns,fit,matrix,calc,positioning,intersections}
\RequirePackage{pgfplots} % https://ctan.org/pkg/pgfplots
\pgfplotsset{compat=newest}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF setup
\hypersetup{
	final=true,
	pdftitle={Thesis title},
	pdfauthor={Author name},
	pdfsubject={PhD Thesis},
	pdfkeywords={keyword1, keyword2, keyword3},
	plainpages=false,
	pdfstartview=FitV,
	pdftoolbar=true,
	pdfmenubar=true,
	bookmarksopen=false,
	bookmarksnumbered=true,
	breaklinks=true,
	linktoc=all,
	colorlinks=true,
	linkcolor=black,
	urlcolor=black,
	citecolor=black,
	anchorcolor=black}
	
%% Document setup
\onehalfspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Algorithm setup
\setlength{\algoheightrule}{1.5pt}
\setlength{\algotitleheightrule}{0.5pt}

%% Tabular setup
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Glossary
\newglossarystyle{myGlossStyle}{
	\setglossarystyle{long3colheader}
	\renewcommand*{\glossaryheader}{
	\bf{Abbreviation} & \bf{Description} & \bf{Page}
	\vspace{7.5pt}
	\endhead}}
\setglossarystyle{myGlossStyle}
\setlength{\glsdescwidth}{0.6\linewidth}
\setlength{\glspagelistwidth}{0.2\linewidth}
\preto\chapter{\glsresetall}
\makeglossary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Nomenclature
\renewcommand{\nomname}{Notation}
%\patchcmd{\thenomenclature}{\chapter*}{\chapter}{}{}
\setlength{\nomlabelwidth}{3cm}
\setlength{\nomitemsep}{-\parsep}
\newcommand{\nomenclheader}[1]{
	\item[\hspace*{-\itemindent}\normalfont\bfseries#1]}
\renewcommand{\nomgroup}[1]{
	\IfStrEqCase{#1}{
	{A}{\nomenclheader{Scalar Sets}}
	{B}{\nomenclheader{Generalized Inequalities}}
	{C}{\nomenclheader{Norms}}
	{D}{\nomenclheader{Vectors \& Matrices}}
	{E}{\nomenclheader{Set Operations}}
	{F}{\nomenclheader{Topology \& Convex Analysis}}
	{G}{\nomenclheader{Combinatorial Functions}}
	{H}{\nomenclheader{Functions \& Derivatives}}
	}\bigskip}
\makenomenclature

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New commands
% Footnote command
\newcommand{\blfootnote}[1]{
	\begingroup
	\renewcommand\thefootnote{}\footnote{#1}
	\addtocounter{footnote}{-1}
	\endgroup}
	
% Graph from adjacency matrix
\newcommand{\graphfromadj}[6][arc/.try]{
	\foreach [count=\r] \row in {#3}{
		\foreach [count=\c] \cell in \row{
			\ifnum\cell>0
				\ifnum\c=\r
					\draw[arc/.try=\cell] (#2\r) edge[-, loop arc, in= #4*\r -#5 -#4*#6, out= #4*\r +#5 -#4*#6] (#2\c);
				\else
					\draw[arc/.try=\cell, #1] (#2\r) edge[-] (#2\c);
				\fi
			\fi
		}
	}
}
	
% Directed graph from adjacency matrix
\newcommand{\directedgraphfromadj}[6][arc/.try]{
	\foreach [count=\r] \row in {#3}{
		\foreach [count=\c] \cell in \row{
			\ifnum\cell>0
				\ifnum\c=\r
					\draw[arc/.try=\cell] (#2\r) edge[loop arc, in= #4*\r -#5 -#4*#6, out= #4*\r +#5 -#4*#6] (#2\c);
				\else
					\draw[arc/.try=\cell, #1] (#2\r) edge (#2\c);
				\fi
			\fi
		}
	}
}

% Weighted graph from adjacency matrix
\newcommand{\weigthedgraphfromadj}[6][draw,->]{
	\foreach [count=\r] \row in {#3}{
		\foreach [count=\c] \cell in \row{
			\ifnum\cell>0
				\ifnum\c=\r
					\draw[arc/.try=\cell] (#2\r) edge[loop arc, in= #4*\r -#5 -#4*#6, out= #4*\r +#5 -#4*#6] node[arc label/.try=\cell]{\cell} (#2\c);
				\else
					\draw[arc/.try=\cell, #1] (#2\r) edge node[arc label/.try=\cell]{\cell} (#2\c);
				\fi
			\fi
		}
	}
}

% Select points in pgfplots from 1 to 2
\pgfplotsset{select coords between index/.style 2 args={
	x filter/.code={
		num\coordindex<#1\def\pgfmathresult{}\fi
		num\coordindex>#2\def\pgfmathresult{}\fi
	}
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Renewed commands
% cleardoublepage command
\makeatletter
\renewcommand{\cleardoublepage}{
	\clearpage\if@twoside\ifodd\c@page\else
	\hbox{}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% today command
\renewcommand{\today}{\ifcase \month \or January\or February\or March\or
	April\or May \or June\or July\or August\or September\or October\or November\or
	December\fi, \number \year}

% pagestylefancy
\setlength{\headheight}{15pt}
\pagestyle{fancy}
\fancyhf{}

% chaptermark command
\renewcommand{\chaptermark}[1]{
	\markboth{#1}{}}
	
% sectionmark command
\renewcommand{\sectionmark}[1]{
	\markright{\thesection\ #1}}
	
% frontmatter command
\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
	\oldfrontmatter
	\fancyhead[RO,LE]{\thepage}
	\fancyhead[RE,LO]{\nouppercase\leftmark}
	\clearpage{\pagestyle{empty}\cleardoublepage}}

% mainmatter command
\let\oldmainmatter\mainmatter
\renewcommand{\mainmatter}{
	\oldmainmatter
	\fancyhead[RO,LE]{\thepage}
	\fancyhead[LO]{\nouppercase\rightmark}
	\fancyhead[RE]{\nouppercase\leftmark}
	\clearpage{\pagestyle{empty}\cleardoublepage}}

% backmatter command
\let\oldbackmatter\backmatter
\renewcommand{\backmatter}{
	\oldbackmatter
	\fancyhead[RO,LE]{\thepage}
	\fancyhead[RE,LO]{\nouppercase\leftmark}
	\clearpage{\pagestyle{empty}\cleardoublepage}}
	
% table of content
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\oldtableofcontents
	\addcontentsline{toc}{chapter}{\contentsname}}

% list of figures
\let\oldlistoffigures\listoffigures
\renewcommand{\listoffigures}{
	\oldlistoffigures
	\addcontentsline{toc}{chapter}{\listfigurename}}

% list of tables
\let\oldlistoftables\listoftables
\renewcommand{\listoftables}{
	\oldlistoftables
	\addcontentsline{toc}{chapter}{\listtablename}}

% references
\renewcommand{\bibname}{References}
\makeatletter
\renewcommand\bibsection{
	\chapter*{\bibname\@mkboth{{\bibname}}{{\bibname}}}
	\addcontentsline{toc}{chapter}{\bibname}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New environments
% New theorem
\newtheorem{theorem}{Theorem}[chapter]

% New lemma
\newtheorem{lemma}{Lemma}[chapter]

% New corollary
\newtheorem{corollary}{Corollary}[chapter]

% New proposition
\newtheorem{proposition}{Proposition}[chapter]

% New definition
\newtheorem{definition}{Definition}[chapter]

% New assumption
\newtheorem{assumption}{Assumption}[chapter]

% New remark
\newtheorem{remark}{Remark}[chapter]

% New example
\newtheorem{example}{Example}[chapter]

% Theorem style definition
\makeatletter
\def\th@plain{%
	\thm@notefont{}% same as heading font
	\itshape % body font
}
\def\th@definition{%
	\thm@notefont{}% same as heading font
	\normalfont % body font
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Renewed environments
% Titlepage environement
\let\oldtitlepage\titlepage
\let\endoldtitlepage\endtitlepage
\renewenvironment{titlepage}
	{\oldtitlepage \begin{center}}
	{\end{center} \endoldtitlepage \thispagestyle{empty}}
\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of file ``uos-thesis.cls''
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%