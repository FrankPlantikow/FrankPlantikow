@echo off

cd /d D:\Documents\Meine-eBücher
echo Updating and uploading Meine-eBücher...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\BauProjekte
echo Updating and uploading BauProjekte...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\FrankPlantikow
echo Updating and uploading FrankPlantikow...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\git-bsp
echo Updating and uploading git-bsp...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\Radageraet
echo Updating and uploading Radageraet...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\Raumklima
echo Updating and uploading Raumklima...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine GitHub-Projekt\Wetterstation
echo Updating and uploading Wetterstation...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

cd /d D:\Documents\Meine-Arduino
echo Updating and uploading Meine-Arduino...
git add .
git commit -m "Automated commit: Update and upload"
git pull
git push

echo All repositories updated and uploaded successfully.
