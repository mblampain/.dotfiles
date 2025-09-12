export DOTFILES="$HOME/.dotfiles"
export PRO_DOTFILES="$HOME/.dotfiles.pro"

# Theme will be overwrite by starship
ZSH_THEME="robbyrussell"


# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	aliases
	bgnotify
	docker
	zsh-autosuggestions # This one is installed via deps.sh script
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Alias definitions
if [ -f $DOTFILES/.zsh_aliases ]; then
    . $DOTFILES/.zsh_aliases
fi

# Pro ZSH config
if [ -f $PRO_DOTFILES/.zsh_config ]; then
    . $PRO_DOTFILES/.zsh_config
fi

# Path definitions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi
