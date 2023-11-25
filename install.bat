@echo off

SET arguments=-Silent -NotificationLevel None -UpdatesInterval Daily -ListPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/ -ModsPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/COFIG/MODS/
SET ScriptPath=C:\BITSTREAM\WAU\INSTALL\Winget-AutoUpdate-Install.ps1

powershell.exe -NoProfile -ExecutionPolicy bypass -File %ScriptPath% %arguments%