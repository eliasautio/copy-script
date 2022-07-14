echo off
cls
echo +--------------------------------------------------+
echo This script copies files and folders from the computer
echo it is run from, to a folder from where it is run.
echo +--------------------------------------------------+
pause


:: Set user home folder as target folder.
set TARGETDIR=%~dp0\%username%

:: Set path for command Robocopy.
:: It is included in Windows and already set in PATH, so no need to set full path.
set ROBOCOPY="robocopy"

:: Set users home folder.
set USERDIR=C:\Users\%username%

:: Set path for Downloads folder.
set DOWNLOADS=Downloads

:: Set path for Desktop folder.
set DESKTOP=Desktop

:: Set path for Documents folder.
set DOCUMENTS=Documents

:: Set path for Pictures folder.
set PICTURES=Pictures

:: Set path for Favorites folder.
set FAVORITES=Favorites

:: Set path for Signatures folder. Finnish path.
set SIGNATURES_FI=AppData\Roaming\Microsoft\Allekirjoitukset

:: Set path for Signatures folder. English path.
set SIGNATURES_EN=AppData\Roaming\Microsoft\Signatures

:: Set path for Roaming Address cache. Formerly known as NK2 file. 
set NK2=AppData\Local\Microsoft\Outlook\RoamCache

:: Check if Finnish language signatures folder exists.
:: If it does not exist, use English language folder.
IF EXIST "%USERDIR%\%SIGNATURES_FI%" (
    set SIGNATURES=%SIGNATURES_FI%
) ELSE (
    set SIGNATURES=%SIGNATURES_EN%
)

:: Use TARGETDIR to make a directory named after current users username.
:: Makes a subdirectory in the folder that the script is run from.
md "%TARGETDIR%"

echo +--------------------------------------------------+
echo Copying of %USERDIR%\%DOWNLOADS% starts
echo +--------------------------------------------------+
pause
%ROBOCOPY% "%USERDIR%\%DOWNLOADS%" "%TARGETDIR%\Downloads" *.* /MIR /XJ
echo +--------------------------------------------------+
echo Copying of %USERDIR%\%DOWNLOADS% done
echo +--------------------------------------------------+