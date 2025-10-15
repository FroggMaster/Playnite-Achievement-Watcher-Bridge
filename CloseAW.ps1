# Close Achievement Watcher if running
$processName = "AchievementWatcher"
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

if ($process) {
    Stop-Process -Name $processName -Force
    Write-Host "Achievement Watcher has been closed."
} else {
    Write-Host "Achievement Watcher is not currently running."
}
