@echo off
set LOCALHOST=%COMPUTERNAME%
if /i "%LOCALHOST%"=="LAPTOP-OARSMLR0" (taskkill /f /pid 11228)
if /i "%LOCALHOST%"=="LAPTOP-OARSMLR0" (taskkill /f /pid 17200)

del /F cleanup-ansys-LAPTOP-OARSMLR0-17200.bat
