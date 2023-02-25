@echo off
REM File: run.bat
REM Creator: ruihq <ruihq.gh@gmail.com>
REM Date: Feb 25 2023

echo Starting Alexa.py
timeout /t 3
cls
echo Checking for required packages
timeout /t 1

for /f "tokens=* delims=" %%i in ('python -m pip freeze') do (
  echo %%i | findstr /C:"pyttsx3" > nul && set "PYTTSX3_INSTALLED=true"
  echo %%i | findstr /C:"SpeechRecognition" > nul && set "SPEECHRECOGNITION_INSTALLED=true"
)

if "%PYTTSX3_INSTALLED%"=="true" (
  if "%SPEECHRECOGNITION_INSTALLED%"=="true" (
    echo Required packages already installed
  ) else (
    echo Installing requirements
    pip install -r requirements.txt
  )
) else (
  echo Installing requirements
  pip install -r requirements.txt
)

timeout /t 1
cls
echo Running Alexa
python alexa.py
