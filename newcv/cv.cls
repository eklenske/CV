\ProvidesClass{cv}[CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{ifthen}
\RequirePackage{graphicx}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{numcolor}{rgb}{0.5,0.5,0.5}
\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{linkblue}{RGB}{10,82,131}
\definecolor{lightgray}{HTML}{777777}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
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

%%%%%%%%%%
% MISC   %
%%%%%%%%%%

% Text formatting.
\newcommand{\foreign}[1]{\textit{#1}}
\newcommand{\etal}{\foreign{et~al.}}
\newcommand{\project}[1]{\textsl{#1}}
\definecolor{grey}{rgb}{0.5,0.5,0.5}
\newcommand{\deemph}[1]{\textcolor{grey}{\footnotesize{#1}}}

% literature links--use doi if you can
\newcommand{\doi}[2]{\emph{\addfontfeature{Color=linkblue}\href{http://dx.doi.org/#1}{{#2}}}}
\newcommand{\link}[2]{\emph{\addfontfeature{Color=linkblue}\href{#1}{{#2}}}}
\newcommand{\ads}[2]{{\addfontfeature{Color=linkblue}\href{http://adsabs.harvard.edu/abs/#1}}{{#2}}}
\newcommand{\arxiv}[2]{\emph{\addfontfeature{Color=linkblue}\href{http://arxiv.org/abs/#1}{{#2}}}}
\newcommand{\isbn}[1]{{\footnotesize(\textsc{isbn:}{#1})}}

% Journal names.
\newcommand{\aj}{AJ}
\newcommand{\apj}{ApJ}
\newcommand{\pasp}{PASP}
\newcommand{\mnras}{MNRAS}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

%\newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
%\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}

\newfontfamily\headingfont[Path=fonts/]{Lato-Bold.ttf}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path=fonts/]{Lato-Light.ttf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\newcommand{\header}{%
  {
  \vspace*{-1in}
  \hspace*{-5.125in}
  \centering
  \includegraphics[width=\paperwidth]{header.png}
  \vspace*{-0.1in}
  }
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

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

\newcommand{\pubslist}{%
    \rightmargin=0in
    \leftmargin=0.15in
    \topsep=0ex
    \partopsep=0pt
    \itemsep=1.25ex
    \parsep=0pt
    \itemindent=-1.0\leftmargin
    \listparindent=0.0\leftmargin
    \settowidth{\labelsep}{~}
}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newcommand{\aside}[3]{
    \begin{textblock}{3.6}(-4.5, #2)
        \begin{flushright}
            \section{#1}
                #3
        \end{flushright}
    \end{textblock}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor = red}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
