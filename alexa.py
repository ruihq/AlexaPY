# File: alexa.py
# Creator : ruihq <ruihq.gh@gmail.com>
# Date : Feb 25 2023

import speech_recognition as sr
import pyttsx3

r = sr.Recognizer()
engine = pyttsx3.init()

def assistant():
    with sr.Microphone() as source:
        print("How can I assist you?")
        audio = r.listen(source)
        
        try:
            text = r.recognize_google(audio)
            print("You said: " + text)
            engine.say("You said: " + text)
            engine.runAndWait()
            
        except sr.UnknownValueError:
            print("Sorry, I did not understand that.")
            engine.say("Sorry, I did not understand that.")
            engine.runAndWait()
            
        except sr.RequestError:
            print("Sorry, there was an error processing your request.")
            engine.say("Sorry, there was an error processing your request.")
            engine.runAndWait()

assistant()

