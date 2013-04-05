{% from 'macros.sls' import dotfile %}

zsh:
  pkg:
    - installed

{{ dotfile('.zshrc', 'dotfiles/zshrc', 'zsh') }}

/home/mrwilson/.zshrc.d:
  file.recurse:
    - source: salt://dotfiles/zshrc.d
    - user: mrwilson
    - group: mrwilson
    - file_mode: 644
    - makedirs: True
    - require:
      - pkg: zsh

vim-packages:
  pkg.installed:
    - names:
      - vim

{{ dotfile('.vimrc', 'dotfiles/vimrc', 'vim') }}

