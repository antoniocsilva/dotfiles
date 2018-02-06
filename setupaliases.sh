#!/usr/bin/env bash

# Cristian Stroparo's dotfiles - https://github.com/stroparo/dotfiles

echo
echo "==> Setting up setupaliases.sh ($ALIASES_FILE)..."

# #############################################################################
# Globals

ALIASES_FILE="$HOME/.aliases-cs"

# #############################################################################
# Shell profiles

if [ -r ~/.bashrc ] && [ -w ~/.bashrc ] ; then
  fgrep -i -q "$ALIASES_FILE" ~/.bashrc \
    || echo ". '$ALIASES_FILE'" >> ~/.bashrc
fi

# Zsh profile
if [ -r ~/.zshrc ] && [ -w ~/.zshrc ] ; then
  fgrep -i -q "$ALIASES_FILE" ~/.zshrc \
    || echo ". '$ALIASES_FILE'" >> ~/.zshrc
fi

# #############################################################################
# Aliases file

cat > "$ALIASES_FILE" <<'EOF'
callapi () {
 typeset x="$1"; typeset url="$2"; typeset token="$3"
 curl -s -X ${x:-GET} ${token:+-H "PRIVATE-TOKEN: $token"} "$url"
}

unalias d 2>/dev/null; unset d 2>/dev/null ; d () {
 dir="${1}" ; shift
 cd "${dir}" || return 1 ; pwd 1>&2 ; ls -Fl "$@" 1>&2
 if which git >/dev/null 2>&1; then git status -s 2>/dev/null ; fi
}

alias cls='clear'
alias dfg='df -gP'
alias dfh='df -hP'
alias dumr='du -ma | sort -rn'
alias dums='du -ma | sort -n'
if which exa >/dev/null 2>&1 ; then alias e='exa -il'; alias ea='exa -ila'; fi
alias findd='find . -type d'
alias findf='find . -type f'
alias nhr='rm nohup.out'
alias nht='tail -9999f nohup.out'
alias xcd="alias | egrep \"'c?d \" | fgrep -v 'cd -'"
alias xgit="alias | grep -w git"

# #############################################################################
# Grep

if (command grep --help | command grep -q -- --color) ; then
  alias grep='grep --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
fi

# #############################################################################
# Ls

if [[ $(ls --version 2>/dev/null) = *GNU* ]] ; then
  alias ls='ls --color=auto'
  alias l='ls -Flhi'
  alias ll='ls -AFlhi'
  alias lt='ls -Flrthi'
else
  alias l='ls -Fl'
  alias ll='ls -AFl'
  alias lt='ls -Flrt'
fi

# #############################################################################
# Ag aka the silver searcher

if which ag >/dev/null 2>&1 ; then
  alias agi='ag -i'
  alias agin='ag -i --line-numbers'
  alias agn='ag --line-numbers'

  alias agp='ag --python'
  alias agr='ag --ruby'

  alias agasm='ag --asm'
  alias agbat='ag --batch'
  alias agcc='ag --cc'
  alias agclojure='ag --clojure'
  alias agcpp='ag --cpp'
  alias agcsharp='ag --csharp'
  alias agcss='ag --css'
  alias agdelphi='ag --delphi'
  alias agelixir='ag --elixir'
  alias agerlang='ag --erlang'
  alias aghtml='ag --html'
  alias agjs='ag --js'
  alias agmd='ag --md -i'
  alias agmk='ag --mk -i'
  alias agphp='ag --php'
  alias agrust='ag --rust'
  alias agshell='ag --shell'
  alias agsass='ag --sass'
  alias agscala='ag --scala'
  alias agsql='ag --sql'
  alias agvim='ag --vim'
  alias agyaml='ag --yaml'
  alias agxml='ag --xml'
fi

# #############################################################################
# APT dpkg etcetera

if which apt >/dev/null 2>&1 || which apt-get >/dev/null 2>&1 ; then
  alias apd='sudo aptitude update && sudo aptitude'
  alias apdi='sudo aptitude install -y'
  alias apdnoup='sudo aptitude'
  alias apdup='sudo aptitude update'
  alias apdupsafe='sudo aptitude safe-upgrade'
  alias apti='sudo apt install -y'
  alias apts='apt-cache search'
  alias aptshow='apt-cache show'
  alias aptshowpkg='apt-cache showpkg'
  alias aptup='sudo apt update'
  alias dpkgl='dpkg -L'
  alias dpkgs='dpkg -s'
  alias dpkgsel='dpkg --get-selections | egrep -i'
  alias upalt='sudo update-alternatives'
fi

# #############################################################################
# Git

if which git >/dev/null 2>&1 ; then

  alias bv='git branch -vv'
  alias bav='git branch -avv'
  alias gh='git diff HEAD'
  alias glggas='git log --graph --decorate --all --stat'
  alias glogas='git log --graph --decorate --all --stat --oneline'
  alias gv='git mv'

  # If no Oh-My-ZSH then load similar git aliases:
  if [ -z "${ZSH_THEME}" ] ; then
    alias ga='git add'
    alias gb='git branch'
    alias gc='git commit -v'
    alias gcb='git checkout -b'
    alias gcl='git clone --recursive'
    alias gco='git checkout'
    alias gd='git diff'
    alias gdca='git diff --cached'
    alias gf='git fetch'
    alias gl='git pull'
    alias glg='git log --stat'
    alias glgg='git log --graph'
    alias glog='git log --oneline --decorate --graph'
    alias gp='git push'
    alias grh='git reset HEAD'
    alias grhh='git reset HEAD --hard'
    alias gru='git reset --'
    alias gsps='git show --pretty=short --show-signature'
    alias gss='git status -s'
    alias gst='git status'
    alias gts='git tag -s'

    alias gr='git remote'
    alias gra='git remote add'
    alias grmv='git remote rename'
    alias grrm='git remote remove'
    alias grset='git remote set-url'
    alias grup='git remote update'
    alias grv='git remote -v'
  fi
fi

# #############################################################################
# Tmux

alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks='tmux kill-session -t'

# #############################################################################

EOF

# #############################################################################
