#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# OS dependent
case "$(uname -s)" in
  Darwin)
    echo 'Mac OS X'
    # coreutils: GNU utils for mapping ls -> gls, readlink -> greadlink
    brew install {coreutils,tmux,zsh,jq,bat,tmuxinator,stow,exa,htop}
    ;;

  Linux)
    echo 'Linux'
    sudo apt-get install {build-essential,tmux,zsh,jq,bat,tmuxinator,stow,exa,htop}
    ;;

  CYGWIN*|MINGW32*|MSYS*)
    echo 'MS Windows'
    ;;

  *)
    echo 'other OS'
    ;;
esac

exit #===================================================================

# Shell dependent (only zsh has global aliases)
case $SHELL in
*/zsh)
   # assume Zsh
   ;;
*/bash)
   # assume Bash
   ;;
*)
   # assume something else
   ;;
esac

# You can also make it machine-specific
if [[ "$(hostname)" == "myServer" ]];
    then {do_something};
fi