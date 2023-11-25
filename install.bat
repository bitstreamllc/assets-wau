@echo off

::::::::::::::::::::::::::::
:: Put WAU Arguments here ::
::::::::::::::::::::::::::::

SET arguments=-Silent -UseWhiteList -NotificationLevel None -UpdatesInterval Daily -ListPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/ -ModsPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/COFIG/MODS/


::::::::::::::::::::::::::::
:: Run Powershell Script  ::
::::::::::::::::::::::::::::
SET RunOncePath="C:\BITSTREAM\WAU\INSTALL\RUNONCE"
SET PowershellCmd=Start-Process powershell.exe -Verb RunAs -Argument '-noprofile -executionpolicy bypass -file "RUNONCE\Winget-AutoUpdate-Install.ps1" %arguments%
powershell -Command "& {Get-ChildItem -Path '%~dp0' -Recurse | Unblock-File; %PowershellCmd%'}"
