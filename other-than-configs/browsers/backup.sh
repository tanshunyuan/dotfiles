#!/bin/bash
# Browser Data Backup
# Backs up Firefox and Zen browser profiles, bookmarks, extensions, and settings
# Updated based on official Zen Browser documentation and community best practices

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🌐 Starting browser backup..."
echo "📁 Backup location: $SCRIPT_DIR"
echo ""

# Zen Browser Backup
ZEN_DIR="$HOME/Library/Application Support/zen"
if [ -d "$ZEN_DIR" ]; then
    echo "📘 Backing up Zen Browser profiles..."
    mkdir -p "$SCRIPT_DIR/zen"

    # Backup profiles.ini and installs.ini
    if [ -f "$ZEN_DIR/profiles.ini" ]; then
        cp "$ZEN_DIR/profiles.ini" "$SCRIPT_DIR/zen/"
        echo "  ✓ Profile configuration saved"
    fi

    if [ -f "$ZEN_DIR/installs.ini" ]; then
        cp "$ZEN_DIR/installs.ini" "$SCRIPT_DIR/zen/"
        echo "  ✓ Install configuration saved"
    fi

    # Backup Profile Groups folder (contains group SQLite databases)
    if [ -d "$ZEN_DIR/Profile Groups" ]; then
        echo "  → Backing up Profile Groups..."
        cp -r "$ZEN_DIR/Profile Groups" "$SCRIPT_DIR/zen/"
        echo "  ✓ Profile Groups backed up"
    fi

    # Backup all profiles from the Profiles subdirectory
    PROFILE_COUNT=0
    PROFILES_DIR="$ZEN_DIR/Profiles"
    if [ -d "$PROFILES_DIR" ]; then
        for PROFILE_DIR in "$PROFILES_DIR"/*/; do
            if [ -d "$PROFILE_DIR" ]; then
                PROFILE_NAME=$(basename "$PROFILE_DIR")
                echo "  → Backing up profile: $PROFILE_NAME"

                PROFILE_BACKUP="$SCRIPT_DIR/zen/Profiles/$PROFILE_NAME"
                mkdir -p "$PROFILE_BACKUP"

            # Critical files for bookmarks, history, and essentials
            cp "$PROFILE_DIR/places.sqlite" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/favicons.sqlite" "$PROFILE_BACKUP/" 2>/dev/null

            # Login sessions and passwords
            cp "$PROFILE_DIR/cookies.sqlite" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/cert9.db" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/key4.db" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/logins.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Extensions and their settings
            cp "$PROFILE_DIR/extension-preferences.json" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/extensions.json" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/extension-settings.json" "$PROFILE_BACKUP/" 2>/dev/null

            if [ -d "$PROFILE_DIR/extensions" ]; then
                cp -r "$PROFILE_DIR/extensions" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # Search engine preferences
            cp "$PROFILE_DIR/search.json.mozlz4" "$PROFILE_BACKUP/" 2>/dev/null

            # Session data (open tabs and their icons - important for essentials/pins)
            cp "$PROFILE_DIR/sessionstore.jsonlz4" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/sessionCheckpoints.json" "$PROFILE_BACKUP/" 2>/dev/null

            if [ -d "$PROFILE_DIR/sessionstore-backups" ]; then
                mkdir -p "$PROFILE_BACKUP/sessionstore-backups"
                cp "$PROFILE_DIR/sessionstore-backups"/*.jsonlz4 "$PROFILE_BACKUP/sessionstore-backups/" 2>/dev/null
            fi

            # Settings and preferences
            cp "$PROFILE_DIR/prefs.js" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/user.js" "$PROFILE_BACKUP/" 2>/dev/null

            # Essentials storage (critical for Zen essentials/pins)
            cp "$PROFILE_DIR/storage.sqlite" "$PROFILE_BACKUP/" 2>/dev/null

            # Containers (multi-account containers)
            cp "$PROFILE_DIR/containers.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Zen-specific keyboard shortcuts
            cp "$PROFILE_DIR/zen-keyboard-shortcuts.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Zen-specific data (workspaces and pinned tabs)
            cp "$PROFILE_DIR/zen-workspaces.json" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE_DIR/zen-pinned-tabs.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Addon customizations (may not work 100% of the time)
            if [ -d "$PROFILE_DIR/storage" ]; then
                echo "    → Backing up addon customizations..."
                cp -r "$PROFILE_DIR/storage" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # Interface customizations
            if [ -d "$PROFILE_DIR/chrome" ]; then
                echo "    → Backing up interface customizations..."
                cp -r "$PROFILE_DIR/chrome" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # List extensions
            if [ -f "$PROFILE_DIR/extensions.json" ]; then
                grep -o '"id":"[^"]*"' "$PROFILE_DIR/extensions.json" | cut -d'"' -f4 > "$PROFILE_BACKUP/extensions-list.txt" 2>/dev/null
            fi

            PROFILE_COUNT=$((PROFILE_COUNT + 1))
        fi
    done
    fi

    echo "  ✅ Zen Browser: $PROFILE_COUNT profile(s) backed up"
else
    echo "⚠️  Zen Browser not found"
fi

# Firefox Backup
FIREFOX_DIR="$HOME/Library/Application Support/Firefox/Profiles"
if [ -d "$FIREFOX_DIR" ]; then
    echo ""
    echo "🦊 Backing up Firefox profiles..."
    mkdir -p "$SCRIPT_DIR/firefox"

    # Backup profile configuration files
    if [ -f "$HOME/Library/Application Support/Firefox/profiles.ini" ]; then
        cp "$HOME/Library/Application Support/Firefox/profiles.ini" "$SCRIPT_DIR/firefox/"
        echo "  ✓ Profile configuration saved"
    fi

    if [ -f "$HOME/Library/Application Support/Firefox/installs.ini" ]; then
        cp "$HOME/Library/Application Support/Firefox/installs.ini" "$SCRIPT_DIR/firefox/"
    fi

    # Backup all profiles
    PROFILE_COUNT=0
    for PROFILE in "$FIREFOX_DIR"/*; do
        if [ -d "$PROFILE" ]; then
            PROFILE_NAME=$(basename "$PROFILE")
            echo "  → Backing up profile: $PROFILE_NAME"

            PROFILE_BACKUP="$SCRIPT_DIR/firefox/$PROFILE_NAME"
            mkdir -p "$PROFILE_BACKUP"

            # Critical files for bookmarks and history
            cp "$PROFILE/places.sqlite" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/favicons.sqlite" "$PROFILE_BACKUP/" 2>/dev/null

            # Login sessions and passwords
            cp "$PROFILE/cookies.sqlite" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/cert9.db" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/key4.db" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/logins.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Extensions and their settings
            cp "$PROFILE/extension-preferences.json" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/extensions.json" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/extension-settings.json" "$PROFILE_BACKUP/" 2>/dev/null

            if [ -d "$PROFILE/extensions" ]; then
                cp -r "$PROFILE/extensions" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # Search engine preferences
            cp "$PROFILE/search.json.mozlz4" "$PROFILE_BACKUP/" 2>/dev/null

            # Session data (open tabs)
            cp "$PROFILE/sessionstore.jsonlz4" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/sessionCheckpoints.json" "$PROFILE_BACKUP/" 2>/dev/null

            if [ -d "$PROFILE/sessionstore-backups" ]; then
                mkdir -p "$PROFILE_BACKUP/sessionstore-backups"
                cp "$PROFILE/sessionstore-backups"/*.jsonlz4 "$PROFILE_BACKUP/sessionstore-backups/" 2>/dev/null
            fi

            # Settings and preferences
            cp "$PROFILE/prefs.js" "$PROFILE_BACKUP/" 2>/dev/null
            cp "$PROFILE/user.js" "$PROFILE_BACKUP/" 2>/dev/null

            # Storage database
            cp "$PROFILE/storage.sqlite" "$PROFILE_BACKUP/" 2>/dev/null

            # Containers
            cp "$PROFILE/containers.json" "$PROFILE_BACKUP/" 2>/dev/null

            # Addon customizations
            if [ -d "$PROFILE/storage" ]; then
                echo "    → Backing up addon customizations..."
                cp -r "$PROFILE/storage" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # Custom CSS
            if [ -d "$PROFILE/chrome" ]; then
                echo "    → Backing up interface customizations..."
                cp -r "$PROFILE/chrome" "$PROFILE_BACKUP/" 2>/dev/null
            fi

            # List extensions
            if [ -f "$PROFILE/extensions.json" ]; then
                grep -o '"id":"[^"]*"' "$PROFILE/extensions.json" | cut -d'"' -f4 > "$PROFILE_BACKUP/extensions-list.txt" 2>/dev/null
            fi

            PROFILE_COUNT=$((PROFILE_COUNT + 1))
        fi
    done

    echo "  ✅ Firefox: $PROFILE_COUNT profile(s) backed up"
else
    echo "⚠️  Firefox not found"
fi

echo ""
echo "✅ Browser backup complete!"
echo "📁 Location: $SCRIPT_DIR"
echo ""
echo "ℹ️  Note: When restoring, make sure the browser is closed to avoid corruption."
echo "ℹ️  If you encounter an incompatibility error after restoring, remove compatibility.ini from the profile folder."
