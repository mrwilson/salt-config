{% from 'macros.sls' import dotfile, download %}

shell-packages:
  pkg.installed:
    - names:
      - zsh
      - vim
      - htop
      - rxvt-unicode
      - screen
      - xlockmore
      - g++
      - valgrind

{{ dotfile('.zshrc.d', 'dotfiles/zshrc.d', 'zsh') }}
{{ dotfile('.zshrc', 'dotfiles/zshrc', 'zsh') }}
{{ dotfile('.Xdefaults', 'dotfiles/Xdefaults', 'zsh') }}
{{ dotfile('.vimrc', 'dotfiles/vimrc', 'vim') }}
{{ download('https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim', '/home/mrwilson/.vim/colors') }} 
