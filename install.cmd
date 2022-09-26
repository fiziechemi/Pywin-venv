@echo off

if not exist %USERPROFILE%\.pywin-venv\ (
    mkdir %USERPROFILE%\.pywin-venv\
)
curl https://raw.githubusercontent.com/fiziechemi/pywin-venv/master/pywin-venv/init.bat -o %USERPROFILE%\.pywin-venv\init.bat
curl https://raw.githubusercontent.com/fiziechemi/pywin-venv/master/pywin-venv/pyenv.bat -o %USERPROFILE%\.pywin-venv\pyenv.bat

reg query "HKLM\Software\Microsoft\Command Processor" /v AutoRun >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    goto editReg
) else (
    goto addReg
)

:editReg

for /f "tokens=3" %%a in ('reg query "HKLM\Software\Microsoft\Command Processor"  /V AutoRun  ^|findstr /ri "REG_EXPAND_SZ"') do set regValue=%%a
reg delete "HKLM\Software\Microsoft\Command Processor" /v AutoRun /f >nul 2>nul
if not %ERRORLEVEL% EQU 0 (
    echo ERROR: Access is denied. Please execute code as an administrator.
    goto end
)
reg add "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%%USERPROFILE%%\.pywin-venv\init.bat" /f >nul 2>nul
if not %ERRORLEVEL% EQU 0 (
    echo ERROR: Access is denied. Please execute code as an administrator.
) else (
    echo The installation completed successfully.
    if "%regValue%"=="%%USERPROFILE%%\.pywin-venv\init.bat" (
        echo AutoRun registry changed in "HKLM\Software\Microsoft\Command Processor".
        echo               [Name]  [Type]        [Data]
        echo Old registry: Autorun REG_EXPAND_SZ "%regValue%"
        echo New registry: Autorun REG_EXPAND_SZ "%%USERPROFILE%%\.pywin-venv\init.bat"
    )
)
goto end

:addReg

reg add "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d %%USERPROFILE%%\.pywin-venv\init.bat /f >nul 2>nul
if not %ERRORLEVEL% EQU 0 (
    echo ERROR: Access is denied. Please execute code as an administrator.
) else (
    echo The installation completed successfully.
)

:end

start /b del %USERPROFILE%\install.cmd
