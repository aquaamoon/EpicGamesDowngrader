# This script downgrades the Epic Games version to the previous live one using the third-party client Legendary.
# 1. Download Legendary.
# 2. Install with the provided manifest.
# 3. Create a small launch script for the game.

if ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544"))
{
    Write-Host -BackgroundColor red "Please run this script as a normal user, not as Administrator"
    Read-Host
    exit
}

Write-Host -BackgroundColor darkgreen "Downloading Legendary, please wait..."

# Download Legendary
curl.exe -LO https://github.com/whichtwix/legendary/releases/latest/download/legendary.exe

# This gives Legendary access to the Epic account: this is needed to download the game.
Write-Host -BackgroundColor darkgreen "Copy paste authorization code from browser here:"
.\legendary auth --disable-webview

# we have to do this first so the base URL can populate, as even putting it as an argument later is not enough.
.\legendary install 963137e4c29d4c79a81323b8fab03a40 --abort-if-any-installed

Invoke-WebRequest -Uri https://github.com/whichtwix/Data/raw/master/epic/manifests/963137e4c29d4c79a81323b8fab03a40_2026.6.5.manifest -UseBasicParsing -OutFile auman.manifest

.\legendary install 963137e4c29d4c79a81323b8fab03a40 --manifest auman.manifest -y

Write-Host "done"
Write-Host  -BackgroundColor darkgreen "Attempting to access the new Among Us folder through file explorer"
Write-Host  -BackgroundColor darkgreen "If not found, please find it manually at C:\Users\YOURNAME\Games\AmongUs or similar"

Set-Location -Path (Get-Item -Path $env:USERPROFILE)
explorer.exe Games\AmongUs

Write-Host  -BackgroundColor darkgreen "Making a quick start file in the Among Us folder: click this to start the game."
Write-Host  -BackgroundColor darkgreen "It will be named EpicGamesStarter.exe"
if (!(Test-Path "Games\AmongUs\EpicGamesStarter.exe")) 
{
    Invoke-WebRequest -Uri https://github.com/whichtwix/EpicGamesStarter/releases/latest/download/EpicGamesStarter.exe.zip -UseBasicParsing -OutFile Games\AmongUs\EpicGamesStarter.exe.zip
}
if (Test-Path "Games\AmongUs\EpicGamesStarter.exe.zip") 
{
    Expand-Archive -Path "Games\AmongUs\EpicGamesStarter.exe.zip" -DestinationPath "Games\AmongUs" -Force
    Remove-Item "Games\AmongUs\EpicGamesStarter.exe.zip"
}

Read-Host
