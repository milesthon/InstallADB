@ECHO OFF
CHCP 65001>NUL
TITLE Install ADB
MODE 80,9
COLOR f9

ECHO.
curl -L https://dl.google.com/android/repository/platform-tools-latest-windows.zip -o "%Temp%\platform-tools-latest-windows.zip"
cls
ECHO.
PowerShell -Command "Expand-Archive -Path "C:\Users\%UserName%\AppData\Local\Temp\platform-tools-latest-windows.zip" -DestinationPath "C:\Users\%UserName%\AppData\Local\Temp\platform-tools-latest-windows" -Force"
cls
RD "C:\ADB" /S /Q                                                                   2>nul >nul
MD "C:\ADB"                                                                         2>nul >nul
XCOPY /Y /Q /S /E "%Temp%\platform-tools-latest-windows" "C:\ADB"                   2>nul >nul
FOR /F "usebackq tokens=2,*" %%A in (`reg query HKCU\Environment /v PATH`) DO set temp_path=%%B
echo %temp_path%|find "ADB">nul&&cls||setx PATH "C:\ADB\platform-tools;%temp_path%" 2>nul >nul
CHCP 866>NUL
ECHO.&ECHO   Install OK.&ECHO.&ADB version&ECHO.&Pause&Exit /b