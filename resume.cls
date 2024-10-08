\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[10pt,letterpaper]{article}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\pagestyle{empty}

\def\name#1{\def\@name{#1}}
\def\@name{}

\def\addressSep{$\diamond$}

\let\@addressone\relax
\let\@addresstwo\relax
\let\@addressthree\relax

\def\address#1{
  \@ifundefined{@addresstwo}{
    \def\@addresstwo{#1}
  }{
    \@ifundefined{@addressthree}{
      \def\@addressthree{#1}
    }{
      \def\@addressone{#1}
    }
  }
}

\def\printaddress#1{
  \begingroup
    \def\\{\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

\def\printname{
  \begingroup
    \hfil{\namesize\bfseries \@name}\hfil
    \nameskip\break
  \endgroup
}

\let\ori@document\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{
    \printaddress{\@addressthree}}
}

\newenvironment{rSection}[1]{
  \sectionskip
  \MakeUppercase{\bfseries #1}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{1.5em}
  }
  \item[]
}{
  \end{list}
}

\newenvironment{rSubsection}[4]{
  {\bfseries #1} \hfill {#2}
  \ifthenelse{\equal{#3}{}}{}{
    \\
    {\em #3} \hfill {#4}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=1.2em}
    \itemsep -0.5em \vspace{-0.5em}
  }{
  \end{list}
  \vspace{0.5em}
}

\def\namesize{\huge}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\bigskip}
\def\sectionskip{\medskip}
