\ProvidesClass{k-cv}[2015/11/29 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% to avoid warnings, copy only one symbol from stmaryrd
\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{$\rightarrowtriangle$}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{gray}{.2}
\definecolor{gray}{gray}{.35}
\definecolor{lightgray}{gray}{.35}

\definecolor{c1}{HTML}{0173b2}
\definecolor{c2}{HTML}{de8f05}
\definecolor{c3}{HTML}{029e73}
\definecolor{c4}{HTML}{d55e00}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{microtype}
\RequirePackage[default]{lato}

\newcommand{\bodyfont}{\fontseries{l}\selectfont}
\newcommand{\thinfont}{\fontseries{el}\selectfont}
\newcommand{\headingfont}{\fontseries{b}\selectfont}

\RequirePackage[none]{hyphenat} % No hyphenation

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
minimum height=3cm, yshift=0.5mm] (box) at (current page.north){};
    \node [anchor=center, yshift=0.3cm] (name) at (box) {%
      \fontsize{48pt}{72pt}\color{header}%
      {\bodyfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{18pt}{24pt}\color{header}%
      \bodyfont #3%
    };
  \end{tikzpicture}
  \vspace{1.5cm}
  \vspace{-2\parskip}
}

\newcommand{\smallheader}[2]{%
  \newgeometry{left=2.5cm,top=2cm,right=2.5cm,bottom=2cm}
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth,
minimum height=2cm, yshift=0.5mm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{24pt}{36pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
  \end{tikzpicture}
  \vspace{0.2cm}
  \vspace{-2\parskip}

}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        c1\or%
        c2\or%
        c3\or%
        c4\or%
        c1\or%
        c2\or%
        c3\or%
        c4\or%
        c1\or%
        c2\else%
        c3\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par
  {%
    \LARGE\headingfont\color{headercolor}%
    #1%
    \par
  }
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty} % removes page number

% Set up the custom unordered list.
\newcommand{\cvlist}{%
	\rightmargin=0in
	\leftmargin=0.15in
	\topsep=0em
	\partopsep=0pt
	\itemsep=0ex
	\parsep=0pt
	\itemindent=0\leftmargin
	\listparindent=0\leftmargin
	\settowidth{\labelsep}{~}
}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}p{2cm}l}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
\hangindent=3mm \hangafter1%
  {\leavevmode\color{gray}\small #1}&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\color{gray} \bodyfont #3}\\%
    \bodyfont #4\vspace{\parsep}%
  }\\}

\newcommand{\entrythree}[3]{%
\hangindent=3mm \hangafter1%
  {\leavevmode\color{gray}\small #1}&\parbox[t]{11.8cm}{%
    \bodyfont #2%
    \hfill%
    {\footnotesize\color{gray} \bodyfont #3}%
  }\\}

\newcommand{\centry}[4]{%
	\hangindent=3mm \hangafter1%
	{\leavevmode\color{gray}\small #1}&\parbox[t]{14.0cm}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize\color{gray} \bodyfont #3}\\%
		\bodyfont #4\vspace{\parsep}%
	}\\}

\newcommand{\centrythree}[3]{%
	\hangindent=3mm \hangafter1%
	{\leavevmode\color{gray}\small #1}&\parbox[t]{14.0cm}{%
		\bodyfont #2%
		\hfill%
		{\footnotesize\color{gray} \bodyfont #3}%
	}\\}

%%%%%%%%%%%%%%%%%%%%%%%
% Manual Bibliography %
%%%%%%%%%%%%%%%%%%%%%%%

% each item is a manual entry, since a bibfile is more pain than pleasure
% for most people's CVs.
\newcommand{\bibentry}[5]{%
  {\bodyfont #1}\\%
  \hangindent=5mm \hangafter1%
  {\color{black} \bodyfont \emph{#2}\\%
  {\footnotesize \bodyfont #3}\\%
  {\bodyfont #4}\\%
  {\footnotesize \bodyfont #5}}%
  }%

\newcommand{\bibun}[4]{%
  {\bodyfont #1}\\%
  \hangindent=5mm \hangafter1%
  {\color{black} \bodyfont \emph{#2}\\%
  {\footnotesize \bodyfont #3}\\%
  {\bodyfont #4}}%
  }%

\newcommand{\bibuf}[4]{%
	{\bodyfont #1}\\%
	\hangindent=5mm \hangafter1%
	{\color{black} \bodyfont \emph{#2}\\%
	{\footnotesize \bodyfont #3}\\%
	{\footnotesize \bodyfont #4}}%
}%

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \vspace{5mm}{\Large\headingfont\color{headercolor} ##1 \vspace{\parskip}}
  }

  \begin{textblock}{4.0}(1.1, 3)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\definecolor{linkcol}{HTML}{044A75}
\hypersetup{
	colorlinks,
	linkcolor= {linkcol},
	urlcolor={linkcol}}
