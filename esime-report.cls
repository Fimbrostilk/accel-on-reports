\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esime-report}[2026/01/29 v1.0 Plantilla de reportes ESIME]

% Heredar de la clase article (estándar para reportes)
\LoadClass[12pt, letterpaper]{article}

% --- Paquetes Requeridos ---
% Usamos \RequirePackage en lugar de \usepackage en archivos .cls
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish, es-tabla, es-nodecimaldot, shorthands=off]{babel}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{anyfontsize} % Para tamaños de fuente personalizados si hacen falta

% --- Configuración de Márgenes (Geometría del documento) ---
\geometry{
    top=2.5cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm
}

% --- Definición de Variables (Metadatos) ---
% Creamos comandos para guardar la información del usuario
\newcommand{\@subtitle}{}
\newcommand{\@boleta}{}
\newcommand{\@grupo}{}
\newcommand{\@asignatura}{}
\newcommand{\@profesor}{}
\newcommand{\@carrera}{}
\newcommand{\@equipo}{}

% Comandos públicos para que el usuario defina los valores
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\boleta}[1]{\renewcommand{\@boleta}{#1}}
\newcommand{\grupo}[1]{\renewcommand{\@grupo}{#1}}
\newcommand{\asignatura}[1]{\renewcommand{\@asignatura}{#1}}
\newcommand{\profesor}[1]{\renewcommand{\@profesor}{#1}}
\newcommand{\carrera}[1]{\renewcommand{\@carrera}{#1}}
\newcommand{\equipo}[2]{\renewcommand{\@equipo}{#1}}

% --- Redefinición del comando \maketitle ---
% Aquí va tu lógica de TikZ, pero inyectando las variables
\renewcommand{\maketitle}{
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{tikzpicture}[remember picture, overlay]
            
		% --- Imágenes (Logos) ---
		% Debe existir una carpeta 'imagenes/' en el directorio raíz
		\node[anchor=center] at ($(current page.north west) + (1.5in, -1.5in)$) {
			\includegraphics[width=3cm]{imagenes/esime.png}
		};
		\node[anchor=center] at ($(current page.north east) + (-1.5in, -1.5in)$) {
			\includegraphics[height=3cm]{imagenes/ipn.png}
		};
		% Logo inferior (opcional, ajustado para que no choque con texto)
		\node[anchor=center] at ($(current page.south west) + (1.5in, 1.5in)$) {
			\includegraphics[width=3cm]{imagenes/esime-ice.png}
		};

		% --- Elementos Gráficos (Líneas) ---
		\draw[line width=1mm] ($(current page.north west) + (2.5in, -1.5in)$) -- ($(current page.north east) + (-2.5in, -1.5in)$);
		\draw[line width=0.5mm] ($(current page.north west) + (2.5in, -1.6in)$) -- ($(current page.north east) + (-2.5in, -1.6in)$);
            
		\draw[line width=1mm] ($(current page.north west) + (1.45in, -2.5in)$) -- ($(current page.south west) + (1.45in, 2.5in)$);
		\draw[line width=0.5mm] ($(current page.north west) + (1.55in, -2.5in)$) -- ($(current page.south west) + (1.55in, 2.5in)$);

		% --- Encabezado Institucional ---
		\node[anchor = north] at ($(current page.north) + (0in, -1.2in)$) {%
			\Large{\textbf{Instituto Politécnico Nacional}}
		};
		\node[anchor = north] at ($(current page.north) + (0in, -1.65in)$) {
			\small{Escuela Superior de Ingeniería Mecánica y Eléctrica}
		};
		\node[anchor = north] at ($(current page.north) + (0in, -1.8in)$) {
			\small{Unidad Zacatenco (ESIMEZ)}
		};

		% --- Título del Reporte ---
		\node at ($(current page.center) + (0in, 0.5in)$) {
			\begin{minipage}{10cm}
			\centering
			\huge\textbf{\@title}
    
			\vspace{0.5cm}
			\large\@subtitle% Usamos el campo date para subtítulos o fecha
			\end{minipage}
		};

		% --- Datos del Alumno y Curso ---
		\node[anchor=south] at ($(current page.south) + (0in, 1in)$) {
			\begin{minipage}{8cm}
			\normalsize
			\ifdefempty{\@asignatura}{}{\textbf{Asignatura:} \@asignatura \\[0.3cm]}
			\ifdefempty{\@equipo}{}{\textbf{Equipo}}
			\ifdefempty{\@author}{}{\textbf{Alumno:} \@author \\[0.3cm]}
			\ifdefempty{\@carrera}{}{\textbf{Carrera:} \@carrera \\[0.3cm]}
			\ifdefempty{\@boleta}{}{\textbf{Boleta:} \@boleta \\[0.3cm]}
			\ifdefempty{\@profesor}{}{\textbf{Profesor:} \@profesor \\[0.3cm]}
			\ifdefempty{\@grupo}{}{\textbf{Grupo:} \@grupo \\[0.3cm]}
			\ifdefempty{\@date}{}{\textbf{Fecha:} \@date}
			\end{minipage}
		};
		\end{tikzpicture}
	\end{titlepage}
}
