# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PGDATA=~/testdb

fpath=(~/.zsh/completion/ $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/rbone/.gem/ruby/2.2.0/bin:/Users/rbone/.rubies/ruby-2.2.0/lib/ruby/gems/2.2.0/bin:/Users/rbone/.rubies/ruby-2.2.0/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#source ~/.shell_prompt.sh

source ~/.zsh-aliases

alias rr="afplay ~/Documents/SoundFX/readingrainbow.mp3"
#alias gameover="afplay ~/Documents/SoundFX/gameover.mp3"
#alias job="afplay ~/Documents/SoundFX/job.mp3"
alias noo="afplay ~/Documents/SoundFX/nooo.mp3"
#alias dangerzone="open spotify:track:2RtnoUsvJg3wMgMeEhG6fr"

#export CMM_API_KEY=fb01xpu9q2orm3m581pn
#export CMM_API_SECRET=oyudnd0gnah4zfp1cmo-b25tcnknxx349fa83pup
#export INTEGRATION_CMM_API_KEY=n1soipkqwoexrhxx7uvg
#export INTEGRATION_CMM_API_SECRET=6sgljns2vv61hoayhiu-y0tl8bl7xpv1aib800ni
#export CMM_GITHUB_OAUTH_TOKEN=a508f152d935f3124e0f5e801d28fc3378716125

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# for some reason my current setup only has my public github ssh key in the ssh-agent, so this adds
# the default one, id_rsa, used for cmm work, and hides the output
ssh-add &> /dev/null

# Add home bin to path if it's there
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#export NVM_DIR="$HOME/.nvm"
 #. "/usr/local/opt/nvm/nvm.sh"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

