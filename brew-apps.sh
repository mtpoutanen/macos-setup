# Start by installing homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew update
brew upgrade
brew install --cask iterm2
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install pyenv
brew install nvm
brew install openjdk
brew install --cask signal
brew install --cask rectangle
brew install --cask alfred
brew install --cask sublime-text
brew install pipx
brew install --cask sourcetree
brew install --cask docker-desktop
brew install --cask firefox
