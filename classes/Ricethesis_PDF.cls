% Ricethesis_PDF.cls
% 06-Mar-2011
% Author: Gareth B Middleton (gbmidd@gmail.com)
% Generates a thesis formatted according to the guidelines set forth by the graduate committe of Rice University
% Works only with pdflatex or pdfetex
%
% March, 2015
% Modified by Manjari Narayan

% Use the "book" style to get good page headings and numbering.  Letter paper is required for Rice theses.
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tufte-book}}

\ProcessOptions\relax
%\LoadClass[pdftex, letterpaper]{book}
%\LoadClass[justified,twoside]{tufte-book}
\LoadClass[letterpaper,12pt,leqno,openbib]{memoir} %\documentclass[a4paper,12pt,leqno,openbib]{memoir}

% A bunch of useful packages are included.  You can choose either eucal or amsmath.  I update this to use graphicx
% instead of graphics.  I commented out natbib usepackages to use the IEEE bibstyle

\usepackage[english]{babel}
\usepackage[usenames, dvipsnames]{color}
%\usepackage[perpage]{footmisc} %%% doesn't seem to be working - Manjari N.
\usepackage{setspace}
\usepackage{graphicx}
% Created a linked document: all references and labels tie together in the pdf, but in black (you can change this)
\usepackage[pdftex,
			pdfpagelayout = TwoPageRight,
			pdfpagemode = UseOutlines,
			bookmarks,
			bookmarksopen = true,
			bookmarksnumbered = true,
			breaklinks = true,
			linktocpage,
			backref,
			colorlinks = true,
			linkcolor = blue,
			urlcolor  = blue,
			citecolor = blue,
			anchorcolor = green,
			hyperindex = true,
			hyperfigures]{hyperref}


% Bibliography options
\usepackage[authoryear,sort&compress,longnamesfirst]{natbib}
%\usepackage{chapterbib} % Compatible with natbib. Turn on sectionbib option.
\bibliographystyle{apalike}

% Margins and Borders
% Configure margins according to the Rice guidelines:
% Left: 1.5 in
% Top, right, bottom: 1 in
\setlength{\hoffset}{-0.25in}
\setlength{\oddsidemargin}{.75in}
\setlength{\marginparwidth}{.75in}
\setlength{\marginparsep}{0in}
\setlength{\textwidth}{6in}

\setlength{\voffset}{-.25in}
\setlength{\topmargin}{0in}
\setlength{\headheight}{0.25in}
\setlength{\headsep}{0.25in}
\setlength{\textheight}{8.75in}
\setlength{\footskip}{0in}

% % Commented out fancyhdr due to known conflicts with memoir
% % Define the page header style (the line across the top)
% \usepackage{fancyhdr}
% \pagestyle{fancy}
% \fancyhf{}
% \fancyhead[RO]{\bfseries\rightmark}
% \fancyhead[LE]{\bfseries\leftmark}
% \fancyhead[R]{\thepage}
% \renewcommand{\headrulewidth}{0.5pt}
% \renewcommand{\footrulewidth}{0pt}
% \fancypagestyle{plain}{
%   \fancyhead{}
%   \renewcommand{\headrulewidth}{0pt}
% }

% If using memoir
\newcommand{\onehalfspacing}{\OneHalfSpacing}
\newcommand{\doublespacing}{\DoubleSpacing}
\newcommand{\singlespacing}{\SingleSpacing}



% Chapter Style
% Font with math support: New Century Schoolbook
%\usepackage{fouriernc}
\usepackage{tgpagella} % but use tgpagella as main font
\usepackage[T1]{fontenc}
% Included slanted font for tgpagella
\DeclareFontShape{T1}{qpl}{m}{sl} { <-> ssub * qpl/m/it }{}
\DeclareFontShape{T1}{qpl}{b}{sl} { <-> ssub * qpl/b/it }{}
\usepackage{helvet}
\usepackage[english]{babel} % choose the language

% Font with mathpazo support:
\usepackage[sc]{mathpazo} % use mathpazo for math fonts
 %\usepackage[scaled=0.75]{luximono}


% Use titlesec, overrides memoir:
%
% \usepackage[small,compact]{titlesec}
%
% Chapter modifications. Rice prefers small chapter titles
\setlength{\midchapskip}{5pt}
  \setlength{\afterchapskip}{2\baselineskip} %%%%%%%%% MOD: WAS 5\baselineskip
  \setlength{\beforechapskip}{18pt}%    \headindent %%%%%%% MOD: WAS 36pt
