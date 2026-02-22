#!\usr\bin\env powershell
$os = "os"
$osname = cat "$env:USERPROFILE\.cache\os"

$kn = "kn"
$knname = cat "$env:USERPROFILE\.cache\kn"

$sh = "sh"
$shname = cat "$env:USERPROFILE\.cache\sh"

$pk = "pk"
$pkgnum = cat "$env:USERPROFILE\.cache\pk"

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
