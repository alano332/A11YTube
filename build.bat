@echo off
set APP_VERSION=0.3.4
echo Building A11YTube v%APP_VERSION%...

REM Cleaning up previous build artifacts
echo Cleaning previous builds...
if exist build rd /s /q build
if exist dist rd /s /q dist

REM Running PyInstaller
echo Starting PyInstaller build process...
python -m PyInstaller --noconfirm A11YTube.spec

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ########## BUILD FAILED ##########
    echo An error occurred during the build process.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ########## BUILD SUCCESSFUL ##########
echo Version: %APP_VERSION%
echo Output located in: dist\A11YTube\
echo.
pause
