#!/usr/bin/env zsh

############################################################# 
# qq-scripts
#############################################################

qq-scripts-help() {
  cat << END

qq-scripts
-------
The scripts namespace runs scripts from the quiver
scripts directory.

** IN DEVELOPMENT, NOT READY FOR USE **

Variables
---------
__SCRIPTS: location of the scripts directory, automatically generated

Commands
--------
qq-scripts-recon: a zsh recon script
qq-scripts-webrecon: a zsh webrecon script
qq-scripts-wildcards: a bash wildcard recon script

END
}

export __SCRIPTS="${0:A:h}/scripts"

qq-scripts-recon() {
  local d && read "d?$(__cyan DOMAIN: )"
  local o && read "o?$(__cyan ORG: )"
  local out && read "out?$(__cyan OUTPUT: )"
  print -z "zsh ${__SCRIPTS}/recon.zsh ${d} \"${o}\" \"${out}\""
}

qq-scripts-webrecon() {
  local f=$(rlwrap -S "$(__cyan FILE:\(DOMAINS\))" -e '' -c -o cat)
  __warn "Using output: $(pwd)"
  print -z "zsh ${__SCRIPTS}/webrecon.zsh ${f}"
}

qq-scripts-wildcards() {
  print -z "bash ${__SCRIPTS}/wildcards.sh"
}
