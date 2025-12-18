echo "🍺 Starting Homebrew backup..."

# Backup Homebrew packages
echo "📦 Creating Brewfile..."
brew bundle dump --file="Brewfile" --force

# Backup Homebrew taps
echo "🔧 Backing up Homebrew taps..."
brew tap > "brew-taps.txt"
