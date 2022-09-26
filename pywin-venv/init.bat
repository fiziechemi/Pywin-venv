@echo off
doskey cd=echo off $T cd $*$T "%~dp0pyenv.bat" start $T echo on

for %%I in (.) do set FolderName=%%~nxI
if exist "%CD%\%FolderName%\Scripts\activate.bat" (
  if not "%VIRTUAL_ENV%"=="%CD%\%FolderName%" (
    if not "%VIRTUAL_ENV%"=="" (
        deactivate
    )
    goto activateEnv
  )
)
goto noEnv

:activateEnv

"%SystemRoot%\System32\chcp.com" > tmpFile.txt
set /p vv=<tmpFile.txt
del tmpFile.txt

for %%a in (%vv%) do (
    if not 1%%a NEQ +1%%a (
        set _OLD_CODEPAGE=%%a
    )
)
set vv=

set VIRTUAL_ENV=%CD%\%FolderName%

if not defined PROMPT set PROMPT=$P$G

if defined _OLD_VIRTUAL_PROMPT set PROMPT=%_OLD_VIRTUAL_PROMPT%
if defined _OLD_VIRTUAL_PYTHONHOME set PYTHONHOME=%_OLD_VIRTUAL_PYTHONHOME%

set _OLD_VIRTUAL_PROMPT=%PROMPT%
set PROMPT=(%FolderName%) %PROMPT%

if defined PYTHONHOME set _OLD_VIRTUAL_PYTHONHOME=%PYTHONHOME%
set PYTHONHOME=

if defined _OLD_VIRTUAL_PATH set PATH=%_OLD_VIRTUAL_PATH%
if not defined _OLD_VIRTUAL_PATH set _OLD_VIRTUAL_PATH=%PATH%

set PATH=%VIRTUAL_ENV%\Scripts;%PATH%
set VIRTUAL_ENV_PROMPT=(%FolderName%) 

if defined _OLD_CODEPAGE (
    "%SystemRoot%\System32\chcp.com" %_OLD_CODEPAGE% > nul
    set _OLD_CODEPAGE=
)
set FolderName=
echo.

:noEnv
