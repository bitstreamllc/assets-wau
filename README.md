# assets-wau
#### Static installer and CI assets for [Winget-Auto-Update](https://github.com/Romanitho/Winget-AutoUpdate)(WAU)

## Current Local Version
`1.18.3`

## Installer Parameters
### `-Silent`

### `-UseWhiteList` 
without: defaults to update all installed apps, excluding custom blacklist (`CONFIG/APPS/excluded_apps.txt`)

### `-NotificationLevel None` 
[Full, Success only, None] hides systray icon, does not notify user of successful update

### `-UpdatesInterval Daily`
[Daily, BiDaily, Weekly, BiWeekly, Monthly or Never]

### `-ListPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/CONFIG/APPS/ `
location (Local/UNC/URL/AzureBlob) of white/blacklist **directory** (`CONFIG/APPS/`)

### `-ModsPath https://raw.githubusercontent.com/bitstreamllc/assets-wau/master/COFIG/MODS/`
location (Local/UNC/URL/AzureBlob) of mods **directory** (`CONFIG/MODS/`)

## Useful Additional (Unused) Parameters
### `-UpdatesAtLogon` # process updates at user logon

### `-UpdatesAtTime` # set WAU runtime, defaults to `6AM`

## How Assets Work
WAU is configured to pull the following assets from this repo at runtime. 

### `CONFIG/APPS/included_apps.txt`
Whitelist of applications to manage. Enter Winget [AppID](https://winget.run)s, one per line. 

### `CONFIG/APPS/excluded_apps.txt` (unused)
*Conflicts with `-UseWhiteList`*

Blacklist of applications to manage. Enter Winget [AppID](https://winget.run)s, one per line. 

### `CONFIG/MODS/`
Directory containing "mods" (see description below). 

## Mods
The mods folder is referenced by WAU at various stages, to provide runtime scripts or arguments.

### File syntax
`<AppID><suffix>`

#### Example
[`Adobe.Acrobat.Reader.64-bit-override.txt`](https://github.com/bitstreamllc/assets-wau/blob/master/CONFIG/MODS/Adobe.Acrobat.Reader.64-bit-override.txt)

#### AppID
Find AppIDs [here](https://winget.run).

#### Suffix

##### Overrides
`-override.txt`: provide [Winget `--override` functionality](https://www.techwatching.dev/posts/winget-override)(passes string/arguments to installer)

##### Scripts
`-preinstall.ps1`: runs prior to install/update
`-install.ps1`: runs during install/update
`-installed.ps1`: runs after confirmed install/update

## White/Blacklist Generator (GUI)
[Winget-Install-GUI](https://github.com/Romanitho/Winget-Install-GUI)

## Updating WAU
WAU auto-updates itself by default. See below for instructions on updating installer manually.

### Manual Procedure
Download, unzip latest release:
  - [Releases](https://github.com/Romanitho/Winget-AutoUpdate/releases)
  - [WAU.zip](https://github.com/Romanitho/Winget-AutoUpdate/releases/latest/download/WAU.zip) (direct download)
Commit WAU.zip to root of repo (overwrite)