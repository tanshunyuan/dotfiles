SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔑 Documenting SSH keys..."
if [ -d "$HOME/.ssh" ]; then
    ls -la "$HOME/.ssh" > "$SCRIPT_DIR/ssh-keys-list.txt"
    echo "⚠️  REMINDER: Manually backup ~/.ssh to your external SSD!"
fi
