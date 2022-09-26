@echo off
for %%I in (.) do set FolderName=%%~nxI
if exist "%CD%\%FolderName%\Scripts\activate.bat" (
  if not "%VIRTUAL_ENV%"=="%CD%\%FolderName%" (
    if not "%VIRTUAL_ENV%"=="" (
      deactivate
    )
    "%CD%\%FolderName%\Scripts\activate" start
  )
) else (
  if not "%VIRTUAL_ENV%"=="" (
    echo.
    deactivate
  )
)
