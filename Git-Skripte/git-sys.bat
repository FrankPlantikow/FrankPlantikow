@echo off
echo ***********************************************
echo *                                             *
echo * Git Skript Local Repository synchronisieren *
echo *             (c) Frank Plantikow             *
echo *                                             *
echo ***********************************************
echo.
cd /d D:\Documents\Meine-eBuecher
echo Aktualisiere und lade Meine-eBuecher hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\BauProjekte
echo Aktualisiere und lade BauProjekte hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\FrankPlantikow
echo Aktualisiere und lade FrankPlantikow hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\git-bsp
echo Aktualisiere und lade git-bsp hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\Radageraet
echo Aktualisiere und lade Radageraet hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\Raumklima
echo Aktualisiere und lade Raumklima hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-GitHub-Projekt\Wetterstation
echo Aktualisiere und lade Wetterstation hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

cd /d D:\Documents\Meine-Arduino
echo Aktualisiere und lade Meine-Arduino hoch...
git add .
git commit -m "Automatischer Commit: Update und Hochladen"
git pull
git push

echo Alle Repositories erfolgreich aktualisiert und hochgeladen.
