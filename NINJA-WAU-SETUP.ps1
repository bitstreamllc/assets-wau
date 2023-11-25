# install Winget Auto Update (WAU)

# create directories and download assets
ForEach ($dir in ("INSTALL", "LIST"))
  {
    New-Item -ItemType "directory" -Force -Path "c:\BITSTREAM\WAU\$dir"
  }

# host static version for security
$url1 = "https://raw.githubusercontent.com/Romanitho/Winget-AutoUpdate/main/Winget-AutoUpdate-Install.ps1"
$output1 = "c:\BITSTREAM\WAU\INSTALL\init-runonce.ps1"
$wc1 = New-Object System.Net.WebClient
$wc1.DownloadFile($url1, $output1)

# launch setup
& powershell.exe -ep bypass -file c:\BITSTREAM\WAU\INSTALL\init-runonce.ps1 `
-Silent -UseWhiteList -NotificationLevel None -UpdatesInterval Daily `
-ListPath 