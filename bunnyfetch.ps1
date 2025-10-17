#!\usr\bin\env powershell
$scoopPath = "$env:USERPROFILE\scoop\apps"

$os = "os"
$osname = (Get-CimInstance Win32_OperatingSystem).Caption
$osname = $osname -replace '^Microsoft\s+', ''

$kn = "kn"
$knname = (Get-CimInstance Win32_OperatingSystem).Version

$sh = "sh"
$shname = "Powershell $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"

$pk = "pk"
$pkgnum = if (Test-Path $scoopPath) { (dir $scoopPath | Measure-Object).Count } else { 0 }

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
Write-Host "$pkgnum (scoop's)"
Write-Host ""
