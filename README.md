# plymouth-manager

Theme manager for Plymouth bootsplash

## Installation

```bash
sudo curl https://raw.githubusercontent.com/x1unix/plymouth-manager/master/plym.sh -o /usr/local/bin/plym
```

## Usage

```
plym [COMMAND] args...
```

Available commands:

- `install` - install a new theme (folder should be located at `/usr/share/plymouth/themes`)
- `list` - list themes
- `preview` - preview bootscreen (requires `plymouth-X11`)
- `select` - select Plymouth theme
