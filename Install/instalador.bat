@ECHO OFF

title Instalador - Text Mining

@ECHO -------------------------
@ECHO Fazendo o download do Facepager
@ECHO -------------------------

download\wget.exe -O download\Facepager.exe https://github.com/strohne/Facepager/releases/download/v4.0.4/Facepager_Setup_4_0_4.windows.exe

download\wget.exe -O download\FacepagerPresets.zip https://github.com/ojonathacardoso/ranalyzer-adds/archive/master.zip

@ECHO -------------------------
@ECHO Fazendo o download do OpenRefine
@ECHO -------------------------

download\wget.exe -O download\OpenRefine.zip https://github.com/OpenRefine/OpenRefine/releases/download/3.2/openrefine-win-3.2.zip

@ECHO -------------------------
@ECHO Fazendo o download do SOBEK
@ECHO -------------------------

download\wget.exe -O download\SOBEK.jar http://sobek.ufrgs.br/SobekTextMiner.jar

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
@ECHO Instalando o Java
@ECHO -------------------------

download\Java.exe /s

@ECHO -------------------------
@ECHO Instalando o Facepager
@ECHO -------------------------

download\Facepager.exe /S

@ECHO -------------------------
@ECHO Instalando os presets do Facepager
@ECHO -------------------------

download\unzip.exe download\FacepagerPresets.zip -d download\FacepagerPresets

mkdir "%USERPROFILE%\Facepager\Presets\"

copy download\FacepagerPresets\ranalyzer-adds-master\Facepager\Presets\ "%USERPROFILE%\Facepager\Presets\"

@ECHO -------------------------
@ECHO Instalando o OpenRefine
@ECHO -------------------------

download\unzip.exe download\OpenRefine.zip -d download\OpenRefine

mkdir "%USERPROFILE%\OpenRefine"

xcopy download\OpenRefine "%USERPROFILE%\OpenRefine" /E

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\OpenRefine.lnk" -target  "%USERPROFILE%\OpenRefine\openrefine-3.2\"

@ECHO -------------------------
@ECHO Instalando o SOBEK
@ECHO -------------------------

copy download\SOBEK.jar "%USERPROFILE%"

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\SOBEK.lnk" -target  "%USERPROFILE%\SOBEK.jar"

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