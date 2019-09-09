@ECHO OFF

title instalador_tm

wget.exe -O download\Facepager.exe https://github.com/strohne/Facepager/releases/download/v4.0.4/Facepager_Setup_4_0_4.windows.exe

wget.exe -O download\OpenRefine.zip https://github.com/OpenRefine/OpenRefine/releases/download/3.2/openrefine-win-3.2.zip

wget.exe -O download\SOBEK.jar http://sobek.ufrgs.br/SobekTextMiner.jar

wget.exe -O download\R.exe  https://cran.r-project.org/bin/windows/base/R-3.6.1-win.exe

wget.exe -O download\RStudio.exe https://download1.rstudio.org/desktop/windows/RStudio-1.2.1335.exe

wget.exe -O download\RTools.exe  https://cran.r-project.org/bin/windows/Rtools/Rtools35.exe

wget.exe -O download\RAnalyzer.zip https://github.com/ojonathacardoso/ranalyzer/archive/master.zip

wget.exe -O download\FacepagerPresets.zip https://github.com/ojonathacardoso/ranalyzer-adds/archive/master.zip

download\Java.exe /s

download\Facepager.exe /S

download\R.exe /SILENT

download\RStudio.exe /S

download\RTools.exe /SILENT

unzip.exe download\OpenRefine.zip -d OpenRefine

mkdir %USERPROFILE%\OpenRefine

xcopy download\OpenRefine %USERPROFILE%\OpenRefine /E

call shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\OpenRefine.lnk" -target  "%USERPROFILE%\OpenRefine\openrefine-3.2\"

REM del download\OpenRefine.zip

unzip.exe download\FacepagerPresets.zip -d FacepagerPresets

copy download\FacepagerPresets\ranalyzer-adds-master\Facepager\Presets %USERPROFILE%\Facepager\Presets

REM del download\FacepagerPresets.zip 

unzip.exe download\RAnalyzer.zip -d RAnalyzer

REM del download\RAnalyzer.zip 

"C:\Program Files\R\R-3.6.1\bin\Rscript.exe" "download\RAnalyzer\ranalyzer-master\install.R"

mkdir %USERPROFILE%\R\ranalyzer

copy download\RAnalyzer\ranalyzer-master\ %USERPROFILE%\R\ranalyzer

copy download\SOBEK.jar %USERPROFILE%

call shortcut.bat -linkfile "%APPDATA%\Microsoft\Windows\Start Menu\SOBEK.lnk" -target  "%USERPROFILE%\SOBEK.jar"