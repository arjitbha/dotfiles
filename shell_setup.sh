#!/usr/bin/env zsh

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

#######################
# BIN
#######################

mkdir -p $HOME/bin

# FASD
if [[ ! -f $HOME/bin/fasd ]]; then
    git clone https://github.com/clvv/fasd.git /tmp/fasd
    cd /tmp/fasd
    PREFIX=$HOME make install
    cd -
fi

# FZF
if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    yes | $HOME/.fzf/install
fi

# DIFF-SO-FANCY
if [[ ! -f $HOME/bin/diff-so-fancy ]]; then
    curl -o $HOME/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
fi

# YDIFF
if [[ ! -f $HOME/bin/ydiff ]]; then
    curl -ksSL https://raw.github.com/ymattw/ydiff/master/ydiff.py > $HOME/bin/ydiff
    chmod +x $HOME/bin/ydiff
fi


# #######################
# # TMUX
# #######################

# tmux plugin manager
if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi


# #######################
# # ZSH
# #######################

# Download oh my zsh for configuration management
if [[ ! -d $HOME/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Download minimalistic theme for zsh
if [[ ! -f $ZSH/custom/themes/common.zsh-theme ]]; then
    wget -O $ZSH/custom/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
fi

mkdir -p $HOME/.zsh

# Fast syntax highlighting plugin
if [[ ! -d $ZSH/custom/plugins/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git $ZSH/custom/plugins/fast-syntax-highlighting
fi
