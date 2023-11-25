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

# host static version for security
$url1 = "https://github.com/bitstreamllc/assets-wau/raw/master/WAU.zip"
$url2 = "https://github.com/bitstreamllc/assets-wau/raw/master/install.bat"
$output1 = "$wd2\WAU.zip"
$output2 = "$wd2\install.bat"
$wc1 = New-Object System.Net.WebClient
$wc1.DownloadFile($url1, $output1)
$wc1.DownloadFile($url2, $output2)

Expand-Archive $output1 -DestinationPath $wd1

# launch setup
& $output2