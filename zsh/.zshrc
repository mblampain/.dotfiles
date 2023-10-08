export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"
export PRO="$HOME/.dotfiles.pro"

ZSH_THEME="oxide"


# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	aliases
	bgnotify
	docker
)

source $ZSH/oh-my-zsh.sh

# Alias definitions
if [ -f $DOTFILES/zsh/.zsh_aliases ]; then
    . $DOTFILES/zsh/.zsh_aliases
fi

# Pro ZSH config
if [ -f $PRO/.zsh_config ]; then
    . $PRO/.zsh_config
fi

# Path definitions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
