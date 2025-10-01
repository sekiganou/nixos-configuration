# Caelestia Theme Comparison

## Before & After Overview

### Visual Changes

#### Color Scheme
**Before:**
- Random gradient borders (cyan to green)
- Generic dark theme colors
- No cohesive color system

**After (Caelestia):**
- Material Design 3 purple/blue palette
- Primary: `#c2c1ff` (soft purple)
- Background: `#131317` (deep blue-black)
- Consistent color hierarchy throughout

#### Window Decorations
**Before:**
- Border: 2px
- Gaps in: 5px
- Gaps out: 10px
- No shadows
- Basic blur (size 3, passes 1)

**After (Caelestia):**
- Border: 3px with Material Design colors
- Gaps in: 10px
- Gaps out: 40px (more breathing room)
- Shadows: 20px range with depth
- Enhanced blur (size 8, passes 2)
- Active opacity: 95%

### Application Changes

#### Terminal
**Before:** Kitty
- Font size: 11
- Opacity: 50%
- Padding: 10px
- Black background

**After:** Foot (primary)
- Font size: 12
- Opacity: 78% (Caelestia standard)
- Padding: 25px (more spacious)
- Material Design background

#### Shell
**Before:** ZSH with Oh-My-Zsh
- robbyrussell theme
- Basic aliases
- Standard prompt

**After:** Fish with Starship
- Starship minimal prompt
- Material Design colors
- Modern aliases with eza
- Better autosuggestions

#### Launcher
**Before:** Rofi
- X11-based
- Generic styling

**After:** Fuzzel
- Native Wayland
- Material Design 3 styling
- 10px border radius
- Theme-matched colors

#### Status Bar (Waybar)
**Before:**
- Dark blue-gray background
- Basic white text
- Minimal styling

**After:**
- Material Design colors
- Primary color border
- Rounded module backgrounds
- Icon-first layout
- Theme-consistent appearance

### Keybinding Changes

#### Main Modifier
**Before:** `Alt` key
- Conflicts with many apps
- Less standard

**After:** `Super` (Windows) key
- No app conflicts
- Standard for Wayland
- Matches Caelestia conventions

#### Key Application Shortcuts
| Action | Before | After |
|--------|--------|-------|
| Terminal | Alt+C (neofetch) | Super+T (foot) |
| Browser | Alt+F | Super+W |
| Editor | Alt+N | Super+C |
| Launcher | Alt+Space | Super+Space |
| Close Window | Alt+Q | Super+Q |
| File Manager | Alt+E | Super+E |

### New Features Added

1. **Clipboard History**
   - Keybinding: `Super + Period`
   - Search through clipboard history
   - Text and image support

2. **Screenshot Annotation**
   - Screenshots open in Swappy
   - Annotate before saving
   - Better workflow

3. **Window Groups**
   - Group related windows
   - `Alt + Tab` to cycle
   - Styled groupbar

4. **Auto Night Light**
   - Location-based with geoclue2
   - Automatic time adjustment
   - Smooth transitions

5. **Modern Shell Tools**
   - `eza` - ls with icons and colors
   - `fastfetch` - system info
   - `trash-cli` - safe deletion

### Animation Improvements

**Before:**
- Single bezier curve
- Generic animations
- Same timing for all

**After (Material Design 3):**
- Multiple specialized curves:
  - Emphasized Decel (appearing)
  - Emphasized Accel (disappearing)
  - Standard (general)
- Context-aware animations
- Professional feel

### Notification Changes

**Before:**
- Generic styling
- Droid Sans font
- Basic colors

**After (Caelestia):**
- JetBrains Mono Nerd Font
- Material Design colors
- 2px colored border
- 10px corner radius
- Urgency-based colors

## Configuration Structure

### Before
```
modules/home-manager/hyprland/
├── apps.nix
├── base/
│   └── main.nix
├── keybindings/
│   └── main.nix
├── terminal/
│   └── main.nix
├── topbar/
│   ├── main.nix
│   └── style.nix
└── ...
```

