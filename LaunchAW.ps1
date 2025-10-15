# === CONFIGURATION ===
$exePath = "%ProgramFiles%\Achievement Watcher\AchievementWatcher.exe"  # change this to your real path
$processName = "AchievementWatcher"

# === START PROCESS IF NOT RUNNING ===
$process = Get-Process -Name $processName -ErrorAction SilentlyContinue
if (-not $process) {
    Write-Host "Launching $processName..."
    Start-Process -FilePath $exePath
}

# === WAIT FOR PROCESS TO EXIST ===
Write-Host "Waiting for $processName to start..."
while (-not (Get-Process -Name $processName -ErrorAction SilentlyContinue)) {
    Start-Sleep -Milliseconds 100
}

# === WAIT FOR MAIN WINDOW HANDLE ===
Write-Host "Waiting for main window..."
do {
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowHandle -ne 0 }
    Start-Sleep -Milliseconds 100
} while (-not $process)

# === LOAD ShowWindow ONLY IF NEEDED ===
if (-not ([System.Management.Automation.PSTypeName]'Win32.Win32ShowWindow').Type) {
    $sig = @"
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
"@
    Add-Type -MemberDefinition $sig -Name "Win32ShowWindow" -Namespace Win32
}

# === MINIMIZE WINDOW ===
$SW_MINIMIZE = 6

foreach ($p in $process) {
    [Win32.Win32ShowWindow]::ShowWindow($p.MainWindowHandle, $SW_MINIMIZE)
    Write-Host "Minimized: $($p.ProcessName) (PID: $($p.Id))"
}
