% Define Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paws}[2019/07/10 Paws Class]

% Define Constants
\newcommand{\HMARGIN}{0.75cm}
\newcommand{\VMARGIN}{0.75cm}

% Define Breaks
\newcommand{\subsectionbreak}{\vspace{0.2cm}}
\newcommand{\sectionbreak}{\vspace{0.2cm}}

% Inherit `article'
\LoadClass[10pt]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Set Margins
\usepackage[hmargin=\HMARGIN, vmargin=\VMARGIN]{geometry}

% Set Indents
\setlength{\parindent}{0in}

% Import Fonts
\usepackage{fontspec}
\setmainfont{Lato}
\newcommand{\titlefont}{
    \fontspec[Path=fonts/]{ProductSans-Bold.ttf}
}

% Helper Components
% Standard List
\makeatletter 
\newcommand{\standardlist}[1]{
    \\#1\@ifnextchar\bgroup{\recursestandardlist}{\\\subsectionbreak}
}
\newcommand{\recursestandardlist}[1]{\\#1\@ifnextchar\bgroup{\recursestandardlist}{\\\subsectionbreak}}
\makeatother

% Bulleted List
\usepackage{enumitem}
\makeatletter 
\newcommand{\bulletedlist}[1]{
    \begin{itemize}[itemsep=0cm,parsep=0.05cm,topsep=0cm,leftmargin=-\itemindent]
    \item #1
    \@ifnextchar\bgroup{\recursebulletedlist}{\end{itemize}\subsectionbreak}
}
\newcommand{\recursebulletedlist}[1]{
    \item #1
    \@ifnextchar\bgroup{\recursebulletedlist}{\end{itemize}\subsectionbreak}
}
\makeatother

% Dotted List
% The weird \mbox and \ prevents abrupt hyphenation
\makeatletter
\newcommand{\dottedlist}[1]{
    \mbox{#1}\@ifnextchar\bgroup{\recursedottedlist}{\\\subsectionbreak}
}
\newcommand{\recursedottedlist}[1]{~\textperiodcentered\ \mbox{#1}\@ifnextchar\bgroup{\recursedottedlist}{\\\subsectionbreak}}
\makeatother

% Title
\renewcommand{\title}[1]{
    {\huge \titlefont #1}
}

% Subtitle
\newcommand{\subtitle}[1]{
    \textit{#1:}
}

% Components
% Header
\newcommand{\header}[2]{
    \title{#1}
    \\\dottedlist{#2}
}

% LHS
\newcommand{\lhs}[1]{
    \begin{minipage}[t]{0.27\textwidth}
        \raggedright
        #1
    \end{minipage}
}

% Section Title
\newcommand{\sectiontitle}[1]{
    \sectionbreak
    {\Large \titlefont #1}
    \\\subsectionbreak
}

% Program
\newcommand{\program}[4]{
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

% QPA
\newcommand{\qpa}[1]{
    \subtitle{QPA} #1
    \\\subsectionbreak
}

% Coursework
\newcommand{\coursework}[1]{
    \subtitle{Relevant Coursework}
    \bulletedlist{#1}
}

% Skill Section
\newcommand{\skillset}[2]{
    \subtitle{#1}
    \\\dottedlist{#2}
}