### After
```
modules/home-manager/hyprland/
├── apps.nix (enhanced)
├── base/
│   ├── colors.nix (NEW - Material Design 3 colors)
│   └── main.nix (enhanced)
├── launcher/ (NEW)
│   └── main.nix (Fuzzel config)
├── keybindings/
│   └── main.nix (Super key, new bindings)
├── terminal/
│   └── main.nix (Foot + Fish + Starship)
├── topbar/
│   ├── main.nix (improved layout)
│   └── style.nix (Caelestia styling)
└── ...
```

## Package Changes

### Removed
- `zsh-autosuggestions` (now using Fish)

### Added
- `foot` - Wayland terminal
- `fish` - Modern shell
- `starship` - Shell prompt
- `fuzzel` - Wayland launcher
- `cliphist` - Clipboard history
- `swappy` - Screenshot editor
- `eza` - Modern ls
- `fastfetch` - System info
- `trash-cli` - Safe deletion
- `wireplumber` - Audio session manager
- `geoclue2` - Location services
- `material-symbols` - Icon font
- `inotify-tools` - File monitoring

### Kept
- `kitty` - Backup terminal
- `rofi` - Backup launcher
- All existing apps (Firefox, VSCode, etc.)

## What Stayed The Same

✅ **Firefox** - Your browser configuration
✅ **VSCode** - Your editor setup
✅ **Chromium apps** - All web apps (Tailscale, RSI, etc.)
✅ **Nemo** - File manager
✅ **Wallpaper settings** - Same folder path
✅ **Monitor configuration** - Your display setup
✅ **Keyboard layout** - Your keyboard settings
✅ **All other system settings**

## Resource Impact

### Memory Usage
- Similar or slightly less (Foot is lighter than Kitty)
- Fuzzel is lighter than Rofi
- Fish startup is comparable to ZSH

### CPU Usage
- Enhanced blur may use slightly more GPU
- Animations are optimized
- Overall performance should be similar

### Disk Space
- Additional ~100MB for new packages
- Nerd fonts add ~50MB
- Total increase: ~150MB

## Migration Safety

✅ **Backup terminals available** - Kitty still installed
✅ **Backup launcher available** - Rofi still installed
✅ **ZSH still available** - Can switch back if needed
✅ **All configs are declarative** - Easy to revert
✅ **No data loss risk** - Only configuration changes

## Expected Experience

After applying this theme, you should experience:

1. **More cohesive look** - Everything matches the purple/blue theme
2. **Better spacing** - Windows have more breathing room
3. **Enhanced depth** - Shadows and blur create elevation
4. **Smoother animations** - Material Design motion feels natural
5. **Better workflow** - Clipboard history, screenshot editor
6. **Modern tools** - Icons in terminal, better file listing
7. **Consistent keybindings** - No more modifier conflicts

## Recommended First Steps After Applying

1. **Test terminal**: `Super + T` to open Foot
2. **Try launcher**: `Super + Space` for Fuzzel
3. **Check clipboard**: Copy something, then `Super + Period`
4. **Test screenshot**: Press `Print` and annotate in Swappy
5. **Explore Fish**: Type commands and see autosuggestions
6. **Try eza**: Type `ls` or `ll` to see icons
7. **Check system info**: Type `fastfetch`

## Future Enhancements (Optional)

If you want to go further with Caelestia:

1. **Quickshell** - Replace Waybar with Caelestia's custom shell
2. **Qt theming** - Configure qt5ct/qt6ct for better Qt apps
3. **Cursor theme** - Install sweet-cursors or similar
4. **GTK fine-tuning** - Adjust GTK theme settings
5. **More special workspaces** - Add scratchpads for specific apps

## Summary

This migration transforms your Hyprland setup into a cohesive, modern, Material Design 3-themed environment while preserving all your applications and workflows. The changes are reversible, well-documented, and based entirely on the official Caelestia theme.
