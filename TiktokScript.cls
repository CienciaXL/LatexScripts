\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TiktokScript}[]
\typeout{TiktokScript}
\LoadClass[12pt,a4paper]{report}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAQUETES
%----------------------
\RequirePackage{graphicx}
\graphicspath{{./logotipos/}{./figuras/}}
%\RequirePackage{hyperref}
\usepackage[hidelinks]{hyperref}
%\RequirePackage[spanish]{babel}
\usepackage[spanish]{babel}

\usepackage[most]{tcolorbox} 
\RequirePackage{pdfpages}
\RequirePackage{xspace}
\RequirePackage{setspace}
\RequirePackage{geometry}
%\RequirePackage{marginnote}
\geometry{a4paper,top=30mm,bottom=20mm,left=30mm,right=20mm}
\reversemarginpar

\RequirePackage{csquotes}

\definecolor{colWeb}{rgb}{0.156, 0.448, 0.676}
\definecolor{colVideo}{rgb}{0.9, 0.10, 0.180}
\definecolor{colMusic}{rgb}{0.6, 0.10, 0.750}
\definecolor{colImg}{rgb}{0.2, 0.50, 0.180}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCIONES Y COMANDOS
%----------------------
\let\@allrefs\relax % Aqui van almacenadas las referencias
\def\initaa#1{\gdef\@allrefs{#1}}
\initaa{}

\def\addtorefs#1#2{ % Para añadir a las referencias
  \g@addto@macro\@allrefs{- #1: \href{#2}{\color{colWeb}#2}\\}
}

