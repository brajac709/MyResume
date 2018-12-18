%\NeedsTeXFormat{LaTeX2e}  % not sure if necessary
\ProvidesClass{BradyResume}[2017/04/22 Brady's Resume]

% Based off of article
\LoadClass[10pt]{article}

\RequirePackage[margin=1in]{geometry}
\RequirePackage{enumitem}  % allows setting of spacing
%\RequirePackage[normalem]{ulem} % uses constant spacing underline
\RequirePackage{soul} % some better underline handling??

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
    \@telenum\ -- \@email
    \end{center}
    \parbox{\boxlength}{{\bf Current Address\\} \@address}
    \vspace{.5em}
    \hrule
%    \vspace{1em}
}

% Define itemize styles
\setlist{noitemsep, nosep}  % removes itemsep for all lists
\renewcommand{\labelitemi}{\textbullet}
\renewcommand{\labelitemii}{$\circ$}

% Redefine section style and spacing
% TODO need to fix spacing between Sections
\renewcommand{\section}{%
    \@startsection
    {section}% command name
    {1}{0pt}% section level, indend level (\z@???)
    %{0ex}% before skip???    
    {-3.5ex \@plus -1ex \@minus -.2ex}% default before skip
    {.2ex}% after skip
    %{2.3ex \@plus .2ex}% default after skip
    {\normalfont\Large\bfseries}% style
}
\renewcommand{\subsection}{%
   \@startsection
    {subsection}% command name
    {2}{0pt}% section level, indent level
    {0ex}% before skip
    %{-3.25ex\@plus -1ex \@minus -.2ex}% default before skip
    {.2ex}% after skip
    %{1.5ex \@plus .2ex}% default after skip
    {\normalfont\normalsize\bfseries\itshape}% style
}

\newcommand{\datesubsec}[2]{\subsection*{#1 \normalfont\dotfill #2}}

% font sizes
%\renewcommand{\normalsize}{\fontsize{12}{12}\selectfont}

% Remove page numbers
\pagenumbering{gobble}
%\pagenumbering{arabic}  % default - use arabic numerals for page


% Other commands
% TODO make new environment
%      where items are separated by {\textbar\/}
%      and no linebreak
\newcounter{@pipecount} \setcounter{@pipecount}{0}
% A horizontal list environment with items separated by "|"
% TODO need to fix the spacing of the very first item
%      for now it works if you add a comment to the end of prev line
\newenvironment{pipelist}[1][]%
               {\setul{0pt}{}%
                \def\item{\ifnum \the@pipecount=0 %
                            \relax
                          \else 
                            \textbar\/
                          \fi 
                          \stepcounter{@pipecount}}
                 % Test for empty argument
                 \def\@temp{#1}
                 \ifx\@temp\empty%
                 %
                 \else%
                   \ul{#1}:%
                 \fi%
                }%
                {\setcounter{@pipecount}{0}\resetul}

