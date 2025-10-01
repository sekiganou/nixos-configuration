# My NixOS Configurations

## 🎨 Caelestia Theme

This configuration now features the **Caelestia Hyprland theme** - a beautiful Material Design 3-based setup with purple/blue aesthetics.

### 📚 Documentation

- **[Quick Start Guide](CAELESTIA_QUICKSTART.md)** - Essential keybindings and daily usage
- **[Migration Guide](CAELESTIA_MIGRATION.md)** - Complete technical documentation
- **[Theme Comparison](THEME_COMPARISON.md)** - Before/after details
- **[Implementation Report](IMPLEMENTATION_COMPLETE.md)** - Deployment instructions

### 🚀 Quick Deploy

```bash
sudo nixos-rebuild switch --flake .#your-hostname
```

### 🔑 Essential Keybindings

| Action | Keybinding |
|--------|-----------|
| Terminal | `Super + T` |
| Launcher | `Super + Space` |
| Browser | `Super + W` |
| Editor | `Super + C` |
| Clipboard History | `Super + Period` |

See [CAELESTIA_QUICKSTART.md](CAELESTIA_QUICKSTART.md) for complete keybindings.

### ✨ Features

- Material Design 3 color scheme
- Enhanced blur and shadows
- Clipboard history management
- Screenshot annotation tool
- Modern shell (Fish + Starship)
- Native Wayland applications

### 📦 Hosts

- `laptop-asus` - Laptop configuration
- `desktop-lenovo` - Desktop configuration

---

*Based on the official [Caelestia](https://github.com/caelestia-dots/caelestia) theme.*