\def\addref#1#2{ % Pinta la referencia en el texto y la almacena
  \href{#2}{\color{colWeb}#1}
  \addtorefs{#1}{#2}
}

\def\music#1{
  \g@addto@macro\@allrefs{- M{\'u}sica: \href{#1}{\color{colMusic}#1}\\}
}

\let\@extralinks\relax % Aqui van almacenados los links extra
\def\initee#1{\gdef\@extralinks{#1}}
\initee{}

\def\addtolinks#1#2{
  \g@addto@macro\@extralinks{- #1: \href{#2}{\color{colWeb}#2}\\ }
}

\newcounter{nScenes}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VARIABLES
%----------------------

\let\@title\relax % Titulo
\def\title#1{\gdef\@title{#1}}

\let\@channel\relax % Nombre del canal
\def\channel#1{\gdef\@channel{#1}}

\let\@followus\relax % Redes sociales
\def\followus#1{\gdef\@followus{#1}}

\let\@resumen\relax % Resumen
\def\resumen#1{\gdef\@resumen{#1}}

\let\@miniatura\relax % Nombre de la imagen para la miniatura
\def\miniatura#1{\gdef\@miniatura{#1}}

\let\@imgclose\relax % Nombre de la imagen final
\def\imgclose#1{\gdef\@imgclose{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESTRUCTURAS FIJAS
%----------------------

\def\logos{
  \noindent
  \vspace{-2cm}
  \hspace{-2cm}
  \begin{center}
  \begin{tabular}{ccc}
    %\hspace{-2cm}
    \raisebox{-0.25\height}{\includegraphics[height=1.8cm]{myLogos/TikTokLogo.png}} &

    \if\@channel\relax \else
      \begin{minipage}{.6\textwidth}
        \centering
        \normalsize \textbf{Guion de v\'ideo} \\
        \huge \textbf{\@channel} \\ 
      \end{minipage} &
    \fi
    \raisebox{-0.40\height} {\includegraphics[height=3.0cm]{myLogos/channelLogo.png}}
  \end{tabular}
  \end{center}
}

\def\maketitle{
  \vspace{1.0cm}
  \begin{center}
  \Huge 
  \textbf
  \@title  \\
  \end{center}
  \normalsize
}

\def\inMiniatura{
  \vspace{1cm}
  \begin{center}
  \includegraphics[height=4.0cm]{\@miniatura}
  \end{center}
  \vspace{1cm}
}

\def\inImgclose{
  \vspace{0.5cm}
  \begin{center}
  \includegraphics[height=4.0cm]{\@imgclose}
  \end{center}
  \vspace{0.5cm}
}

\def\buildtitlepage{
  \logos
  \centering
  \if\@title\relax \else\maketitle\fi
  
  \vspace{0.2cm}
  \if\@resumen\relax \else
    \paragraph*{\large Resumen\\}
    \vspace{0.5cm} \relax
    \Large
    \@resumen
    \vspace{0.5cm}
    \normalsize
  \fi
  \if\@miniatura\relax\vspace{2cm}\else\inMiniatura\fi
  %\pagebreak
}

\def\referencias{
\vspace{1cm}
\noindent
---------------------------------\\
  \if\@allrefs\relax\else\
\noindent
\textbf{Referencias:\\} 
\noindent
\@allrefs
  \fi
}

\def\parasabermas{
  \if\@extralinks\relax\else
  
\noindent
\textbf{Para saber m{\'a}s:\\}
\noindent
\@extralinks
  \fi
}

\def\subscribete{
  \vspace{1cm}
\noindent
---------------------------------\\
\noindent
>> Subscr{\'i}bete al canal: \\
\noindent
\normalsize
\href{https://www.youtube.com/channel/UCuPphnMMTU\_G8CDNG59jrJg}{\color{colVideo}https://www.youtube.com/channel/UCuPphnMMTU\_G8CDNG59jrJg} \\
  
\large
\noindent
>> Cont{\'a}ctanos: cienciaxl@gmail.com \\
  
%%%% Para cuando haya una página de facebook
\noindent
>> S{\'i}guenos en la redes: \href{https://www.facebook.com/cielosdespejados/}{\color{colWeb}https://www.facebook.com/cielosdespejados/} \\
} 

\def\buildlastpage{
  \newpage
  % Imagen para el final del vídeo
  \if\@imgclose\relax\vspace{2cm}\else\inImgclose\fi
  \vspace{1.cm}
  
  \noindent
  \paragraph*{\large Descripci{\'o}n\\}
  \if\@resumen\relax \else \@resumen\\ \fi % El resumen del vídeo
  \referencias % Las referencias
  \parasabermas % Links con más info, para saber más
  
  \subscribete % Más info del canal, redes sociales, etc
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESTRUCTURAS CREABLES
%----------------------
%
% \img, himg
% \video, \music

\newcommand{\scene}{
\stepcounter{nScenes}
\marginpar{
\vspace{0.4cm} \hspace{0.8cm}
\Large \textbf{\arabic{nScenes}}}
\Large
\noindent
}

\def\desc#1{ %Añade una descripción
  \definecolor{col1}{rgb}{0.9, 0.90, 0.980}
  \begin{center}
  \begin{tcolorbox}[width=\textwidth,colback={col1},width=0.9\linewidth]
  \large
  #1
\end{tcolorbox}
 \end{center}
}

\def\intro{
  \definecolor{col1}{rgb}{0.94, 0.30, 0.380}
  \begin{center}
  \begin{tcolorbox}[width=\textwidth,colback={col1},width=0.6\linewidth]
  \Large
  \begin{center}
  \textbf{I N T R O}
  \end{center}
\end{tcolorbox}
 \end{center}
}

\def\img#1{
  \begin{center}
  \includegraphics[height=4.0cm]{#1}
  \end{center}
}

\def\himg#1#2#3{
  \begin{center}
  \includegraphics[height=4.0cm]{#1}
  \end{center}
  \href{#3}{\color{colImg}#2\\}
  \g@addto@macro\@allrefs{- #2 : \href{#3}{\small \color{colImg}#3}\\}
}

\def\video#1#2{
  \href{#2}{\color{colVideo}#1}
  \g@addto@macro\@allrefs{- #1 : \href{#2}{\small\color{colVideo}#2}\\}
}
