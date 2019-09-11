@ECHO OFF

title instalador

download\wget.exe -O download\Facepager.exe https://github.com/strohne/Facepager/releases/download/v4.0.4/Facepager_Setup_4_0_4.windows.exe

download\wget.exe -O download\OpenRefine.zip https://github.com/OpenRefine/OpenRefine/releases/download/3.2/openrefine-win-3.2.zip

download\wget.exe -O download\SOBEK.jar http://sobek.ufrgs.br/SobekTextMiner.jar

download\wget.exe -O download\R.exe  https://cran.r-project.org/bin/windows/base/R-3.6.1-win.exe

REM download\wget.exe -O download\RStudio.exe https://download1.rstudio.org/desktop/windows/RStudio-1.2.1335.exe

download\wget.exe -O download\RTools.exe  https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe

download\wget.exe -O download\RAnalyzer.zip https://github.com/ojonathacardoso/ranalyzer/archive/master.zip

download\wget.exe -O download\FacepagerPresets.zip https://github.com/ojonathacardoso/ranalyzer-adds/archive/master.zip

download\Java.exe /s

download\Facepager.exe /S

download\R.exe /SILENT

REM download\RStudio.exe /S

download\RTools.exe /SILENT

download\unzip.exe download\OpenRefine.zip -d download\OpenRefine

mkdir "%USERPROFILE%\OpenRefine"

xcopy download\OpenRefine "%USERPROFILE%\OpenRefine" /E

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\OpenRefine.lnk" -target  "%USERPROFILE%\OpenRefine\openrefine-3.2\"

REM del download\OpenRefine.zip

download\unzip.exe download\FacepagerPresets.zip -d download\FacepagerPresets

mkdir "%USERPROFILE%\Facepager\Presets\"

copy download\FacepagerPresets\ranalyzer-adds-master\Facepager\Presets\ "%USERPROFILE%\Facepager\Presets\"

REM del download\FacepagerPresets.zip 

download\unzip.exe download\RAnalyzer.zip -d download\RAnalyzer

REM del download\RAnalyzer.zip 

mkdir "%USERPROFILE%\R\ranalyzer"

copy download\SOBEK.jar "%USERPROFILE%"

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\SOBEK.lnk" -target  "%USERPROFILE%\SOBEK.jar"

copy download\RAnalyzer\ranalyzer-master\ %USERPROFILE%\R\ranalyzer

copy download\RAnalyzer\ranalyzer-master\install.R %USERPROFILE%

call download\shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\RAnalyzer.lnk" -target  "%USERPROFILE%\R\ranalyzer"