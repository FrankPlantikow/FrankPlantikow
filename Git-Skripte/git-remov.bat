@echo off

echo ***************************************
echo *                                     *
echo * Git Skript Local Repository löschen *
echo *        (c) Frank Plantikow          *
echo *                                     *
echo ***************************************
echo.

REM Aktuelles Verzeichnis anzeigen
echo Aktuelles Verzeichnis: %CD%

REM Überprüfen, ob das aktuelle Verzeichnis das gewünschte ist
set /p confirm=Ist dies das richtige Verzeichnis? (J/N): 
if /i not "%confirm%"=="J" (
    REM Benutzer nach einem neuen Verzeichnis fragen
    set /p newDir=Geben Sie das neue Verzeichnis ein (Leer lassen zum Abbrechen): 
    if not defined newDir (
        echo Skript wird abgebrochen. Kein neues Verzeichnis angegeben.
        exit /b
    )
    cd /d %newDir%
)

REM Sicherheitsabfrage für das Löschen des Verzeichnisses
set /p deleteConfirm=Sind Sie sicher, dass Sie das aktuelle Verzeichnis und das zugehörige Git-Repository löschen möchten? (J/N): 
if /i "%deleteConfirm%"=="J" (
    REM Löschen des Verzeichnisses
    cd ..
    rmdir /s /q "%CD%"
    echo Verzeichnis erfolgreich gelöscht.

    REM Entfernen des Git-Repositorys (inklusive verstecktes Verzeichnis)
    set /p removeGit=Sollen die Git-Dateien ebenfalls gelöscht werden? (J/N): 
    if /i "%removeGit%"=="J" (
        rmdir /s /q "%CD%\..\.git"
        echo Git-Repository erfolgreich gelöscht.
    ) else (
        echo Git-Repository nicht gelöscht.
    )
) else (
    echo Löschvorgang abgebrochen. Verzeichnis und Git-Repository wurden nicht gelöscht.
)

pause