% Section modifications:
\setsecheadstyle{\Large \scshape\raggedright}
\setsubsecheadstyle{\large\scshape\raggedright}
\setsubsubsecheadstyle{\normalsize\scshape\raggedright}
\setbeforesecskip{-2.5ex plus -.5ex minus -.2ex}
\setaftersecskip{.5ex plus -.5ex minus -.2ex}
\setbeforesubsecskip{-2ex plus -.5ex minus -.2ex}
\setaftersubsecskip{.2 ex plus .2ex}

%\setbeforesecskip{-1.5ex plus -.5ex minus -.2ex}
%\setaftersecskip{1.3ex plus .2ex}
%\setbeforesubsecskip{-1.25ex plus -.5ex minus -.2ex}
%\setaftersubsecskip{1ex plus .2ex}

\usepackage{calc,color,soul,fourier}
% DropCap
%An initial of the very first character of the content
%\definecolor{gray}{rgb}{.7,.7,.7}
\definecolor{gray}{RGB}{94,96,98} % Rice Gray
\definecolor{riceblue}{RGB}{0,36,106} % Rice Blue
\usepackage{lettrine}
\newcommand{\initial}[1]{%
	\lettrine[lines=3,lhang=0.33,nindent=0em]{
		\color{gray}
     		{\textsc{#1}}}{}}
%%%%%%%%%%%%%%%%%%
\makeatletter
\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
	\sbox\feline@chapter{%
		\resizebox{!}{#1}{\fboxsep=1pt%
			\colorbox{gray}{\color{white}\thechapter}%
		}}%
		\rotatebox{90}{%
			\resizebox{%
				\heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
			{!}{\scshape\so\@chapapp}}\quad%
		\raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
	\sbox\feline@chapter{\feline@chapter@marker[#1]}%
	\makebox[0pt][c]{% aka \rlap
		\makebox[.5cm][r]{\usebox\feline@chapter}%
	}}
\makechapterstyle{daleifmodif}{
	\renewcommand\chapnamefont{\normalfont\large\scshape\raggedleft\so}
	\renewcommand\chaptitlefont{\normalfont\Large\bfseries\scshape}
	\renewcommand\chapternamenum{} \renewcommand\printchaptername{}
	\renewcommand\printchapternum{\null\hfill\feline@chm[2cm]\par}
	\renewcommand\afterchapternum{\par\vskip\midchapskip}
	\renewcommand\printchaptertitle[1]{\color{gray}\chaptitlefont\raggedleft ##1\par}
}
%%\makeatother
%%\chapterstyle{daleifmodif}

%\usepackage{color,calc,graphicx,soul,fourier}
\definecolor{nicered}{rgb}{.647,.129,.149}
%\makeatletter
%\newlength\dlf@normtxtw
%\setlength\dlf@normtxtw{\textwidth}
%\def\myhelvetfont{\def\sfdefault{mdput}}
%\newsavebox{\feline@chapter}
%\newcommand\feline@chapter@marker[1][4cm]{%
%\sbox\feline@chapter{%
%\resizebox{!}{#1}{\fboxsep=1pt%
%\colorbox{riceblue}{\color{white}\bfseries\sffamily\thechapter}%
%}}%
%\rotatebox{90}{%
%\resizebox{%
%\heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
%{!}{\scshape\so\@chapapp}}\quad%
%\raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
%}
%\newcommand\feline@chm[1][4cm]{%
%\sbox\feline@chapter{\feline@chapter@marker[#1]}%
%\makebox[0pt][l]{% aka \rlap
%\makebox[1cm][r]{\usebox\feline@chapter}%
%}}
%\makechapterstyle{daleif1}{
%\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}
%\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{gray}}
%\renewcommand\chapternamenum{}
%\renewcommand\printchaptername{}
%\renewcommand\printchapternum{\null\hfill\feline@chm[2cm]\par}
%\renewcommand\afterchapternum{\par\vskip\midchapskip}
%\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}
%}
%\makeatother
%\chapterstyle{daleif1}


% DECLARATIONS

% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The committee and its affiliations, up to five of them
\def\comchair#1{\gdef\@comchair{#1}}
\def\comchairaffil#1{\gdef\@comchairaffil{#1}}
\def\comtwo#1{\gdef\@comtwo{#1}}
\def\comtwoaffil#1{\gdef\@comtwoaffil{#1}}
\def\comthree#1{\gdef\@comthree{#1}}
\def\comthreeaffil#1{\gdef\@comthreeaffil{#1}}
\def\comfour#1{\gdef\@comfour{#1}}
\def\comfouraffil#1{\gdef\@comfouraffil{#1}}
\def\comfive#1{\gdef\@comfive{#1}}
\def\comfiveaffil#1{\gdef\@comfiveaffil{#1}}

% Insert PDF information
\pdfcatalog { /PageMode (/UseOutlines)
              /OpenAction (fitbh)  }

% Define title page layout according to Rice guidelines.  Auto-space everything.
\renewcommand{\maketitle}{%
	\thispagestyle{empty}{%
	% Parbox for the top title section.  Wrap
	\flushleft
	\parbox[][3in][s]{6in}{%
		% Use the header on this page
		{\vspace{-.25in} \par}
		\centering
			\includegraphics[height=.25in]{DocGraphics/RUType_Blue.jpg}\\
			%{\large \textsc{Rice University} \par}
			\vspace*{\fill}
			{\large \bfseries {\@title} \par}
			\vspace*{\fill}
			{by \par}
			\vspace*{\fill}
			{\large \bfseries {\@author} \par}
			\vspace*{\fill}
			{\large \textsc{A Thesis Submitted in Partial Fulfillment of the \\ Requirements for the Degree} \par}
			\vspace*{\fill}
			{\large \bfseries {\@degree} \par}
	}

	\vspace{-.1in}

	% Flush signatures down the RHS
	\flushright
	\parbox[][5in][s]{3.5in}{%
		\vspace*{\fill}
		\textsc{Approved, Thesis Committee:}
		\vspace*{\fill}

		% Committee Chair
		\hrule
		\vspace*{0.1in}
		\@comchair, \emph{Chair} \par
		\@comchairaffil \par
		\vspace*{\fill}

		% Second Member
		\hrule
		\vspace*{0.1in}
		\@comtwo \par
		\@comtwoaffil \par
		\vspace*{\fill}

		% Third member
		\hrule
		\vspace*{0.1in}
		\@comthree \par
		\@comthreeaffil \par
		\vspace*{\fill}

		%If a fourth member is defined:
		\ifx \@comfour \undefined
		\else
			% Fourth member
			\hrule
			\vspace*{0.1in}
			\@comfour \par
			\@comfouraffil \par
			\vspace*{\fill}

			% Fifth member, if defined
			\ifx \@comfive \undefined
			\else
			\hrule
			\vspace*{0.1in}
			\@comfive \par
			\@comfiveaffil \par
			\vspace*{\fill}

			\fi
		\fi
	}

	% Houston and degree date
	\parbox[][.25in][s]{6in}{%
		\vspace*{\fill}
		{\centering
		\textsc{Houston, Texas} \par
		\textsc{\@degreedate} \par
		}
		\vspace*{\fill}
	}
}}

% DEDICATION

% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.  It's not clear if
% Rice permits a dedication, so use at your own risk.

\newenvironment{dedication}{%
  \newpage
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center} \begin{em}}
{\end{em} \end{center} \end{quote}}


% ACKNOWLEDGEMENTS

% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}{%
\newpage
\thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\large \textsc {Acknowledgements}}
\addcontentsline{toc}{chapter}{Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quotation}}
{\end{quotation}}

%ABSTRACT

%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstractchap}{%
  \newpage
  \thispagestyle{empty}
  \begin{center}
  \vspace*{0in}
  \onehalfspacing
  {\large \textsc {Abstract}} \par
  \vspace*{0.25in}
  \@title \par
  \vspace*{0.25in}
  by \par
  \vspace*{0.25in}
  \@author \par
  \end{center}
  \addcontentsline{toc}{chapter}{Abstract}
  \doublespacing
  \vspace{0.25in}
  \begin{quotation}}
{\end{quotation}\thispagestyle{empty}}

%ROMANPAGES

% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%% Uncomment if not using memoir package
%% Chapter heading definitions
%
%\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
%\def\@makechapterhead#1{%
%  \vspace*{10\p@}%
%  {\parindent \z@ \raggedleft \reset@font
%            \scshape \@chapapp{} \thechapter
%        \par\nobreak
%        \interlinepenalty\@M
%    \Large \bfseries #1\par\nobreak
%    %\vspace*{1\p@}%
%    \hrulefill
%    \par\nobreak
%    \vskip 100\p@
%  }}
%\def\@makeschapterhead#1{%
%  \vspace*{10\p@}%
%  {\parindent \z@ \raggedleft \reset@font
%            \scshape \vphantom{\@chapapp{} \thechapter}
%        \par\nobreak
%        \interlinepenalty\@M
%    \Large \bfseries #1\par\nobreak
%    %\vspace*{1\p@}%
%    \hrulefill
%    \par\nobreak
%    \vskip 100\p@
%  }}
