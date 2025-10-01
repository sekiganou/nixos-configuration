# Caelestia Theme Migration Documentation

This document explains the migration to the Caelestia Hyprland theme, detailing each change and the reasoning behind it.

## Overview

The Caelestia theme is a Material Design 3-based Hyprland configuration with a cohesive purple/blue color scheme. This migration adapts your existing NixOS configuration to match the Caelestia aesthetic while preserving your existing applications (Firefox, VSCode, Chromium apps, etc.).

## Key Changes

### 1. Color Scheme (Material Design 3)

**File: `modules/home-manager/hyprland/base/colors.nix`**

The Caelestia theme uses Material Design 3 colors with a purple/blue accent:
- Primary: `#c2c1ff` (light purple/blue) - Used for active borders, highlights
- Background: `#131317` (very dark blue-gray) - Base background
- Surface: Various shades from `#131317` to `#353438` - Card and component backgrounds
- On-Surface: `#e5e1e7` (off-white) - Text on backgrounds

**Why**: Material Design 3 provides a scientifically-designed color system that ensures good contrast and visual hierarchy.

### 2. Terminal: Kitty → Foot

**File: `modules/home-manager/hyprland/terminal/main.nix`**

Changes:
- **Primary terminal**: Foot (lightweight Wayland terminal)
- **Backup**: Kitty (still available if needed)
- **Font**: JetBrains Mono Nerd Font (12pt for Foot)
- **Opacity**: 78% (0.78) to show wallpaper through terminal
- **Padding**: 25px (more spacious than before)

**Why**: Foot is the Caelestia project's terminal of choice because:
- Native Wayland support (no X11 dependencies)
- Lightweight and fast
- Better integration with the theme

### 3. Shell: ZSH → Fish

**File: `modules/home-manager/hyprland/terminal/main.nix`**

Changes:
- **Primary shell**: Fish with Starship prompt
- **Backup**: ZSH (still available)
- **Prompt**: Starship with minimal configuration
- **Aliases**: Using `eza` (modern ls with icons) instead of plain `ls`

**Why**: Fish provides:
- Better out-of-box experience
- More intuitive syntax
- Better autosuggestions
- Caelestia uses Fish as the default shell

Starship prompt provides:
- Fast, cross-shell prompt
- Git integration
- Directory truncation
- Matches Caelestia's minimal aesthetic

### 4. Application Launcher: Rofi → Fuzzel

**Files: `modules/home-manager/hyprland/launcher/main.nix`, `modules/home-manager/hyprland/keybindings/main.nix`**

Changes:
- **Launcher**: Fuzzel (native Wayland launcher)
- **Keybinding**: `Super + Space` or `Super + R`
- **Styling**: Material Design 3 colors with 10px border radius
- **Width**: 40% of screen
- **Font**: JetBrains Mono Nerd Font

**Why**: Fuzzel is:
- Native Wayland (better performance)
- Simpler and faster than Rofi
- Better blur/transparency support
- Caelestia's launcher of choice

### 5. Keybindings: Alt → Super

**File: `modules/home-manager/hyprland/keybindings/main.nix`**

Major changes:
- **Main modifier**: `Super` (Windows key) instead of `Alt`
- **Terminal**: `Super + T` → Opens Foot
- **Browser**: `Super + W` → Opens Firefox
- **Editor**: `Super + C` → Opens VSCode
- **Launcher**: `Super + Space` → Opens Fuzzel
- **File Manager**: `Super + E` → Opens Nemo
- **Close window**: `Super + Q`
- **Toggle floating**: `Super + V`
- **Fullscreen**: `Super + F`

Workspace management:
- **Switch workspace**: `Super + [1-9]`
- **Move window**: `Super + Alt + [1-9]`
- **Navigate workspaces**: `Ctrl + Super + Left/Right`

Window management:
- **Move window**: `Super + Z` (enter move mode)
- **Resize window**: `Super + X` (enter resize mode)
- **Pin window**: `Super + P`

**Why**: Using Super as the main modifier:
- More standard in Wayland compositors
- Doesn't conflict with application shortcuts
- Matches Caelestia conventions

### 6. Window Decorations

**File: `modules/home-manager/hyprland/base/main.nix`**

Changes:
- **Border size**: 3px (increased from 2px)
- **Rounding**: 10px (maintained)
- **Active opacity**: 0.95 (slight transparency)
- **Gaps in**: 10px (increased from 5px)
- **Gaps out**: 40px (increased from 10px)
- **Blur**: Size 8, passes 2, with vibrancy
- **Shadows**: Enabled with 20px range

**Why**: These values create:
- More breathing room between windows
- Modern, floating window aesthetic
- Depth through shadows and blur
- Better visual separation

### 7. Animations (Material Design 3 Motion)

**File: `modules/home-manager/hyprland/base/main.nix`**

Caelestia uses Material Design 3 animation curves:
- **Emphasized Decel**: `0.05, 0.7, 0.1, 1` - For appearing elements
- **Emphasized Accel**: `0.3, 0, 0.8, 0.15` - For disappearing elements
- **Standard**: `0.2, 0, 0, 1` - For general transitions

Window animations:
- Windows in: 5 frames with emphasized deceleration
- Windows out: 3 frames with emphasized acceleration
- Workspaces: 5 frames with standard curve

**Why**: Material Design 3 motion curves create:
- Natural, physics-based movement
- Consistent animation feel
- Professional appearance

### 8. Window Groups

