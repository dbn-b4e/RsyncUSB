# syncwork

Simple macOS tool to backup ~/Work to an external USB drive using rsync.

## Features

- Lists available external drives and lets you choose
- Uses rsync with progress display
- Excludes common junk files (.DS_Store, @eaDir, .SynologyWorkingDirectory)

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
syncwork
```

Example output:

```
Available external disks:

  1) CORSAIR
  2) Photos
  3) usbshare1

Select disk number [1]: 1

Syncing ~/Work to /Volumes/CORSAIR/Work ...
```

## Requirements

- macOS with rsync installed (included by default)
- External USB drive mounted in /Volumes/
