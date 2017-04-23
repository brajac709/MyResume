%\NeedsTeXFormat{LaTeX2e}  % not sure if necessary
\ProvidesClass{BradyResume}[2017/04/22 Brady's Resume]

% Based off of article
\LoadClass{article}

\RequirePackage[margin=1in]{geometry}

%no automatic paragraph indents
\setlength{\parindent}{0pt}   % default 15pt

% Custom Header
\newlength\boxlength
\setlength\boxlength\textwidth

\newcommand\@name{Brady Jacobs} % default value
\newcommand\name[1]{\renewcommand{\@name}{#1}}
\newcommand\@telenum{(407)-212-9087} % default value
\newcommand\telenum[1]{\renewcommand{\@telenum}{#1}}
\newcommand\@email{bij4@cornell.edu} % default value
\newcommand\email[1]{\renewcommand{\@email}{#1}}
\newcommand\@address{2206 Dorchester Dr N. Apt. 103\\Troy, MI 48084}
\newcommand\address[1]{\renewcommand{\@address}{#1}}
\newcommand\@addressb{}  % probalby don't need this anymore...
\newcommand\addressb[1]{\renewcommand{\@addressb}{#1}}


\renewcommand{\maketitle}{\vspace*{-7em}
    \begin{center} {\bf \@name} \\
    \@telenum -- \@email
    \end{center}
    \parbox{\boxlength}{{\bf Current Address\\} \@address}
    \vspace{.5em}
    \hrule
    \vspace{1em}
}

