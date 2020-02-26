\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dfg}[2020/02/26 DFG-style LaTeX class]

\LoadClass[11pt,a4paper]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}% [utf8][latin1]
\RequirePackage{type1cm}% CM-Fonts including math fonts in all sizes. Repairs 'Font shape OML/cmm/m/it in size <...> not available'.
\RequirePackage{ae,aecompl}% Repairs 'Font shape T1/cmr/m/n in size <...> not available'.
\RequirePackage{ragged2e}

\RequirePackage[german]{babel}
\RequirePackage{csquotes}
\RequirePackage[hang,flushmargin]{footmisc}
% \RequirePackage{eurosym}
\RequirePackage[hyphens]{url}
%\urlstyle{same}
% \RequirePackage{pdfpages}
\RequirePackage{microtype}
\RequirePackage[unicode=true,breaklinks=true,colorlinks=true,urlcolor=blue]{hyperref}
\newcommand{\mailto}[1]{\href{mailto:#1}{\texttt{#1}}}

\RequirePackage[official]{eurosym}

\RequirePackage[nolist, nohyperlinks, withpage]{acronym}

% Fonts.
\RequirePackage{helvet}
\renewcommand*\familydefault{\sfdefault}
%\RequirePackage{times}


% Color.
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\definecolor{darkgray}{gray}{0.40}
\definecolor{mediumgray}{gray}{0.60}
\definecolor{upbtextgreen}{rgb}{0.36,0.67,0.15}%        Pantone solid coated 361 (91,172,38)
\definecolor{upbtextorange}{rgb}{0.88,0.42,0.03}%       Pantone solid coated 159 (224,108,8)
\newcommand{\graytext}[1]{{\color{gray}#1}}


% Bibliography.
\RequirePackage[backend=biber,style=authoryear,sorting=ynt]{biblatex}
\addbibresource{refs.bib}


% Text structure. \cf{/usr/share/texmf-texlive/tex/latex/base/article.cls}
\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}% Name, Level, Indent, Preskip, Postskip, Style.
  {-3ex \@plus -1ex \@minus -.2ex}%
  {2ex \@plus.2ex}%
  {\normalfont\sffamily\Large\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-1.5ex\@plus -1ex \@minus -.2ex}%
  {0.5ex \@plus .2ex}%
  {\normalfont\sffamily\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-1.5ex\@plus -1ex \@minus -.2ex}%
  {0.3ex \@plus .2ex}%
  {\normalfont\sffamily\normalsize\bfseries\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
 {1.5ex \@plus0.5ex \@minus.25ex}%
 {-1em}%
 {\normalfont\sffamily\normalsize\bfseries}}

\def\ps@headings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@oddhead{\color{darkgray}\footnotesize\sffamily\rightmark\hfil Seite \arabic{page}}%
  \def\@evenhead{}
  \let\@mkboth\markboth
  \def\sectionmark##1{\markright{\MakeUppercase{\ifnum \c@secnumdepth >\m@ne\thesection\quad\fi##1}}}}

\def\ps@myheadings{%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@oddhead{\color{darkgray}\footnotesize\sffamily\rightmark\hfil \Alph{section}.\roman{page}}%
  \def\@evenhead{}
  \let\@mkboth\markboth
  \def\sectionmark##1{\markright{\MakeUppercase{\ifnum \c@secnumdepth >\m@ne\thesection\quad\fi##1}}}}
\makeatother


% Figures and tables.
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}

\RequirePackage{graphicx}
\DeclareGraphicsRule{.ai}{pdf}{*}{}% Handle .ai files as .pdf files.
\DeclareGraphicsExtensions{.pdf,.ai,.jpg,.png}
\setkeys{Gin}{pagebox=artbox}% Use artbox instead of mediabox default. Options: mediabox, cropbox, bleedbox, trimbox, artBox. (shell: pdfinfo -box <pdf-file>)
\graphicspath{{./figures/}}

%\setlength{\floatsep}{12.0pt plus 2.0pt minus 2.0pt}% Org. 12.0pt plus 2.0pt minus 2.0pt
%\setlength{\textfloatsep}{20.0pt plus 2.0pt minus 4.0pt}% Org. 20.0pt plus 2.0pt minus 4.0pt
%\setlength{\intextsep}{12.0pt plus 2.0pt minus 2.0pt}% Org. 12.0pt plus 2.0pt minus 2.0pt
\setcounter{topnumber}{1}
\setcounter{bottomnumber}{1}
\renewcommand{\bottomfraction}{1.0}
\renewcommand{\floatpagefraction}{1.0}
\renewcommand{\textfraction}{0.0}
\renewcommand{\topfraction}{1.0}

\RequirePackage[small]{caption}
\setlength{\abovecaptionskip}{20pt}


% Itemization.
\RequirePackage{enumitem}
\setlist[enumerate]{topsep=4pt,itemsep=4pt}

\newcommand{\Ni}{(1)~}
\newcommand{\Nii}{(2)~}
\newcommand{\Niii}{(3)~}
\newcommand{\Niv}{(4)~}
\newcommand{\Nv}{(5)~}
\newcommand{\Nvi}{(6)~}



% Commenting.
\newif\ifbscomment
\bscommentfalse
\bscommenttrue% Show comments.

\RequirePackage{soul}
\setstcolor{blue}

\newcommand{\bscom}[2]{%
  % #1 Original text.
  % #2 Replacement text.
  % \framebox{Latex command info:\quad {\tt$\backslash$bscom\{old text\}\{new text\}} \quad$\to$\quad \bscom{old text}{new text}}
  \ifbscomment
    \st{#1}{\color{blue}\fontsize{8}{8}\selectfont\,#2}%
  \else#1\fi}


% Proposal macros.
\RequirePackage{xspace}
\newif\ifbmbfcomment
\bmbfcommentfalse
\bmbfcommenttrue% Show comments.

\newcommand{\bmbfcomment}[1]{%
  \ifbmbfcomment{\color{darkgray}\fontshape{sl}\selectfont\small#1\par}\else\fi}

\newcount\bsnum
\newcommand{\pzdnum}[1]{%
  \bsnum=191
  \advance\bsnum by #1
  \raisebox{-0.3ex}{\Large\Pisymbol{pzd}{\bsnum}}}


\RequirePackage[normalem]{ulem}
\newcommand{\sigline}[2][0.5]{
  % #1 Place.
  \hfill\uline{\hbox to #1\textwidth{#2\hfil}}}
  % Box with fixed height and width. \cf{https://stackoverflow.com/questions/2034144/latex-how-to-create-boxes-with-fixed-heights-and-widths-with-enclosed-text-th}



% Global settings.

% Hurenkinder und Schusterjungen vermeiden
\RequirePackage[all]{nowidow}

\hoffset=-0.75in % -0.925in% Correct the default printer offsets. \cf[appendix]{Kopka}
\voffset=-0.75in

\topmargin=6mm
\headsep=15mm % 10mm
\textwidth=165mm % 175mm
\textheight=240mm % 250mm

\parindent=0em
\parskip=0.4\baselineskip
\renewcommand{\baselinestretch}{1.15}
\raggedbottom
\sloppy
\pagestyle{headings}


% Compability with pandoc md -> tex
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\RequirePackage{todonotes}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{document}

\input{acronyms.tex}

\pagenumbering{roman}
\thispagestyle{empty}


\vspace*{-10ex}
\enlargethispage{4ex}

\huge
Antrag auf Projektförderung bei der Klaus Tschira Stiftung gGmbH
\par
\large

\normalsize


\vspace{8ex}
{\bfseries\sffamily Name:}\par
Journalistic Information Extraction

\vspace{2ex}
{\bfseries\sffamily Akronym:}\par
JoIE

\vspace{8ex}
\renewcommand{\arraystretch}{1.1}
\begin{tabular}{@{}l@{\quad}l}
\bfseries\sffamily Laufzeit:                & 36 Monate \\
\bfseries\sffamily Geplanter Projektstart:  & 1. Oktober 2020 \\
\bfseries\sffamily Förderumfang :           & 247.067,63\EUR{} \\ %216.168 + 7.299,63 + 5.000 + 18.600 
% ganz grobe Kalkulation:
% 3 Jahre WMA 200.000 + SHK 25.000 + Reisen, Server, etc. 25.000 +. 50.000 Overhead 
\end{tabular}

\vfill

{\bfseries\sffamily Antragsteller} \\[1ex]
Dr. Meik Bittkowski \\[1ex]
Science Media Center Germany gGmbH\\[1ex]
Rosenstr. 42-44, 50678 Köln\\
\mailto{meik.bittkowski@sciencemediacenter.de} \\
Tel.: 0221-8888 25 142\\[2ex]

Prof. Dr. Philipp Schaer \\[1ex]
Technische Hochschule Köln \\
Fakultät für Informations- und Kommunikationswissenschaften \\[1ex]
Gustav-Heinemann-Ufer 54, 50968 Köln \\
\mailto{philipp.schaer@th-koeln.de}  \\
Tel.: 0221-8275 3845 \\[2ex]


\clearpage
\pagestyle{headings}
\pagenumbering{arabic}