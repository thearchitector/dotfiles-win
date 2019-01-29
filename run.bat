@echo off

echo/
echo * ========================================= *
echo *                                           *
echo *  Windows Dotfile Environment Config v1.0  *
echo *                                           *
echo *  - @author: thearchitector                *
echo *  - @date: 1/28/2019                       *
echo * ========================================= *
echo/
echo The executing script will run a series of Windows registry edits to normalize
echo this machine to a set of standards. Prompts will provide options for various
echo stages of the process. No changes to the system will be made until the end of
echo the script, at which point it will read out your selected options and verify you
echo want to make the changes.
echo/
echo/

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' goto GETADMIN
goto EXECUTE

:GETADMIN
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
echo !!!!! Failed to validate administrator privleges. !!!!!
exit

:EXECUTE
pushd "%CD%"
CD /D "%~dp0"

:BEGIN
set choice=y
set /p choice=Begin system configuration? (y/n) [y]: 
if not %choice%==y if not %choice%==n goto BEGIN
if %choice%==n goto ABORT
echo/

:WEBSEARCH
set disablewebsearch=y
set /p disablewebsearch=- Disable online searches and results from Cortana? (y/n) [y]: 
if not %disablewebsearch%==y if not %disablewebsearch%==n goto WEBSEARCH
echo/

:FINDMYDEVICE
set disablefindmydevice=y
set /p disablefindmydevice=- Disable Find My Device? (y/n) [y]: 
if not %disablefindmydevice%==y if not %disablefindmydevice%==n goto FINDMYDEVICE
echo/

:IE
set disableie=y
set /p disableie=- Uninstall Internet Explorer 11? (y/n) [y]: 
if not %disableie%==y if not %disableie%==n goto FINDMYDEVICE
echo/

:DONOTTRACK
set enabledonottrack=y
set /p enabledonottrack=- Enable Do Not Track on Microsoft Edge? (y/n) [y]: 
if not %enabledonottrack%==y if not %enabledonottrack%==n goto DONOTTRACK
echo/

:LIVETILES
set disablelivetiles=y
set /p disablelivetiles=- Disable Live Tiles? (y/n) [y]: 
if not %disablelivetiles%==y if not %disablelivetiles%==n goto LIVETILES
echo/

:OFFLINEMAPS
set disableofflinemaps=y
set /p disableofflinemaps=- Disable Offline Maps? (y/n) [y]: 
if not %disableofflinemaps%==y if not %disableofflinemaps%==n goto OFFLINEMAPS
echo/

:ONEDRIVE
set disableonedrive=y
set /p disableonedrive=- Disable OneDrive? (y/n) [y]: 
if not %disableonedrive%==y if not %disableonedrive%==n goto ONEDRIVE
echo/

:BLOATWARE
set uninstallbloatware=y
set /p uninstallbloatware=- Uninstall all Microsoft bloatware? (y/n) [y]: 
if not %uninstallbloatware%==y if not %uninstallbloatware%==n goto BLOATWARE
echo/

:WIFISENSE
set disablewifisense=y
set /p disablewifisense=- Disable Wifi-Sense? (y/n) [y]: 
if not %disablewifisense%==y if not %disablewifisense%==n goto WIFISENSE
echo/

:MEDIAPLAYER
set disablemediaplayer=y
set /p disablemediaplayer=- Uninstall Windows Media Player? (y/n) [y]: 
if not %disablemediaplayer%==y if not %disablemediaplayer%==n goto MEDIAPLAYER
echo/

:PRIVACY
set lockdownprivacy=y
set /p lockdownprivacy=- Lockdown system data privacy? (y/n) [y]: 
if not %lockdownprivacy%==y if not %lockdownprivacy%==n goto PRIVACY
if %lockdownprivacy%==n goto REVIEW

    :TAILOREDADS
    set disabletailoring=y
    set /p disabletailoring=-- * Disable app personalization and tailored ad targeting? (y/n) [y]: 
    if not %disabletailoring%==y if not %disabletailoring%==n goto TAILOREDADS

    :LOCATION
    set disablelocation=y
    set /p disablelocation=-- * Disable location tracking? (y/n) [y]: 
    if not %disablelocation%==y if not %disablelocation%==n goto LOCATION

    :MICROPHONE
    set disablemicrophone=n
    set /p disablemicrophone=-- * Prevent app access to the microphone? (y/n) [n]: 
    if not %disablemicrophone%==y if not %disablemicrophone%==n goto MICROPHONE

    :APPNOTIFICATIONS
    set disableappnotifications=n
    set /p disableappnotifications=-- * Prevent app access to notifications? (y/n) [n]: 
    if not %disableappnotifications%==y if not %disableappnotifications%==n goto APPNOTIFICATIONS

    :INPUTPERSONALIZATION
    set disableinputpersonalization=y
    set /p disableinputpersonalization=-- * Disable speech and writing recognition? (y/n) [y]: 
    if not %disableinputpersonalization%==y if not %disableinputpersonalization%==n goto INPUTPERSONALIZATION

    :CONTACTS
    set disablecontactaccess=y
    set /p disablecontactaccess=-- * Prevent app access to your contacts? (y/n) [y]: 
    if not %disablecontactaccess%==y if not %disablecontactaccess%==n goto CONTACTS

    :CALENDAR
    set disablecalendaraccess=y
    set /p disablecalendaraccess=-- * Prevent app access to your calendar? (y/n) [y]: 
    if not %disablecalendaraccess%==y if not %disablecalendaraccess%==n goto CALENDAR

    :PHONEHISTORY
    set disablecallaccess=y
    set /p disablecallaccess=-- * Prevent app access to your call history (y/n) [y]: 
    if not %disablecallaccess%==y if not %disablecallaccess%==n goto PHONEHISTORY

    :PHONE
    set disablephoneaccess=y
    set /p disablephoneaccess=-- * Prevent app access to make phone calls? (y/n) [y]: 
    if not %disablephoneaccess%==y if not %disablephoneaccess%==n goto PHONE

    :MESSAGING
    set disablemessagingaccess=y
    set /p disablemessagingaccess=-- * Prevent app access to send SMS or MMS messages? (y/n) [y]: 
    if not %disablemessagingaccess%==y if not %disablemessagingaccess%==n goto MESSAGING

    :EMAIL
    set disableemailaccess=y
    set /p disableemailaccess=-- * Prevent app access to your email? (y/n) [y]: 
    if not %disableemailaccess%==y if not %disableemailaccess%==n goto EMAIL

    :RADIO
    set disableradioaccess=y
    set /p disableradioaccess=-- * Prevent app access to the radio? (y/n) [y]: 
    if not %disableradioaccess%==y if not %disableradioaccess%==n goto RADIO

    :OTHERDEVICES
    set disableothersaccess=y
    set /p disableothersaccess=-- * Prevent apps from communicating with unpaired devices? (y/n) [y]: 
    if not %disableothersaccess%==y if not %disableothersaccess%==n goto RADIO

    :MOTION
    set disablemotionaccess=y
    set /p disablemotionaccess=-- * Prevent app access to motion? (y/n) [y]: 
    if not %disablemotionaccess%==y if not %disablemotionaccess%==n goto RADIO

    :DIAGNOSTICS
    set disablediagnostics=y
    set /p disablediagnostics=-- * Disable feedback, telemetry, and diagnostics? (y/n) [y]: 
    if not %disablediagnostics%==y if not %disablediagnostics%==n goto DIAGNOSTICS
    echo/

