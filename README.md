# Playnite Achievement Watcher Scripts

This repository provides simple PowerShell scripts for Playnite to automatically launch and close [Achievement Watcher](https://github.com/xan105/Achievement-Watcher/releases) when you start and exit a game. This setup ensures Achievement Watcher is only running while you're gaming, saving system resources and keeping your achievements in sync.

## Requirements

- [Achievement Watcher](https://github.com/xan105/Achievement-Watcher/releases)  
  Download and install Achievement Watcher before continuing.

- [Playnite](https://playnite.link/)  
  A versatile, open-source video game library manager.

## Setup Instructions

1. **Download the Scripts:**  
   - `LaunchAW.ps1` — Launches Achievement Watcher.
   - `CloseAW.ps1` — Closes Achievement Watcher.

2. **Configure in Playnite:**
   1. Open Playnite.
   2. Go to `Settings` > `Scripts`.
   3. Under **"Execute before starting a game"**, paste the contents of `LaunchAW.ps1`.
   4. Under **"Execute after exiting a game"**, paste the contents of `CloseAW.ps1`.
   5. Save your settings.

3. **Enjoy!**  
   Achievement Watcher will now launch automatically when you start a game via Playnite and close itself after you finish.

## Notes

- Make sure the paths inside the scripts match where you've installed Achievement Watcher.
- The scripts are designed for Windows and require PowerShell.
- You can further customize the scripts to fit your directory structure or preferences.

## Credits

- [Achievement Watcher by xan105](https://github.com/xan105/Achievement-Watcher)
- [Playnite Launcher](https://github.com/JosefNemec/Playnite)

---

Feel free to open an issue or pull request if you have improvements or suggestions!