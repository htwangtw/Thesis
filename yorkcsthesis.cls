% yorkcsthesis.cls
% LaTeX template for University of York theses
% as specified in Regulation 2.8 'Theses submitted for higher degrees' (based on ISO 4821:1990)
% Contains elements of M. Imran's template for University of Durham, Department of Mathematics
%
% To use this class, specify:
% \documentclass{yorkcsthesis}
% Options you can specify:
%  Font size: 10pt, 11pt, 12pt (default is 11pt)
%  Paper sides: oneside, twoside (default is twoside)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yorkcsthesis}

% Class options for font size; default is 11pt
\newcommand\@yorkcsthesisptsize{11pt}
\DeclareOption{10pt}{\renewcommand\@yorkcsthesisptsize{10pt}}
\DeclareOption{11pt}{\renewcommand\@yorkcsthesisptsize{11pt}}
\DeclareOption{12pt}{\renewcommand\@yorkcsthesisptsize{12pt}}

% Class options for number of paper sides; default is one-sided paper
\newcommand\@yorkcsthesispapersides{twoside}
\DeclareOption{oneside}{\renewcommand\@yorkcsthesispapersides{oneside}}
\DeclareOption{twoside}{\renewcommand\@yorkcsthesispapersides{twoside}}

% Derive our yorkcsthesis class from the 'book' base class; we always use A4 paper
\ProcessOptions
\LoadClass[\@yorkcsthesisptsize,\@yorkcsthesispapersides,a4paper]{book}

% Page margins and sizes as specified in Regulation 2.8 'Theses submitted for higher degrees' (based on ISO 4821:1990)
% A4 paper size is 210x297mm
\setlength{\voffset}{-1in} % undo the extra inch added by default by LaTeX
\setlength{\marginparsep}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparpush}{0mm}
\setlength{\hoffset}{-1in} % undo the extra inch added by default by LaTeX
\setlength{\oddsidemargin}{38mm}
\setlength{\evensidemargin}{38mm}
\setlength{\textwidth}{134mm}
\setlength{\topmargin}{15mm}
\setlength{\headheight}{15pt}
\setlength{\headsep}{16pt}
\setlength{\textheight}{238mm}
\setlength{\footskip}{18pt}

% Set default line spacing to the ugly but mandatory 1.5x
\renewcommand{\baselinestretch}{1.5}
\normalsize

% Stop footnotes being split across multiple pages
\interfootnotelinepenalty=10000

% Some useful symbols not defined in standard LaTeX
% Mean Integral: mint
% to be used in displaystyle
\def\mint{\textstyle\mints\displaystyle}
% to be used in textstyle
\def\mints{\int\!\!\!\!\!\!{\rm-}\ }
%
% Mean Sum: msum
% to be used in displaystyle
\def\msum{\textstyle\msums\displaystyle}
% to be used in textstyle
\def\msums{\sum\!\!\!\!\!\!\!{\rm-}\ }

% Bold font in math mode
\def\bv#1{\mbox{\boldmath$#1$}}

% New counter -  can have the equation number 4.2.1a for example
\newcounter{ind}
\def\eqlabon{
\setcounter{ind}{\value{equation}}\addtocounter{ind}{1}
\setcounter{equation}{0}
\renewcommand{\theequation}{\arabic{chapter}%
         .\arabic{section}.\arabic{ind}\alph{equation}}}
\def\eqlaboff{
\renewcommand{\theequation}{\arabic{chapter}%
         .\arabic{section}.\arabic{equation}}
\setcounter{equation}{\value{ind}}}

% Space between the main text and the start of footnote
\addtolength{\skip\footins}{5mm}

% Stop fancyhdr scribbling junk on pages that should be empty
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage

