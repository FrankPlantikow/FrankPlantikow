@echo off
setlocal enabledelayedexpansion

set "startFolder=C:\"

for /r "%startFolder%" %%i in (.) do (
    if "%%~nxi"=="FrankPlantikow" (
        set "resultPath=%%i"
        goto :found
    )
)

echo Verzeichnis nicht gefunden
goto :end

:found
echo Verzeichnis gefunden: %resultPath%
set "base_directory=FrankPlantikow"

rem Erstelle Hauptverzeichnis, wenn es nicht existiert
if not exist "%base_directory%" mkdir "%base_directory%"

rem Erstelle Unterverzeichnisse im Hauptverzeichnis
for %%i in ("Meine GitHub-Projekt" "Meine-eBuecher" "Meine-Arduino") do (
    if not exist "%base_directory%\%%i" mkdir "%base_directory%\%%i"

    rem Wenn es sich um "Meine GitHub-Projekt" handelt, erstelle weitere Unterverzeichnisse
    if "%%i"=="Meine GitHub-Projekt" (
        for %%j in ("BauProjekte" "FrankPlantikow" "git-bsp" "Radageraet" "Raumklima" "Wetterstation") do (
            if not exist "%base_directory%\%%i\%%j" mkdir "%base_directory%\%%i\%%j"
        )
    )
)

echo Verzeichnisse erfolgreich erstellt.

:end
