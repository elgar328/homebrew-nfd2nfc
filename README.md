# nfd2nfc Homebrew Tap

This repository contains the Homebrew formula for [nfd2nfc](https://github.com/elgar328/nfd2nfc), a utility that converts filesystem entry names from NFD to NFC on macOS.


## Installation

You can install nfd2nfc via Homebrew using our tap. This installation provides two executables: nfd2nfc and nfd2nfc-watcher.

### Steps

1.	**Add the Homebrew Tap:**
``` bash 
brew tap elgar328/nfd2nfc
```

2.	**Install nfd2nfc:**
``` bash
brew install nfd2nfc
```

3.	**Start the Service:**

After installation, register and start the background service by running:
``` bash
brew services start nfd2nfc
```

Alternatively, if you don’t need a background service, you can run the watcher manually:
``` bash
nfd2nfc-watcher
```

4.	**Managing the Watcher Service:**

By default, no paths are set to be monitored. To enable automatic filename conversion, you must add directories to the watch list. For example, to have the watcher automatically process your Desktop folder and all its subdirectories, run:
``` bash
nfd2nfc watch add ~/Desktop -r
```

After adding a watch path, you can verify that it was successfully added by running the command below. This command displays all paths currently being monitored, so you can quickly check that your Desktop folder is included.
``` bash
nfd2nfc watch list
```

For more details, see the help documentation:
``` bash
nfd2nfc -–help
nfd2nfc watch -–help
```

## License

This project is licensed under the MIT License.
