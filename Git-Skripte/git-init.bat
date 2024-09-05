@echo off
cls
echo ******************************
echo *                            *
echo * Git inizalisierungs Skript *
echo * (c) Frank Plantikow        *
echo *                            *
echo ******************************
echo.

REM Aktuelles Verzeichnis anzeigen
echo Aktuelles Verzeichnis: %CD%

REM Überprüfen, ob das aktuelle Verzeichnis das gewünschte ist
set /p confirm=Ist dies das richtige Verzeichnis? (J/N): 
if /i not "%confirm%"=="J" (
    REM Benutzer nach einem neuen Verzeichnis fragen
    set /p newDir=Geben Sie das neue Verzeichnis ein (Leer lassen zum Abbrechen): 
rem    if not defined newDir (
rem        echo Skript wird abgebrochen. Kein neues Verzeichnis angegeben.
rem        exit /b
    )
    cd /d %newDir%
)

REM Git initialisieren
git init
git add README.md
REM Die Änderungen hinzufügen und committen
git add .
git commit -m "Initialer Commit"

REM Benutzer nach GitHub Repository URL fragen
set /p repoUrl=Gib die GitHub Repository URL ein: 

REM Push zu einem Remote-Repository
git remote add origin %repoUrl%
git branch -M master
git push -u origin master

echo Repository erfolgreich initialisiert, committet und auf GitHub hochgeladen.