% Title page
\newcommand*{\department}[1]{\def\departmenttext{#1}}
\newcommand*{\degree}[1]{\def\degreetext{#1}}
\newcounter{volume}
\newcounter{totalvolumes}
\renewcommand{\maketitle}{%
 \begin{titlepage}
  \null\vfil
  \vskip 60\p@
  \begin{center}
   \vspace*{3cm}
   {\Huge\bf \@title}

   % don't mention volumes at all unless user specifies >0 in the totalvolumes counter
   \ifthenelse {\not\equal{\value{totalvolumes}}{0}}
   {
    \vspace*{1cm}
    {Volume \arabic{volume} of \arabic{totalvolumes}}
   }
   {
    % nothing!
   }

   \vspace*{2cm}
   {\large \bf \@author}

   \vfill

   {\large \degreetext}
   \vspace*{0.9cm}

   {\large University of York\\
           [-0mm]  {\large \departmenttext}\\
   }

   \vspace*{0.8cm}
   {\large \@date}

  \end{center}
  \par
  \vfil\null%
 \end{titlepage}%
}

% Dedication
\newcommand*{\dedication}[1]{\def\dedicationtext{#1}}
\newcommand{\makededication}{%
 \newpage
 \thispagestyle{empty}
 \begin{center}
  \vspace*{2cm}
   {\LARGE \it {\dedicationtext{}}}\\
 \end{center}
}

% Abstract
\newcommand*{\abstract}[1]{\def\abstracttext{#1}}
\newcommand{\makeabstract}{%
 \newpage
 \thispagestyle{empty}
 \chapter*{Abstract \@mkboth{}{}}
 \addcontentsline{toc}{chapter}{\numberline{}Abstract}
 \noindent
 \abstracttext{}
}

% Acknowledgements
\newcommand*{\acknowledgements}[1]{\def\acknowledgementstext{#1}}
\newcommand{\makeacknowledgements}{%
 \newpage
 \thispagestyle{empty}
 \chapter*{Acknowledgements \@mkboth{}{}}
 \addcontentsline{toc}{chapter}{\numberline{}Acknowledgements}
 \noindent
 \acknowledgementstext{}
}

% Abbreviations
\newcommand*{\abbreviations}[1]{\def\abbreviationstext{#1}}
\newcommand{\makeabbreviations}{%
 \newpage
 \thispagestyle{empty}
 \chapter*{Abbreviations \@mkboth{}{}}
 \addcontentsline{toc}{chapter}{\numberline{}Abbreviations}
 \noindent
 \abbreviationstext{}
}

% Declaration
\newcommand*{\declaration}[1]{\def\declarationtext{#1}}
\newcommand*{\yearstarted}[1]{\def\yearstartedtext{#1}}
\newcommand*{\yearended}[1]{\def\yearendedtext{#1}}
\newcommand{\makedeclaration}{%
 \newpage
 \thispagestyle{empty}
 \chapter*{Author's Declaration \@mkboth{}{}}
 \addcontentsline{toc}{chapter}{\numberline{}Author's Declaration}
 \label{declaration}

	\declarationtext{}

	\vfill
	\noindent \textbf{Copyright \copyright\; \yearendedtext{} by \@author}\\
	The copyright of this thesis rests with the author. Any quotations from it should be acknowledged appropriately.
}


% Table of contents
\makeatletter
\renewcommand\tableofcontents{%
 \cleardoublepage
 \addcontentsline{toc}{chapter}{\numberline{}Contents}
 \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%
 \@starttoc{toc}%
}

% List of figures
\renewcommand\listoffigures{%
 \addcontentsline{toc}{chapter}{\numberline{}List of figures}
 \chapter*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%
 \@starttoc{lof}%
}

% List of tables
\renewcommand\listoftables{%
 \addcontentsline{toc}{chapter}{\numberline{}List of tables}
 \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%
 \@starttoc{lot}%

}

% Bibliography
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname
        \@mkboth{\bibname}{\bibname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% Table Of Contents counter options
% Current settings: subsubsections are numbered on pages, but not listed in TOC
%
% \part            | -1 (book and report) 0 (article)
% \chapter         | 0 (book and report only)
% \section         | 1
% \subsection      | 2
% \subsubsection   | 3
% \paragraph       | 4
% \subparagraph    | 5
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}


  








