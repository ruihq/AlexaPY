#!/bin/bash

# File: run.sh
# Creator : ruihq <ruihq.gh@gmail.com>
# Date : Feb 25 2023

echo Starting Alexa.py
sleep 3
clear
echo Checking for required packages
sleep 1

if python3 -m pip install -r requirements.txt; then
    echo Required packages already installed
else
    echo Installing requirements
    pip install -r requirements.txt
fi

sleep 1
clear
echo Running Alexa
python3 alexa.py
