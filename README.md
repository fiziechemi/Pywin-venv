# Python-Virtualenv-Auto-Activation-for-Windows-CMD
A batch scripts to automatically activate virtual environment using Python virtualenv when entering working directory in windows command prompt.

## Introduction
On windows, you need to manually activate python virtualenv environment inside working directory. Using this script, you can automatically activate environment when entering your working directory and deactivate while leaving the working environment.

## Prerequisite
- Virtual environment should be named identical to your working directory to make this script work.

## Installation
The installation of pywin-venv is super easy. Just run the following installation command as administrator in a Command Prompt terminal:
```pwsh
curl "https://raw.githubusercontent.com/fiziechemi/pywin-venv/master/install.cmd" -o "%USERPROFILE%\install.cmd" & "%USERPROFILE%\install.cmd"
```
