#!/bin/bash

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# set prompt: [pwd] $
PS1="[\w] \$(parse_git_branch) # " # set prompt to be "[current directory] (git branch if exists) #"

# ls aliases
alias ll='ls -l'
alias lt='ls -ltrh'
alias ltr='ls -ltrh'
alias la='ls -a'

# command aliases
alias b='bundle exec'

# rails aliases
alias s='bundle exec puma -b 'ssl://0.0.0.0:3001?key=ssl_certs/server.key&cert=ssl_certs/server.crt' -b 'tcp://0.0.0.0:3000'' # start a local web server
alias ks='pkill -9 puma'
alias rs='bundle exec rspec spec/' # execute rspec test suite
alias c='bundle exec rails c'

alias oosdb='mysql -u root -h ollyolly_percona ollyolly_development'

export EDITOR=vi

alias editprof='vi ~/.bashrc'
alias pushprof='source ~/.bashrc'
