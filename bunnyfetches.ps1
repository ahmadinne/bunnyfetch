#!\usr\bin\env powershell
$cachePath = "$env:USERPROFILE\.cache"
$os = "$cachePath\os"
$kn = "$cachePath\kn"
$sh = "$cachePath\sh"
$pk = "$cachePath\pk"

# Operating System Name
$osname = (Get-CimInstance Win32_OperatingSystem).Caption
$osname = $osname -replace '^Microsoft\s+', ''
$osname > $os

# Kernel Name
$knname = (Get-CimInstance Win32_OperatingSystem).Version
$knname > $kn

# Shell Version
$shname = "Powershell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"
$shname > $sh

# Winget Package Count
(Winget list).count > $pk