:REVIEW
echo/
echo --------------------REVIEW--------------------
echo/
echo - Disable online searches and results from Cortana: %disablewebsearch% 
echo - Disable Find My Device: %disablefindmydevice% 
echo - Disable Internet Explorer 11: %disableie% 
echo - Enable Do Not Track on Microsoft Edge: %enabledonottrack% 
echo - Disable Live Tiles: %disablelivetiles% 
echo - Disable Offline Maps: %disableofflinemaps% 
echo - Disable OneDrive: %disableonedrive% 
echo - Uninstall Microsoft bloatware: %uninstallbloatware% 
echo - Disable Wifi-Sense: %disablewifisense% 
echo - Disable Windows Media Player: %disablemediaplayer% 

if %lockdownprivacy%==n goto PREVERIFY

echo - Lockdown system data privacy:
echo -- * Disable app personalization and tailored ad targeting: %disabletailoring% 
echo -- * Disable location tracking: %disablelocation% 
echo -- * Prevent app access to the microphone: %disablemicrophone% 
echo -- * Prevent app access to notifications: %disableappnotifications%
echo -- * Disable speech and writing recognition: %disableinputpersonalization% 
echo -- * Prevent app access to your contacts: %disablecontactaccess% 
echo -- * Prevent app access to your calendar: %disablecalendaraccess% 
echo -- * Prevent app access to your call history %disablecallaccess% 
echo -- * Prevent app access to make phone calls: %disablephoneaccess% 
echo -- * Prevent app access to send SMS or MMS messages: %disablemessagingaccess% 
echo -- * Prevent app access to your email: %disableemailaccess% 
echo -- * Prevent app access to the radio: %disableradioaccess% 
echo -- * Prevent apps from communicating with unpaired devices: %disableothersaccess% 
echo -- * Prevent app access to motion: %disablemotionaccess% 
echo -- * Disable feedback, telemetry, and diagnostics: %disablediagnostics% 

:PREVERIFY
echo/
echo --------------------REVIEW--------------------
echo/

:VERIFY
set choice=?
set /p choice=Does the above configuration look correct? (y/n): 
if not %choice%==y if not %choice%==n goto VERIFY
if %choice%==n goto ABORT

:VERIFY2
set choice=?
set /p choice=Are you sure you want to write the changes? (y/n): 
if not %choice%==y if not %choice%==n goto VERIFY2
if %choice%==n goto ABORT

echo/
echo/
echo *******************
echo/
echo Writing changes to system...
echo This may take a while; do not halt execution.
echo/
powershell -ExecutionPolicy Bypass -NoProfile -NoLogo -File "install.ps1" -IgnoreVerification -Options:%disablewebsearch%%disablefindmydevice%%disableie%%enabledonottrack%%disablelivetiles%%disableofflinemaps%%disableonedrive%%uninstallbloatware%%disablewifisense%%disablemediaplayer%%lockdownprivacy%%disabletailoring%%disablelocation%%disablemicrophone%%disableappnotifications%%disableinputpersonalization%%disablecontactaccess%%disablecalendaraccess%%disablecallaccess%%disablephoneaccess%%disablemessagingaccess%%disableemailaccess%%disableradioaccess%%disableothersaccess%%disablemotionaccess%%disablediagnostics%
echo/
echo *******************
echo/
echo System registry and packages have been successfully updated!
echo Environment configuration complete.
echo/
echo A reboot is recommended, as some changes might not be reflected until a reboot.

:REBOOT
set choice=?
set /p choice=Do you want to reboot now? (y/n): 
if not %choice%==y if not %choice%==n goto REBOOT
if %choice%==y shutdown /r /t 0
echo/
pause
exit

:ABORT
echo/
echo ----------------------------------------------
echo/
echo Configuration aborted.
echo/
pause
exit