@echo off

::::::::::::::::::::::::::::
:: Put WAU Arguments here ::
::::::::::::::::::::::::::::

SET arguments=-Silent -NotificationLevel None -UpdatesInterval Daily -ListPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/ -ModsPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/COFIG/MODS/


::::::::::::::::::::::::::::
:: Run Powershell Script  ::
::::::::::::::::::::::::::::

powershell -Command "& {Get-ChildItem -Path 'C:\BITSTREAM\WAU\INSTALL\' -Recurse | Unblock-File; Start-Process powershell.exe -Verb RunAs -Argument '-noprofile -executionpolicy bypass -file C:\BITSTREAM\WAU\INSTALL\Winget-AutoUpdate-Install.ps1 %arguments%'}"