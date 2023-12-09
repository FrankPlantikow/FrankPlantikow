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

:end
