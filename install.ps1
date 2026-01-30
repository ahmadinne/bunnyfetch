#!/usr/bin/env powershell

# 1. Create path and add it to environment
$path = "$env:USERPROFILE\Scripts"
if (!(Test-Path $path)) {
	mkdir $path
	[System.Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";$path", "User")
	$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "User")
}

Copy-Item -Path "bunnyfetch.ps1" -Destination "${path}\bunnyfetch.ps1" -Force
Copy-Item -Path "bunnyfetches.ps1" -Destination "${path}\bunnyfetches.ps1" -Force

# 2. Create autostart to run bunnyfetches every start
# --- Configurations ---
$taskname = "Bunnyfetches"
$taskpath = "$env:USERPROFILE\Scripts\bunnyfetches.ps1"
$taskdesc = "Autorun bunnyfetches at start"
$taskfold = "\Autostart"

# --- Components ---
$action = New-ScheduledTaskAction `
	-Execute "powershell.exe" `
	-Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$taskpath`""
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Highest

$settings = New-ScheduledTaskSettingsSet `
	-AllowStartIfOnBatteries:$true `
	-DontStopIfGoingOnBatteries:$true `
	-ExecutionTimeLimit ([TimeSpan]::Zero) `
	-StartWhenAvailable:$false `

# --- Ensure the folder exist ---
$service = New-Object -ComObject "Schedule.Service"
$service.Connect()
$rootFolder = $service.GetFolder("\")
try {
	$null = $rootFolder.GetFolder("Autostart")
} catch {
	$rootFolder.CreateFolder("Autostart") | Out-Null
}

# --- Remove old task if exist ---
try {
	$existing = Get-ScheduledTask -TaskName $taskname -ErrorAction Stop
	if ($existing) {
		Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
		Write-Host "Old task '$taskname' removed."
	}
} catch {
	Write-Host "No existing task found, creating a new one..."
}

# --- Register Task ---
Register-ScheduledTask `
	-TaskName $taskname `
	-TaskPath $taskfold `
	-Action $action `
	-Trigger $trigger `
	-Principal $principal `
	-Settings $settings `
	-Description $taskdesc

if ($?) { Write-Host "Task '$taskname' successfully registered in folder '$taskfold'." }
./bunnyfetches.ps1
