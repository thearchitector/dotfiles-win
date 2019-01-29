# dotfiles-win

This script will run a series of commands and registry edits to normalize a Windows machine to a set of defined standards. The CLI will provide prompts for all the possible configuration options. As a safety feature, the script runs in test mode until the end, at which point it asks for selections to be checked and writing to be confirmed. These scripts are intended to reduce system clutter by removing unwanted bloatware and features, as well as making an effort at closing some of the privacy breaches inherit in every clean Windows installation.

## Install

To run this script on your machine, download `run.bat` and `install.ps1` to the same directory, and then double click the `run` file. When configuration completes, you may delete those files.

## Options

This script will optionally executing all of the following:
  - Disable online searches and results from Cortana
  - Disable Find My Device
  - Uninstall Internet Explorer 11
  - Enable Do Not Track on Microsoft Edge
  - Disable Live Tiles
  - Disable Offline Maps
  - Disable OneDrive
  - Uninstall all Microsoft bloatware
    - BingNews
    - BingWeather
    - BingFinance
    - BingSports
    - Twitter
    - XboxApp
    - Sway
    - OneNote
    - MicrosoftOfficeHub
    - SkypeApp
  - Disable Wifi-Sense
  - Uninstall Windows Media Player
  - Disable app personalization and tailored ad targeting
  - Disable location tracking
  - Prevent app access to the microphone
  - Prevent app access to notifications 
  - Disable speech and writing recognition
  - Prevent app access to your contacts
  - Prevent app access to your calendar
  - Prevent app access to your call history
  - Prevent app access to make phone calls
  - Prevent app access to send SMS or MMS messages
  - Prevent app access to your email
  - Prevent app access to the radio
  - Prevent apps from communicating with unpaired devices
  - Prevent app access to motion
  - Disable feedback, telemetry, and diagnostics