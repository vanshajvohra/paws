% Define Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paws}[2019/07/10 Paws Class]

% Inherit from `article'
\LoadClass[10pt]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Set Margins
\newcommand{\HMARGIN}{0.75cm}
\newcommand{\VMARGIN}{0.75cm}
\usepackage[hmargin=\HMARGIN, vmargin=\VMARGIN]{geometry}

% Set Indents
\setlength{\parindent}{0in}

% Fonts
\usepackage{fontspec}
\newcommand{\namefont}{
    \fontspec[Path=fonts/]{ProductSans-Bold.ttf}
}
\setmainfont{Lato}

% Header
\newcommand{\header}[2]{
    \name{#1}
    \\ \bio{#2}
}

\newcommand{\name}[1]{
    {\huge \namefont #1}
}

\makeatletter 
% This code can use @ in macro names.
\newcommand{\bio}[1]{
    #1\@ifnextchar\bgroup{\recursebio}{}
}
\newcommand{\recursebio}[1]{~\textperiodcentered~#1\@ifnextchar\bgroup{\recursebio}{\headerbreak}}
\makeatother

% Breaks
\newcommand{\headerbreak}{\vspace{0.5cm}}
\renewcommand{\linebreak}{\\\vspace{0.05cm}}
\newcommand{\subsectionbreak}{\\\vspace{0.15cm}}
\newcommand{\sectionbreak}{\vspace{0.5cm}}

% LHS
\newcommand{\lhs}[1]{
    \begin{minipage}[t]{0.27\textwidth}
        \raggedright
        #1
    \end{minipage}
}

% Section Title
\newcommand{\sectiontitle}[1]{
    {\Large \namefont #1} \\[0.2cm]
}

% Program
\newcommand{\program}[4]{
    \textbf{#1}
    \linebreak \textit{#2}
    \linebreak #3, #4
    \subsectionbreak
}

% Minors
\makeatletter 
% This code can use @ in macro names.
\newcommand{\minors}[1]{
    \textit{Additional Minors:}
    \linebreak
    #1\@ifnextchar\bgroup{\recurseminors}{\subsectionbreak}
}
\newcommand{\recurseminors}[1]{\\#1\@ifnextchar\bgroup{\recursebio}{\subsectionbreak}}
\makeatother

% QPA
\newcommand{\qpa}[1]{
    \textit{QPA:} #1
    \subsectionbreak
}

%
\usepackage{enumitem}

\makeatletter 
\newcommand{\coursework}[1]{
    \textit{Relevant Coursework:}
    \begin{itemize}[itemsep=0cm,parsep=0.05cm,topsep=0cm,leftmargin=-\itemindent]
    \item #1
    \@ifnextchar\bgroup{\recursecoursework}{\end{itemize} \sectionbreak}
}
\newcommand{\recursecoursework}[1]{\item #1\@ifnextchar\bgroup{\recursecoursework}{\end{itemize} \sectionbreak}}
\makeatother