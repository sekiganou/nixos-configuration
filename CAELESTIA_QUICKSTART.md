# Caelestia Theme Quick Start Guide

## 🎨 What Changed?

Your Hyprland setup now uses the **Caelestia theme** - a Material Design 3-based theme with purple/blue colors. All your apps (Firefox, VSCode, etc.) remain unchanged.

## 🔑 New Keybindings (Super = Windows Key)

### Applications
- `Super + T` - Terminal (Foot)
- `Super + W` - Browser (Firefox)
- `Super + C` - Editor (VSCode)
- `Super + E` - File Manager (Nemo)
- `Super + Space` or `Super + R` - Launcher (Fuzzel)

### Window Management
- `Super + Q` - Close window
- `Super + V` - Toggle floating
- `Super + F` - Fullscreen
- `Super + P` - Pin window
- `Super + [1-9]` - Switch to workspace
- `Super + Alt + [1-9]` - Move window to workspace
- `Ctrl + Super + Left/Right` - Navigate workspaces

### Utilities
- `Print` - Screenshot (with annotation)
- `Super + Shift + C` - Color picker
- `Super + Period` - Clipboard history
- `Alt + Tab` - Cycle through windows/groups
- `Ctrl + Alt + Delete` - Session menu
- `Ctrl + Shift + Escape` - System monitor

### Movement & Resize
- `Super + Z` - Enter move mode (then use h/j/k/l)
- `Super + X` - Enter resize mode (then use h/j/k/l)
- Press `Escape` to exit mode

## 🆕 New Features

### 1. Clipboard History
Copy things, then press `Super + Period` to search through your clipboard history.

### 2. Screenshot Annotation
Press `Print` to take a screenshot - it opens in Swappy where you can annotate before saving.

### 3. Modern Terminal
- Type `ls` or `ll` - see files with icons and colors (using eza)
- Type `fastfetch` - see system info
- Fish shell with better autosuggestions

### 4. Window Groups
Group related windows together and cycle through them with `Alt + Tab`.

## 🎨 Theme Colors

The Caelestia theme uses:
- **Primary**: Purple/blue (#c2c1ff)
- **Background**: Deep blue-black (#131317)
- **Accent**: Material Design 3 colors throughout

## 📦 New Tools Available

- `foot` - Your new terminal
- `fuzzel` - Your new launcher
- `fish` - Your new shell (with starship prompt)
- `eza` - Modern ls with icons (aliased to `ls`, `ll`, `la`)
- `fastfetch` - System information
- `cliphist` - Clipboard history
- `swappy` - Screenshot editor
- `trash-cli` - Safe file deletion (use `trash-put` instead of `rm`)

## ⚙️ Configuration Files

All configuration is in:
```
modules/home-manager/hyprland/
├── base/colors.nix          # Color definitions
├── base/main.nix            # Window decorations & settings
├── launcher/main.nix        # Fuzzel configuration
├── terminal/main.nix        # Foot & Fish configuration
├── keybindings/main.nix     # All keybindings
├── topbar/                  # Waybar styling
└── notifications/main.nix   # Dunst styling
```

## 🔧 Quick Customization

### Change Colors
Edit `modules/home-manager/hyprland/base/colors.nix`

### Change Keybindings
Edit `modules/home-manager/hyprland/keybindings/main.nix`

### Adjust Window Gaps
Edit `modules/home-manager/hyprland/base/main.nix` → `general` section:
```nix
gaps_in = 10;   # Space between windows
gaps_out = 40;  # Space from screen edges
```

### Adjust Blur
Edit `modules/home-manager/hyprland/base/main.nix` → `decoration.blur`:
```nix
size = 8;      # Blur amount
passes = 2;    # Quality (higher = better but slower)
```

## 🔄 Switching Back

### Use Old Terminal
Run `kitty` or bind it to a key

### Use Old Launcher
Run `rofi -show drun` or bind it to a key

### Use Old Shell
Run `zsh` or change default shell in your user config

## 📚 Full Documentation

- **Complete migration guide**: `CAELESTIA_MIGRATION.md`
- **Before/after comparison**: `THEME_COMPARISON.md`
- **Caelestia repository**: https://github.com/caelestia-dots/caelestia

## 🐛 Troubleshooting

### Terminal won't open
Use kitty as backup: modify keybinding to use `kitty` instead of `foot`

### Launcher doesn't show apps
Check that applications are installed and have `.desktop` files in `/usr/share/applications/`

### Clipboard history is empty
Ensure cliphist is running: `ps aux | grep cliphist`

### Night light not working
Enable location services in your system settings

## 🎯 Next Steps

1. **Test the keybindings** - Try `Super + T`, `Super + Space`, etc.
2. **Customize to taste** - Adjust colors, gaps, or keybindings
3. **Explore new tools** - Try `eza`, `fastfetch`, clipboard history
4. **Read full docs** - Check `CAELESTIA_MIGRATION.md` for details

## 💡 Tips

- **Animations**: The theme uses Material Design 3 motion for smooth, natural animations
- **Transparency**: Windows are 95% opaque for better depth perception
- **Blur**: Background blur creates a modern, layered look
- **Shadows**: Windows cast shadows for visual elevation
- **Gaps**: Larger gaps (40px) create a floating window aesthetic

---

**Enjoy your new Caelestia-themed Hyprland setup!** 🚀
