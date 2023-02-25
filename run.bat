@echo off
REM File: run.bat
REM Creator : ruihq <ruihq.gh@gmail.com>
REM Date : Feb 25 2023

echo Starting Alexa.py
timeout /t 3 >nul
cls
echo Checking for required packages
timeout /t 1 >nul

python -m pip freeze | findstr /c:"pyttsx3" >nul
set pyttsx3=%errorlevel%
python -m pip freeze | findstr /c:"SpeechRecognition" >nul
set SpeechRecognition=%errorlevel%

if %pyttsx3% EQU 0 && %SpeechRecognition% EQU 0 (
    echo Required packages already installed
) else (
    echo Installing requirements
    pip install -r requirements.txt
)

timeout /t 1 >nul
cls
echo Running Alexa
python alexa.py

