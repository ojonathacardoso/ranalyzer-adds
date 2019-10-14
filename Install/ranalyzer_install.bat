@ECHO OFF

title Instalador - RAnalyzer

@ECHO -------------------------
@ECHO Fazendo o download do R
@ECHO -------------------------

download\wget.exe -O download\R.exe  https://cran.r-project.org/bin/windows/base/R-3.6.1-win.exe

download\wget.exe -O download\RTools.exe  https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe

@ECHO -------------------------
@ECHO Fazendo o download do RAnalyzer
@ECHO -------------------------

download\wget.exe -O download\RAnalyzer.zip https://github.com/ojonathacardoso/ranalyzer/archive/master.zip

@ECHO -------------------------
@ECHO Instalando o R
@ECHO -------------------------

download\R.exe /SILENT /DIR="C:\R"

download\RTools.exe /SILENT

@ECHO -------------------------
@ECHO Instalando o RAnalyzer
@ECHO -------------------------

download\unzip.exe download\RAnalyzer.zip -d download\RAnalyzer

mkdir "%USERPROFILE%\R\ranalyzer"

xcopy download\RAnalyzer\ranalyzer-master "%USERPROFILE%\R\ranalyzer" /E

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\RAnalyzer.lnk" -target  "%USERPROFILE%\R\ranalyzer"

"C:\R\bin\Rscript.exe" "%USERPROFILE%\R\ranalyzer\install.R"

@ECHO -------------------------
@ECHO Instalação concluída
@ECHO -------------------------