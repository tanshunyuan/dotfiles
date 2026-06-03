# Created by `pipx` on 2023-08-18 02:17:20
export PATH="$PATH:/Users/saitama/.local/bin"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/saitama/Library/Caches/Coursier/arc/https/cdn.azul.com/zulu/bin/zulu21.50.19-ca-jdk21.0.11-macosx_aarch64.tar.gz/zulu21.50.19-ca-jdk21.0.11-macosx_aarch64/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/saitama/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
