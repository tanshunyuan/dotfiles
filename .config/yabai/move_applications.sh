yabai -m query --windows | jq -r '.[] | select(.app == "iTerm2") | .id' | xargs -I{} yabai -m window {} --space 1
yabai -m query --windows | jq -r '.[] | select(.app == "Telegram") | .id' | xargs -I{} yabai -m window {} --space 2
yabai -m query --windows | jq -r '.[] | select(.app == "Obsidian") | .id' | xargs -I{} yabai -m window {} --space 3
yabai -m query --windows | jq -r '.[] | select(.app == "Firefox Developer Edition") | .id' | xargs -I{} yabai -m window {} --space 4
yabai -m query --windows | jq -r '.[] | select(.app == "Arc") | .id' | xargs -I{} yabai -m window {} --space 5
yabai -m query --windows | jq -r '.[] | select(.app == "Code") | .id' | xargs -I{} yabai -m window {} --space 6
yabai -m query --windows | jq -r '.[] | select(.app == "Dbeaver") | .id' | xargs -I{} yabai -m window {} --space 7
yabai -m query --windows | jq -r '.[] | select(.app == "Docker Desktop") | .id' | xargs -I{} yabai -m window {} --space 7
yabai -m query --windows | jq -r '.[] | select(.app == "Preview") | .id' | xargs -I{} yabai -m window {} --space 8

