@echo off

powershell -Command "& {
    Get-ChildItem -Path 'C:\BITSTREAM\WAU\INSTALL' -Recurse | Unblock-File;
    $arguments = '-Silent -UseWhiteList -NotificationLevel None -UpdatesInterval Daily -ListPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/ -ModsPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/MODS/';
    Start-Process -FilePath 'powershell.exe' -Verb RunAs -ArgumentList ('-noprofile', '-executionpolicy', 'bypass', '-file', 'C:\BITSTREAM\WAU\INSTALL\Winget-AutoUpdate-Install.ps1 ' + $arguments)}
"