# Python-Virtualenv-Activation-for-Windows-CMD
A batch scripts to automatically activate virtual environment for python virtualenv when entering working directory in windows command prompt.

## Introduction
On windows, you need to manually activate python virtualenv environment inside working directory. Using this script, you can automatically activate environment when entering your working directory and deactivate while leaving the working environment.

## Prerequisite
- Virtual environment should be named identical to your working directory to make this script work.

## Installation
1. copy .pywin-venv to your user directory open command prompt and enter regedit
2. go to \HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
3. click Edit->New->Expandable String Value
4. set Name to AutoRun and Data to the init.bat file path and save
