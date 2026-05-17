#!/bin/sh

git clone https://github.com/Fimbrostilk/accel-on-reports
cd accel-on-reports
mkdir /usr/share/texmf/tex/latex/esime-report/
sudo cp accel-on-reports/templates/esime-report.cls /usr/share/texmf/tex/latex/esime-report/
sudo cp -r accel-on-reports/templates/Imagenes/* /usr/share/texmf/tex/latex/esime-report/
