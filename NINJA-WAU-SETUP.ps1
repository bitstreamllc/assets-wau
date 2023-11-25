# instalL Winget Auto Update (WAU)

# create directory and download latest ps1
ForEach ($dir in ("INSTALL", "LIST"))
  {
    New-Item -ItemType "directory" -Force -Path "c:\BITSTREAM\WAU\$dir"
  }

# host static version in S3 for security
$url1 = "https://raw.githubusercontent.com/Romanitho/Winget-AutoUpdate/main/Winget-AutoUpdate-Install.ps1"
$url1 = "https://raw.githubusercontent.com/Romanitho/Winget-AutoUpdate/main/Winget-AutoUpdate-Install.ps1"
$output1 = "c:\BITSTREAM\WAU\INSTALL\init-runonce.ps1"
$wc1 = New-Object System.Net.WebClient
$wc1.DownloadFile($url1, $output1)

# launch setup
& c:\TEMP-INSTALL-ADOBE-READER-DC\AcroRdrDC2200120085_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES