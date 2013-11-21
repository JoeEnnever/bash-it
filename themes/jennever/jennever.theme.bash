#!/usr/bin/env bash
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${green}|"

GIT_THEME_PROMPT_DIRTY=" ${red}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${green}|"
GIT_THEME_PROMPT_SUFFIX="${green}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function ghost_dude { 
  scm
  [[ $SCM == $SCM_GIT ]] && echo "Give COMMITS"
}

function frowny {
  echo "\$([[ \$? != 0 ]] && echo ':( ')"
}

NAME=''
if [[ $HOSTNAME == "Foursquares-MacBook-Pro-7.local" ]]; then 
  NAME="Laptop"
else
  NAME="\h"
fi

function prompt_command() {
PS1="\n${purple}${NAME} ${reset_color}in ${green}\w\n${bold_cyan}༼つ◕_◕༽つ $(ghost_dude) ${green}$(scm_prompt_info) ${red}$(frowny)${green}\$${reset_color} "
}

PROMPT_COMMAND=prompt_command;
