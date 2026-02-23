\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esime-report}[2026/01/30 v1.0 Plantilla de reportes ESIME]

% Heredar de la clase report
\LoadClass[12pt, letterpaper]{article}

% --- Paquetes Requeridos ---
% Se usa \RequirePackage en lugar de \usepackage
\RequirePackage[utf8]{inputenc} % Compatibilidad
\RequirePackage[spanish, es-tabla, es-nodecimaldot, shorthands=off]{babel} % Para que funcione bien el español y no rompa nada
\RequirePackage{tikz} % Gráficos
\usetikzlibrary{calc}
\RequirePackage{geometry} % Modificar propiedades de la página
\RequirePackage{graphicx} % Insertar gráficos
\RequirePackage{etoolbox} % Para \ifdefempty
\RequirePackage{anyfontsize} % Usar cualquier tamaño de font
\RequirePackage{microtype}

% --- Configuración de márgenes ---
\geometry{
    top=1in,
    bottom=1in,
    left=0.8in,
    right=0.8in
}

% --- Definición de variables (Metadatos) ---
% Creamos comandos para guardar la información de la portada
\newcommand{\@subtitle}{}
\newcommand{\@boleta}{}
\newcommand{\@grupo}{}
\newcommand{\@asignatura}{}
\newcommand{\@profesor}{}
\newcommand{\@carrera}{Ingeniería en Comunicaciones y Electrónica}
\newcommand{\@equipo}{}
\newcommand{\@alumno}{}

% Comandos públicos para que el usuario defina los valores
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\boleta}[1]{\renewcommand{\@boleta}{#1}}
\newcommand{\grupo}[1]{\renewcommand{\@grupo}{#1}}
\newcommand{\asignatura}[1]{\renewcommand{\@asignatura}{#1}}
\newcommand{\profesor}[1]{\renewcommand{\@profesor}{#1}}
\newcommand{\carrera}[1]{\renewcommand{\@carrera}{#1}}
\newcommand{\equipo}[1]{\renewcommand{\@equipo}{#1}}
\newcommand{\alumno}[1]{\renewcommand{\@alumno}{#1}}

% --- Redefinición del comando \maketitle ---
\renewcommand{\maketitle}{
	\begin{titlepage}
		\thispagestyle{empty}
		\begin{tikzpicture}[remember picture, overlay]
            
		% --- Imágenes (Logos) ---
		% Debe existir una carpeta 'imagenes/' en el directorio raíz
		% Logo superior izquierdo
		\node[anchor=center] at ($(current page.north west) + (1.5in, -1.5in)$) {
			\includegraphics[width=3cm]{imagenes/esime.png}
		};
		% Logo superior derecho
		\node[anchor=center] at ($(current page.north east) + (-1.5in, -1.5in)$) {
			\includegraphics[height=3cm]{imagenes/ipn.png}
		};
		% Logo inferior izquierdo
		\node[anchor=center] at ($(current page.south west) + (1.5in, 1.5in)$) {
			\includegraphics[width=3cm]{imagenes/esime-ice.png}
		};

		% --- Elementos Gráficos (Líneas) ---
		% Líneas del encabezado
		\draw[line width=1mm] ($(current page.north west) + (2.5in, -1.5in)$) -- ($(current page.north east) + (-2.5in, -1.5in)$);
		\draw[line width=0.5mm] ($(current page.north west) + (2.5in, -1.6in)$) -- ($(current page.north east) + (-2.5in, -1.6in)$);

		% Líneas del márgen izquierdo
		\draw[line width=1mm] ($(current page.north west) + (1.45in, -2.5in)$) -- ($(current page.south west) + (1.45in, 2.5in)$);
		\draw[line width=0.5mm] ($(current page.north west) + (1.55in, -2.5in)$) -- ($(current page.south west) + (1.55in, 2.5in)$);

		% --- Encabezado institucional ---
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
			\huge\textbf{\@title} % No es opcional porque ¿Por qué debería ser opcional?

    		\ifdefempty{\@subtitle}{}{\vspace{0.5cm}\large\@subtitle} % Subtitulo opcional
			\end{minipage}
		};

		% --- Datos del alumno y curso ---
		% Los datos son opcionales por si no se requieren
		\node[anchor=south] at ($(current page.south) + (0in, 1in)$) {
			\begin{minipage}{8cm}
			\normalsize
			\ifdefempty{\@asignatura}{}{\textbf{Asignatura:} \@asignatura \par\vspace{0.3cm}}
			\ifdefempty{\@alumno}{}{\textbf{Alumno:} \@alumno \par\vspace{0.3cm}}
			\ifdefempty{\@equipo}{}{\@equipo \par\vspace{0.3cm}}
			\ifdefempty{\@carrera}{}{\textbf{Carrera:} \@carrera \par\vspace{0.3cm}}
			\ifdefempty{\@boleta}{}{\textbf{Boleta:} \@boleta \par\vspace{0.3cm}}
			\ifdefempty{\@profesor}{}{\textbf{Profesor:} \@profesor \par\vspace{0.3cm}}
			\ifdefempty{\@grupo}{}{\textbf{Grupo:} \@grupo \par\vspace{0.3cm}}
			\ifdefempty{\@date}{}{\textbf{Fecha:} \@date}
			\end{minipage}
		};
		\end{tikzpicture}
	\end{titlepage}
}

