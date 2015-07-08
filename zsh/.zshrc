# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
source ~/.shell_prompt.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

alias s="git status"
alias pull="git pull"
alias push="git push"
alias b="git branch"
alias co="git checkout"
alias d="git diff"
alias dc="git diff --cached"
alias cm="git commit -m"
alias ci="git commit -v"
alias a="git add"
alias gl="git log"
alias ll="ls -lahG"
alias be="bundle exec"
alias rs="bundle exec rspec"
alias cap="bundle exec cap"
alias dev="cd ~/dev"
alias pair="cd ~/dev/pair"
alias cop="bundle exec rubocop"
alias rails="bundle exec rails"
alias rake="bundle exec rake"
alias setupdb="rake db:schema:dump; rake db:test:generate_schema; rake db:test:load_testing_schema"
alias hp="cd ~/cmm/end_of_line; chruby ruby-2.0.0; git checkout master; git pull; bundle && TEST_ENV=integration rs -t happy_path && cd -"

alias tmux="tmux -2"

alias rr="afplay ~/Documents/SoundFX/readingrainbow.mp3"
alias gameover="afplay ~/Documents/SoundFX/gameover.mp3"
alias job="afplay ~/Documents/SoundFX/job.mp3"
alias noo="afplay ~/Documents/SoundFX/nooo.mp3"
alias dangerzone="open spotify:track:2RtnoUsvJg3wMgMeEhG6fr"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(ssh-agent)"

# git pair
alias startpair="git config user.name \"Rachel Layburn & Ryan Bone\"; git config user.email \"rlayburn+rb+rl@covermymeds.com\""
alias stoppair="git config user.name \"Ryan Bone\"; git config user.email \"rbone@covermymeds.com\""

ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
  ssh-add
fi
