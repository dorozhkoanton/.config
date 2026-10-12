# PATH: ~/.local/bin — uv, python3, nvim; ~/.cargo/bin — rustup/cargo; ~/go/bin — go install
typeset -U path
path=(~/.local/bin ~/.cargo/bin ~/go/bin $path)

export EDITOR=nvim VISUAL=nvim

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

zstyle ':omz:plugins:alias-finder' autoload yes  # подсказывать алиас после каждой команды
zstyle ':omz:update' verbose minimal

plugins=(
  git
  alias-finder
  docker docker-compose
  rust uv
  zsh-autosuggestions
  zsh-syntax-highlighting  # всегда последним
)

source $ZSH/oh-my-zsh.sh

go-update() {
  local latest=$(curl -fsSL 'https://go.dev/VERSION?m=text' | head -1)
  local current=$(head -1 /usr/local/go/VERSION 2>/dev/null)
  [[ -n $latest ]] || { echo "go-update: не удалось узнать последнюю версию"; return 1; }
  [[ $latest == $current ]] && { echo "Go: $current уже последний"; return; }
  local tmp=$(mktemp -d)
  curl -fsSL -o "$tmp/go.pkg" "https://go.dev/dl/${latest}.darwin-amd64.pkg" \
    && sudo installer -pkg "$tmp/go.pkg" -target / \
    && echo "Go: $current → $latest"
  rm -rf "$tmp"
}

nvim-update() {
  local tmp=$(mktemp -d)
  curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-macos-x86_64.tar.gz \
    | tar xzf - -C "$tmp" || { rm -rf "$tmp"; return 1; }
  mkdir -p ~/.local/opt ~/.local/bin
  rm -rf ~/.local/opt/nvim-macos-x86_64
  mv "$tmp/nvim-macos-x86_64" ~/.local/opt/
  ln -sf ~/.local/opt/nvim-macos-x86_64/bin/nvim ~/.local/bin/nvim
  rm -rf "$tmp"
  nvim --version | head -1
}

update-all() {
  rustup update
  cargo install --locked ripgrep fd-find
  go-update
  go install github.com/jesseduffield/lazygit@latest
  uv self update && uv python upgrade
  nvim-update
  brew upgrade
  for p in $ZSH_CUSTOM/plugins/*/.git(N:h); do git -C $p pull -q; done
  omz update
}
