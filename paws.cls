% Define Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paws}[2019/07/10 Paws Class]

% Define Constants
\newcommand{\HMARGIN}{0.75cm}
\newcommand{\VMARGIN}{0.75cm}

% Define Breaks
\newcommand{\subsectionbreak}{\vspace{0.2cm}}
\newcommand{\minibreak}{\vspace{0.05cm}}

% Inherit `article'
\LoadClass[10pt]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Set Margins
\usepackage[hmargin=\HMARGIN, vmargin=\VMARGIN]{geometry}

% Set Indents
\setlength{\parindent}{0in}

% Set Line Spacing
\renewcommand{\baselinestretch}{1.12} 

% Import Fonts
\usepackage{fontspec}
\setmainfont{Lato}
\newcommand{\headingfont}{
    \fontspec[Path=fonts/]{ProductSans-Bold.ttf}
}

\usepackage{fontawesome5}

% Helper Components
% Standard List
\makeatletter 
\newcommand{\standardlist}[1]{
    \\#1\@ifnextchar\bgroup{\recursestandardlist}{\\\subsectionbreak}
}
\newcommand{\recursestandardlist}[1]{\\#1\@ifnextchar\bgroup{\recursestandardlist}{\\\subsectionbreak}}
\makeatother

% Bulleted List (Square)
\usepackage{enumitem}
\usepackage{mathabx}
\makeatletter 
\newcommand{\bulletedlist}[1]{
    \begin{itemize}[itemsep=0cm,parsep=0.05cm,topsep=0cm,leftmargin=-\itemindent,label=$\sqbullet$]
    \item #1
    \@ifnextchar\bgroup{\recursebulletedlist}{\end{itemize}\subsectionbreak}
}
\newcommand{\recursebulletedlist}[1]{
    \item #1
    \@ifnextchar\bgroup{\recursebulletedlist}{\end{itemize}\subsectionbreak}
}
\makeatother

% Dotted List
\renewcommand{\cdot}{\textperiodcentered}
\makeatletter
\newcommand{\dottedlist}[1]{
    \mbox{#1}\@ifnextchar\bgroup{\recursedottedlist}{\\\subsectionbreak}
}
% The weird \mbox and \ prevents abrupt hyphenation
\newcommand{\recursedottedlist}[1]{\ \cdot\ \mbox{#1}\@ifnextchar\bgroup{\recursedottedlist}{\\\subsectionbreak}}
\makeatother

% Heading
\newcommand{\heading}[1]{
    {\huge \headingfont #1}
}

% Title
\renewcommand{\title}[1]{%
    \textbf{#1}%
}

% Subtitle
\newcommand{\subtitle}[1]{%
    \textit{#1:}
}

% LHS
\newcommand{\lhs}[1]{%
    \begin{minipage}[t]{0.25\textwidth}
        \raggedright
        #1
    \end{minipage}
}

% RHS
\newcommand{\rhs}[1]{%
    \begin{minipage}[t]{0.7\textwidth}
        \raggedright
        #1
    \end{minipage}
}

% if...then...else Components
% ifexiststs
\usepackage{ifthen}
\newcommand{\ifexists}[2]{%
    \ifthenelse{\equal{#1}{}}{}{#2}%
}

% ifexiststwo
\newcommand{\ifexiststwo}[3]{%
    \ifexists{#1}{\ifexists{#2}{#3}}%
}

% Resume Components
% Header
\newcommand{\header}[2]{
    \heading{#1}
    \\[0.2em]\dottedlist{#2}
}

% Section Title
\newcommand{\sectiontitle}[1]{
    \subsectionbreak
    {\Large \headingfont #1}
    \\\subsectionbreak
}

% Program
\newcommand{\school}[4]{
    \textbf{#1}
    \\\textit{#2}
    \\#3, #4
    \\\subsectionbreak
}

% Minors
\newcommand{\minors}[1]{
    \subtitle{Additional Minors}
    \standardlist{#1}
}

% GPA
\newcommand{\gpa}[1]{
    \subtitle{GPA}#1
    \\\subsectionbreak
}

% QPA
\newcommand{\qpa}[1]{
    \subtitle{QPA}#1
    \\\subsectionbreak
}

% Coursework
\newcommand{\coursework}[1]{
    \subtitle{Relevant Coursework}
    \bulletedlist{#1}
}

% Teaching Assistant
\newcommand{\ta}[1]{
    \subtitle{Teaching Assistant}
    \bulletedlist{#1}
}

% Skill Section
\newcommand{\skillset}[2]{
    \subtitle{#1}
    \\\dottedlist{#2}
}

% Mini Passport
\newcommand{\minipassport}[3]{
    \title{#1}%
    \ifexiststwo{#1}{#2#3}{\\}%
    \textit{#2}\ifexiststwo{#2}{#3}{,\ }#3
    \ifexiststwo{#1}{#2#3}{\\\subsectionbreak}%
}

% Passport
\newcommand{\passport}[6]{
    \title{#1}\ifexists{#2}{\ \cdot\ }#2\hfill{\footnotesize#3}
    \ifexiststwo{#1}{#4#5}{\\\minibreak}%
    \textit{#4}\ifexiststwo{#4}{#5}{,\ }#5
    \minibreak\bulletedlist{#6}
}