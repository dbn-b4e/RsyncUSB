# syncwork

Simple macOS tool to backup ~/Work to an external USB drive using rsync.

## Features

- Lists available external drives and lets you choose
- Uses rsync with progress display
- Excludes common junk files (.DS_Store, @eaDir, .SynologyWorkingDirectory)
- Excludes rebuildable folders (node_modules, .venv*, \_\_pycache\_\_, .pio)
- Made for **exFAT** target drives (readable on macOS and Windows):
  - no permissions/owner/group copied (`-rt` instead of `-a`)
  - symbolic links are **skipped** (exFAT can't store them; avoids copying linked folders twice)
  - `--modify-window=1` so date rounding on exFAT/FAT does not trigger useless re-copies
- No `--delete`: files removed from the source stay on the backup drive

## Formatting the backup drive

exFAT is recommended (macOS + Windows, no 4 GB file limit, much faster than FAT32 on recent macOS).
**This erases the drive — check the identifier first:**

```bash
diskutil list external
diskutil eraseDisk ExFAT <NAME> GPT diskN
```

## Installation

```bash
./install.sh
```

Or manually:

```bash
sudo cp syncwork /usr/local/bin/
sudo chmod +x /usr/local/bin/syncwork
```

## Usage

```bash
syncwork                    # syncs ~/Work (default)
syncwork /path/to/folder    # syncs custom folder
syncwork --help             # show help
```

Example output:

```
Available external disks:

  1) CORSAIR
  2) Photos
  3) usbshare1

Select disk number [1]: 1

Syncing /Users/you/Work to /Volumes/CORSAIR/ ...
```

## Requirements

- **rsync 3.x from Homebrew** at `/usr/local/bin/rsync` (`brew install rsync`) —
  the rsync shipped with macOS does not support `--info=progress2`
- External USB drive mounted in /Volumes/
