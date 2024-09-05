@echo off
cls
rem Aktuellen Branch speichern
echo Aktuellen Branch speichern
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set "current_branch=%%i"

rem Änderungen vom Remote holen
echo Änderungen vom Remote holen
git fetch

rem Lokale und Remote-Branches vergleichen
echo Lokale und Remote-Branches vergleichen
git diff %current_branch% origin/%current_branch% > nul

rem Wenn Unterschiede vorhanden sind, pullen und pushen
echo Wenn Unterschiede vorhanden sind, pullen und pushen
if %errorlevel% neq 0 (
    echo Lokale Änderungen gefunden. Pullen und Pushen...
    
    rem Pull von Remote
    git pull origin %current_branch%
    
    rem Push zu Remote
    git push origin %current_branch%
    
    echo Abgleich abgeschlossen.
) else (
    echo Keine lokalen Änderungen gefunden. Kein Abgleich erforderlich.
)

rem Wechsle zum OnAir-Zweig
git checkout OnAir

rem Falls du die neuesten Änderungen vom Remote-Repository (GitHub) holen möchtest, aktiviere die folgende Zeile:
git pull origin OnAir

echo Du befindest dich jetzt auf dem OnAir-Zweig.
git branch
exit
