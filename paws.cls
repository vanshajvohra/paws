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
\setmainfont[Path=fonts/]{Lato-Regular.ttf}

% Blurb
\newcommand{\blurb}[2]{
    \name{#1}
    \\[0.1cm]
    \bio{#2}
}

\newcommand{\name}[1]{
    {\huge \namefont #1}
}

\makeatletter 
% This code can use @ in macro names.
\newcommand{\bio}[1]{
    #1\checknextarg
}
\newcommand{\checknextarg}{\@ifnextchar\bgroup{\gobblenextarg}{}}
\newcommand{\gobblenextarg}[1]{~\textperiodcentered~#1\@ifnextchar\bgroup{\gobblenextarg}{}}
\makeatother
