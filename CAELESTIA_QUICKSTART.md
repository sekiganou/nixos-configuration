# Caelestia Theme Quick Start Guide

## 🎨 What Changed?

Your Hyprland setup now uses the **Caelestia theme** - a Material Design 3-based theme with purple/blue colors. All your apps (Firefox, VSCode, etc.) remain unchanged.

## 🔑 Keybindings (ALT as Main Modifier)

**Note:** This configuration uses **ALT** as the main modifier (your preference) instead of Super, while integrating additional Caelestia features.

### Applications
- `Alt + T` - Terminal (Foot)
- `Alt + W` or `Alt + F` - Browser (Firefox)
- `Alt + C` - Editor (VSCode)
- `Alt + E` - File Manager (Nemo)
- `Alt + N` - Open nixos-configuration in VSCode
- `Alt + Space` - Launcher (Fuzzel)

### Window Management
- `Alt + Q` - Close window
- `Alt + V` - Toggle floating
- `Alt + Shift + F` - Fullscreen with borders
- `Alt + Ctrl + P` - Pin window
- `Alt + U` - Toggle window group
- `Alt + Comma` - Change active in group
- `Alt + Ctrl + U` - Ungroup window
- `Alt + Ctrl + C` - Center window
- `Alt + [1-9]` - Switch to workspace
- `Alt + Shift + [1-9]` - Move window to workspace
- `Alt + Ctrl + Left/Right` - Navigate workspaces
- `Alt + Page Up/Down` - Navigate workspaces (alternative)

### Window Groups (New Caelestia Feature)
- `Alt + Tab` - Cycle forward in group
- `Shift + Alt + Tab` - Cycle backward in group
- `Ctrl + Alt + Tab` - Cycle to next window
- `Alt + Shift + Comma` - Lock/unlock group

### Utilities
- `Print` - Full screen to clipboard
- `Alt + S` or `Shift + Print` - Region screenshot to clipboard
- `Ctrl + Print` - Full screen with annotation (Swappy)
- `Alt + Shift + C` - Color picker
- `Alt + Shift + V` or `Super + Period` - Clipboard history
- `Ctrl + Alt + Delete` - Session menu
- `Ctrl + Shift + Escape` - System monitor (btop)

### Movement & Resize (Enhanced)
- `Alt + Z` - Enter move mode (then use h/j/k/l or arrow keys, Escape/Enter to exit)
- `Alt + X` - Enter resize mode (then use h/j/k/l or arrow keys, Escape/Enter to exit)
- `Alt + Ctrl + Equal` - Increase split ratio
- `Alt + Ctrl + Minus` - Decrease split ratio
- `Alt + h/j/k/l` or `Arrow keys` - Move focus
- `Alt + Shift + h/j/k/l` or `Shift + Arrow keys` - Move window

### Advanced Workspace Control (New)
- `Alt + Ctrl + Shift + Left/Right` - Move window to adjacent workspace
- `Alt + Shift + Page Up/Down` - Move window to adjacent workspace
- `Alt + Ctrl + Shift + Up` - Move window to special workspace
- `Alt + Ctrl + Shift + Down` - Move window from special to current
- `Alt + Grave` or `Alt + S` - Toggle special workspace

### Media Controls
- `XF86AudioPlay/Pause` - Play/Pause
- `XF86AudioNext/Prev` - Next/Previous track
- `XF86AudioMute` - Mute toggle
- `Alt + Shift + M` - Mute toggle (alternative)
- `Ctrl + Super + Space` - Play/Pause (Caelestia binding)
- `XF86MonBrightnessUp/Down` - Brightness control

### System
- `Alt + Shift + L` or `Super + Shift + L` - Suspend then hibernate
- `Super + Escape` - Session menu (wlogout)

## 🆕 New Features

### 1. Clipboard History
Copy things, then press `Alt + Shift + V` or `Super + Period` to search through your clipboard history.

### 2. Screenshot Annotation
- `Print` - Full screen to clipboard
- `Ctrl + Print` - Full screen with annotation
- `Alt + S` - Region screenshot to clipboard  
- Press `Alt + S` and select area to capture with Swappy annotation tool

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
