{% from 'macros.sls' import dotfile, download %}

zsh:
  pkg:
    - installed

{{ dotfile('.zshrc', 'dotfiles/zshrc', 'zsh') }}
{{ dotfile('.Xdefaults', 'dotfiles/Xdefaults', 'zsh') }}

/home/mrwilson/.zshrc.d:
  file.recurse:
    - source: salt://dotfiles/zshrc.d
    - user: mrwilson
    - group: mrwilson
    - file_mode: 644
    - makedirs: True
    - require:
      - pkg: zsh
vim:
  pkg:
    - installed

{{ dotfile('.vimrc', 'dotfiles/vimrc', 'vim') }}
{{ download('https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim', '/home/mrwilson/.vim/colors') }} 
