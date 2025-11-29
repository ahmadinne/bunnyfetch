#!\usr\bin\env powershell
$path = "$env:USERPROFILE\.cache\bunnyfetch_cache"
(Winget list).count > $path
