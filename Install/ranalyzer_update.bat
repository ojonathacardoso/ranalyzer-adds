@ECHO OFF

title Instalador - RAnalyzer


@ECHO -------------------------
@ECHO Fazendo o download do RAnalyzer
@ECHO -------------------------

download\wget.exe -O download\RAnalyzer.zip https://github.com/ojonathacardoso/ranalyzer/archive/master.zip

@ECHO -------------------------
@ECHO Atualizando o RAnalyzer
@ECHO -------------------------

download\unzip.exe download\RAnalyzer.zip -d download\RAnalyzer

mkdir "%USERPROFILE%\R\ranalyzer"

xcopy download\RAnalyzer\ranalyzer-master "%USERPROFILE%\R\ranalyzer" /E /y

"C:\R\bin\Rscript.exe" "%USERPROFILE%\R\ranalyzer\install.R"

@ECHO -------------------------
@ECHO Instalação concluída
@ECHO -------------------------