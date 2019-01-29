param (
    [Parameter()][ValidateNotNullOrEmpty()][switch]$ignoreverification = $(Write-Host "`nDirection execution is disallowed in this context.`n" -ForegroundColor Red; throw ""),
    [Parameter()][string]$options
)

if ([string]::IsNullOrEmpty($options) -Or ($options -notmatch '^[yn]+$') -Or (($options.length -ne 26) -And ($options.length -ne 11))) {
    Write-Host "`nValid configuration options are required." -ForegroundColor Red;
    throw ""
}

$privacy = $true
if ($options.Substring(10, 1) -eq "n") {
    $privacy = $false
    $options = $options.Substring(0, 10)
}

$options = $options.ToCharArray()

# disablewebsearch
if ($options[0] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v ConnectedSearchUseWeb /t REG_DWORD /d 2 }
# disablefindmydevice
if ($options[1] -eq "y") { reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FindMyDevice" /f /v AllowFindMyDevice /t REG_DWORD /d 0 }
# disableie
if ($options[2] -eq "y") { dism /online /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64 }
# enabledonottrack
if ($options[3] -eq "y") { reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /f /v DoNotTrack /t REG_DWORD /d 1 }
# disablelivetiles
if ($options[4] -eq "y") { reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /f /v NoCloudApplicationNotification /t REG_DWORD /d 1 }
# disableofflinemaps
if ($options[5] -eq "y") { 
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /f /v AutoDownloadAndUpdateMapData /t REG_DWORD /d 0
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /f /v AllowUntriggeredNetworkTrafficOnSettingsPage /t REG_DWORD /d 0
}
# disableonedrive
if ($options[6] -eq "y") {
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /f /v DisableFileSyncNGSC /t REG_DWORD /d 1
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /f /v PreventNetworkTrafficPreUserSignIn /t REG_DWORD /d 1
}
# uninstallbloatware
if ($options[7] -eq "y") {
    Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
    Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
    Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
    Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
    Get-AppxPackage *.Twitter | Remove-AppxPackage
    Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
    Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
    Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
    Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
    Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
}
# disablewifisense
if ($options[8] -eq "y") { reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /f /v AutoConnectAllowedOEM /t REG_DWORD /d 0 }
# disablemediaplayer
if ($options[9] -eq "y") { dism /online /Disable-Feature /FeatureName:WindowsMediaPlayer }
# lockdownprivacy
if ($options[10] -eq "y") {
    # disabletailoring
    if ($options[11] -eq "y") {
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInf" /f /v Enabled /t REG_DWORD /d 0
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /f /v EnableWebContentEvaluation /t REG_DWORD /d 0
    }
    # disablelocation
    if ($options[12] -eq "y") {
        reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessLocation /t REG_DWORD /d 2
        reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LocationAndSensors" /f /v DisableLocation /t REG_DWORD /d 1
    }
    # disablemicrophone
    if ($options[13] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessMicrophone /t REG_DWORD /d 2 }
    # disableappnotifications
    if ($options[14] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessNotifications /t REG_DWORD /d 2 }
    # disableinputpersonalization
    if ($options[15] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\InputPersonalization" /f /v RestrictImplicitInkCollection /t REG_DWORD /d 1 }
    # disablecontactaccess
    if ($options[16] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessContacts /t REG_DWORD /d 2 }
    # disablecalendaraccess
    if ($options[17] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessCalendar /t REG_DWORD /d 2 }
    # disablecallaccess
    if ($options[18] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessCallHistory /t REG_DWORD /d 2 }
    # disablephoneaccess
    if ($options[19] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessPhone /t REG_DWORD /d 2 }
    # disablemessagingaccess
    if ($options[20] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessMessaging /t REG_DWORD /d 2 }
    # disableemailaccess
    if ($options[21] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessEmail /t REG_DWORD /d 2 }
    # disableradioaccess
    if ($options[22] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessRadios /t REG_DWORD /d 2 }
    # disableothersaccess
    if ($options[23] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsSyncWithDevices /t REG_DWORD /d 2 }
    # disablemotionaccess
    if ($options[24] -eq "y") { reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\AppPrivacy" /f /v LetAppsAccessMotion /t REG_DWORD /d 2 }
    # disablediagnostics
    if ($options[25] -eq "y") {
        reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /f /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1
        reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /f /v AllowTelemetry /t REG_DWORD /d 0
    }
}