# install Winget Auto Update (WAU)

# set Script Root Directory (srd), Working Directories (wd)
$srd = "c:\BITSTREAM\WAU"
$wd1 = "$srd\INSTALL"
$wd2 = "$srd\RUNONCE"

# create directories
ForEach ($dir in ("INSTALL", "RUNONCE"))
  {
    New-Item -ItemType "directory" -Force -Path "$srd\$dir"
  }

# download assets
$url1 = "https://github.com/bitstreamllc/assets-wau/raw/master/WAU.zip"
$url2 = "https://github.com/bitstreamllc/assets-wau/raw/master/install.bat"
$output1 = "$wd2\WAU.zip"
$output2 = "$wd2\install.bat"
$wc1 = New-Object System.Net.WebClient
$wc1.DownloadFile($url1, $output1)
$wc1.DownloadFile($url2, $output2)

# unzip WAU.zip
Expand-Archive $output1 -DestinationPath $wd1 -Force

# set arguments, installer script path (isr)
$arguments = "-Silent", "-UseWhiteList", "-NotificationLevel", "None", "-UpdatesInterval", "Daily", "-ListPath", "https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/", "-ModsPath", "https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/MODS/"
$isr = "$wd1\Winget-AutoUpdate-Install.ps1"

# unblock files
Get-ChildItem -Path $wd1 -Recurse | Unblock-File

# construct all arguments as an array of strings
$allArguments = @('-noprofile', '-executionpolicy', 'bypass', '-file', $isr) + $arguments

# launch WAU installer with arguments
$commandString = "Start-Process powershell.exe -Verb RunAs -ArgumentList " + (($allArguments | foreach {"'$_'"}) -join ",")

# execute the command
Invoke-Expression $commandString