**File: `modules/home-manager/hyprland/base/main.nix`**

New feature added:
- Groups use the same colors as borders
- Groupbar with JetBrains Mono font
- `Alt + Tab` cycles through grouped windows
- `Super + Comma` changes group

**Why**: Window groups allow:
- Organizing related windows together
- Tab-like behavior within Hyprland
- Better workspace organization

### 9. Notifications

**File: `modules/home-manager/hyprland/notifications/main.nix`**

Changes:
- **Font**: JetBrains Mono Nerd Font 10pt
- **Colors**: Material Design 3 scheme
- **Border**: 2px with primary color
- **Corner radius**: 10px
- **Position**: Top-right with 30x50 offset
- **Max width**: 400px

Urgency levels use different colors:
- Low: Outline color border
- Normal: Primary color border
- Critical: Error colors (red)

**Why**: Notifications now:
- Match the overall theme
- Have better visibility with borders
- Use appropriate colors for urgency

### 10. New Dependencies

**File: `modules/home-manager/hyprland/apps.nix`**

Added packages:
- **foot**: Primary terminal
- **fish**: Primary shell
- **starship**: Shell prompt
- **fuzzel**: Application launcher
- **cliphist**: Clipboard history manager
- **swappy**: Screenshot annotation tool
- **eza**: Modern ls replacement with icons
- **fastfetch**: System information (replaces neofetch)
- **trash-cli**: Safe file deletion
- **wireplumber**: PipeWire session manager
- **geoclue2**: Location provider for gammastep
- **material-symbols**: Material Design icons
- **inotify-tools**: File system monitoring

**Why**: These tools:
- Are dependencies of the Caelestia theme
- Provide better functionality than predecessors
- Integrate well with Wayland

### 11. Autostart Changes

**File: `modules/home-manager/hyprland/autostart/main.nix`**

New autostart services:
- Clipboard history: `wl-paste --watch cliphist store`
- Auto trash cleanup: `trash-empty 30` (deletes trash older than 30 days)
- Location service for gammastep

**Why**: These services:
- Enable clipboard history (`Super + Period`)
- Automatically clean up old files
- Enable automatic night light based on location

### 12. Screenshot Workflow

**File: `modules/home-manager/hyprland/keybindings/main.nix`**

Changes:
- Screenshots now open in Swappy for annotation
- `Print` key: Area screenshot with Swappy
- `Ctrl + Print`: Full screen with Swappy
- `Super + Shift + S`: Area screenshot (traditional)
- `Super + Shift + C`: Color picker

**Why**: Swappy allows:
- Annotation before saving
- Drawing on screenshots
- Adding text to screenshots
- More flexibility

## What Was Preserved

The migration kept your existing applications and workflows:
- ✅ Firefox (browser)
- ✅ VSCode (editor)
- ✅ Chromium web apps (Tailscale, RSI, etc.)
- ✅ Nemo (file manager)
- ✅ All existing system tools
- ✅ Wallpaper configuration (same folder)
- ✅ Monitor configuration
- ✅ Keyboard layout configuration

## Testing the Configuration

After applying these changes, test the following:

1. **Terminal**: Press `Super + T` to open Foot
2. **Launcher**: Press `Super + Space` to open Fuzzel
3. **Window management**: Try `Super + Q` to close windows
4. **Workspaces**: Use `Super + 1-9` to switch
5. **Blur effect**: Move a terminal over a window to see blur
6. **Clipboard**: Copy something, then `Super + Period` for history
7. **Screenshots**: Press `Print` and select an area

## Customization

You can customize the theme by editing:

- **Colors**: `modules/home-manager/hyprland/base/colors.nix`
- **Gaps/Borders**: `modules/home-manager/hyprland/base/main.nix` → `general` section
- **Blur**: `modules/home-manager/hyprland/base/main.nix` → `decoration.blur` section
- **Animations**: `modules/home-manager/hyprland/base/main.nix` → `animations` section
- **Keybindings**: `modules/home-manager/hyprland/keybindings/main.nix`

## Future Enhancements

Optional improvements you could add:

1. **Quickshell**: The Caelestia shell (bar) could replace Waybar
   - More integrated with the theme
   - QML-based custom widgets
   - Requires more setup

2. **Qt theming**: Configure qt5ct and qt6ct for better Qt app appearance

3. **Cursor theme**: Install and configure a cursor theme (e.g., sweet-cursors)

4. **GTK theme**: Fine-tune GTK apps with adw-gtk3 theme

## Troubleshooting

If you encounter issues:

1. **Foot won't start**: Fall back to Kitty with `Super + Shift + T` (if configured) or modify the keybinding
2. **Fuzzel doesn't show apps**: Check that your `$XDG_DATA_DIRS` includes `/usr/share` and `~/.local/share`
3. **Clipboard history empty**: Ensure cliphist is running (`ps aux | grep cliphist`)
4. **Night light not working**: Check geoclue2 is enabled and has location permissions

## References

- Caelestia main repository: https://github.com/caelestia-dots/caelestia
- Caelestia shell: https://github.com/caelestia-dots/shell
- Material Design 3: https://m3.material.io/
- Hyprland documentation: https://wiki.hyprland.org/

## Summary

This migration brings your Hyprland setup to match the Caelestia aesthetic with:
- Material Design 3 colors (purple/blue theme)
- Modern Wayland-native tools
- Better window management
- Enhanced visual effects
- Preserved functionality of your existing applications

All changes are documented and can be reverted or customized to your preferences.
