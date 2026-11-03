@echo off
setlocal EnableExtensions

echo ==========================================
echo        Git Synchronisation
echo ==========================================
echo.

REM Pruefen, ob Git installiert ist
where git >nul 2>&1
if errorlevel 1 (
    echo FEHLER: Git wurde nicht gefunden.
    echo Bitte Git installieren bzw. PATH pruefen.
    pause
    exit /b 1
)

REM Pruefen, ob aktuelles Verzeichnis ein Git-Repository ist
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo FEHLER: Dieses Verzeichnis ist kein Git-Repository.
    pause
    exit /b 1
)

REM Zum Root-Verzeichnis des Repositories wechseln
for /f "delims=" %%A in ('git rev-parse --show-toplevel') do set "REPO_DIR=%%A"

cd /d "%REPO_DIR%"

REM Aktuellen Branch ermitteln
for /f "delims=" %%A in ('git branch --show-current') do set "BRANCH=%%A"

if "%BRANCH%"=="" (
    echo FEHLER: Kein aktiver Git-Branch gefunden.
    pause
    exit /b 1
)

echo Repository:
echo %REPO_DIR%
echo.
echo Branch:
echo %BRANCH%
echo.

echo ==========================================
echo Aktueller Status
echo ==========================================
git status --short
echo.

echo ==========================================
echo Lokale Aenderungen hinzufuegen
echo ==========================================
git add .

echo.
echo ==========================================
echo Aenderungen pruefen
echo ==========================================

git diff --cached --quiet

if errorlevel 1 (
    echo Aenderungen gefunden.

    echo.
    echo ==========================================
    echo Commit erstellen
    echo ==========================================

    git commit -m "Automatischer Sync %date% %time%"

    if errorlevel 1 (
        echo.
        echo FEHLER beim Commit.
        pause
        exit /b 1
    )
) else (
    echo Keine lokalen Aenderungen vorhanden.
)

echo.
echo ==========================================
echo Remote-Aenderungen holen
echo ==========================================

git pull --rebase origin "%BRANCH%"

if errorlevel 1 (
    echo.
    echo ==========================================
    echo FEHLER beim Git Pull
    echo ==========================================
    echo.
    echo Moeglicherweise gibt es einen Merge-Konflikt.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Aenderungen hochladen
echo ==========================================

git push origin "%BRANCH%"

if errorlevel 1 (
    echo.
    echo ==========================================
    echo FEHLER beim Git Push
    echo ==========================================
    pause
    exit /b 1
)

echo.
echo ==========================================
echo       Synchronisation abgeschlossen
echo ==========================================
echo.

pause
endlocal
