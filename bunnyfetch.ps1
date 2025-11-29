#!\usr\bin\env powershell
$os = "os"
$osname = (Get-CimInstance Win32_OperatingSystem).Caption
$osname = $osname -replace '^Microsoft\s+', ''

$kn = "kn"
$knname = (Get-CimInstance Win32_OperatingSystem).Version

$sh = "sh"
$shname = "Powershell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"

$pk = "pk"
$pkgnum = (Winget list).count

# Starto
Write-Host ""
Write-Host "     _"
Write-Host "    / ) _    " -nonewline
Write-Host "$os  " -foregroundcolor red -nonewline
Write-Host "$osname"

Write-Host "   ( / (\)   " -nonewline
Write-Host "$kn  " -foregroundcolor yellow -nonewline
Write-Host "$knname"

Write-Host "   ( . .)    " -nonewline
Write-Host "$sh  " -foregroundcolor green -nonewline
Write-Host "$shname"

Write-Host "   c(" -nonewline
Write-Host '"' -foregroundcolor red -nonewline
Write-Host ")(" -nonewline
Write-Host '"' -foregroundcolor red -nonewline
Write-Host ")   " -nonewline
Write-Host "$pk  " -foregroundcolor blue -nonewline
Write-Host "$pkgnum (Winget's)"
Write-Host ""
