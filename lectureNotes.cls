%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Adapted from 'easyclass.clc' written by Naijia Fan, 2019.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{lectureNotes}[2025/03/26 custom lecture notes class]
\LoadClass[twoside=false]{scrbook}
\RequirePackage[dvipsnames]{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography, change document font
\RequirePackage[tt=false, type1=true]{libertine}
% Disable paragraph indentation, and increase gap
\RequirePackage{parskip}

%=================================
% header and footer
\RequirePackage{scrpage2}
\pagestyle{scrheadings}
\deftripstyle{pagestyle}
%   [0.5pt]
%   [0.3pt]
  {}
  {}
  {\headmark}
  {}
  {\pagemark}
  {}

\pagestyle{pagestyle}
\renewcommand{\chapterpagestyle}{pagestyle}

%=================================
% title page
% define university 
\def\@university{no university}
\newcommand{\university}[1]{
  \def\@university{#1}
}
% define course id
\def\@courseid{EE 000}
\newcommand{\courseid}[1]{
  \def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
  \def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
  \def\@instructor{#1}
}
% make title
\renewcommand{\maketitle}{
    \centering
    {\scshape{\Large  \@university, \@courseid} \par}
    \vspace{1.5cm}
    {\huge\bfseries{\@title} \par}
    \vspace{2cm}
    \@instructor
    \vspace{2cm}
    \includegraphics[width=0.9\textwidth]{frontpageimg}
    \vfill
    % Bottom of the page
    {\Large\itshape \@author \par}
    {\large \@version \par}
}
%=================================
\RequirePackage[margin=1in]{geometry} % Optional: controls margin size
\newcommand{\lecture}[1]{\marginpar{\textsf{#1}}}
%--------------------------------------------------------------------
% Bibliography
% \RequirePackage[]{natbib}
% \bibliographystyle{chicago}

%--------------------------------------------------------------------
% Theorem
%=================================
% pre-defined theorem environments
% custom theorem boxes
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{amsthm}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{remark}{Remark}[chapter]
\newtheorem{definition}{Definition}[chapter]

% Theorem
\newcommand{\numbertag}{\arabic{chapter}.\arabic{theorem}}
\renewenvironment{theorem}[1][]{
    \vspace{0.3cm}
    \refstepcounter{lemma}
    \refstepcounter{remark}
    \refstepcounter{definition}
    \refstepcounter{theorem}
    \ifstrempty{#1}{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]
        {\strut Theorem~\numbertag};}}
    }{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=blue!20]
        {\strut Theorem~\numbertag:~#1};}}
    }%
    \mdfsetup{innertopmargin=10pt,linecolor=blue!20,
    linewidth=2pt,topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
    }
    \begin{mdframed}[]\relax
}{
    \end{mdframed}
}

% Lemma
\renewenvironment{lemma}[1][]{
    \vspace{0.3cm}
    \refstepcounter{theorem}
    \refstepcounter{remark}
    \refstepcounter{definition}
    \refstepcounter{lemma}
    \ifstrempty{#1}{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=green!20]
        {\strut Lemma~\numbertag};}}
    }{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=green!20]
        {\strut Lemma~\numbertag:~#1};}}
    }
    \mdfsetup{innertopmargin=10pt,linecolor=green!20,
    linewidth=2pt,topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
    }
    \begin{mdframed}[]\relax
}{
    \end{mdframed}
}

% Remark
\renewenvironment{remark}[1][]{
    \vspace{0.3cm}
    \refstepcounter{theorem}
    \refstepcounter{lemma}
    \refstepcounter{definition}
    \refstepcounter{remark}
    \ifstrempty{#1}{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=red!20]
        {\strut Remark~\numbertag};}}
    }{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=red!20]
        {\strut Remark~\numbertag:~#1};}}
    }
    \mdfsetup{innertopmargin=10pt,linecolor=red!20,
    linewidth=2pt,topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
    }
    \begin{mdframed}[]\relax
}{
    \end{mdframed}
}

% Definition
\renewenvironment{definition}[1][]{
    \vspace{0.3cm}
    \refstepcounter{theorem}
    \refstepcounter{lemma}
    \refstepcounter{remark}
    \refstepcounter{definition}
    \ifstrempty{#1}{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=teal!20]
        {\strut Definition~\numbertag};}}
    }{
        \mdfsetup{
        frametitle={
        \tikz[baseline=(current bounding box.east),outer sep=0pt]
        \node[anchor=east,rectangle,fill=teal!20]
        {\strut Definition~\numbertag:~#1};}}
    }
    \mdfsetup{innertopmargin=10pt,linecolor=teal!20,
    linewidth=2pt,topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
    }
    \begin{mdframed}[]\relax
}{
    \end{mdframed}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\sectionautorefname{Section}
\def\subsectionautorefname{Section}
\def\subsubsectionautorefname{Section}
\def\figureautorefname{Figure}
\def\subfigureautorefname{Figure}
% \def\subtableautorefname{Table}
\def\equationautorefname{Equation}
\def\theoremautorefname{Theorem}
\def\lemmaautorefname{Lemma}
\def\remarkautorefname{Remark}
\def\definitionautorefname{Definition}

\newcommand{\aref}[1]{\hyperref[#1]{Appendix~\ref*{#1}}}