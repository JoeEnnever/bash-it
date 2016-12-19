#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_UNTRACKED=" ${bold_cyan}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function ghost_dude {
  echo "¯\_(ツ)_/¯"
  scm
  # [[ $SCM == $SCM_GIT ]] && echo "༼つ◕_◕༽つ Give COMMITS"
  # [[ $SCM != $SCM_GIT ]] && echo "¯\_(ツ)_/¯"
}

function frowny {
  echo "\$(([[ \$? != 0 ]] && echo \"${red}:( \") || echo \"${green}:) \")"
}

NAME=''
if [[ $HOSTNAME == "new-host-7.home" ]]; then
  NAME="Laptop"
else
  NAME="\h"
fi

function prompt_command() {
PS1="\n${purple}${NAME} ${reset_color}in ${green}\w\n${bold_cyan} $(ghost_dude) ${green}$(scm_prompt_info) $(frowny)${green}\$${reset_color} "
echo -ne "\033]0;$(basename $PWD)\007"
if [ "$(id -u)" -ne 0 ]
  then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log
fi
}

PROMPT_COMMAND=prompt_command;
