# Python-Virtualenv-Activation-for-Windows-CMD
A batch scripts to automatically activate virtual environment for python virtualenv when entering working directory in windows command prompt.

## Introduction
On windows, you need to manually activate python virtualenv environment inside working directory. Using this script, you can automatically activate environment when entering your working directory and deactivate while leaving the working environment.

## Prerequisite
- Virtual environment should be named identical to your working directory to make this script work.

## Installation

```pwsh
curl "https://raw.githubusercontent.com/fiziechemi/pywin-venv/master/pywin-venv/install.cmd" -o "%USERPROFILR%\.pywin-venv\install.cmd" & "%USERPROFILR%\.pywin-venv\install.cmd"
```
