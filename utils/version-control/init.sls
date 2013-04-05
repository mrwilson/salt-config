{% from 'macros.sls' import dotfile %}

version-control:
  pkg.installed:
    - names:
      - git
      - mercurial

{{ dotfile('.gitconfig', 'dotfiles/gitconfig', 'git') }}
{{ dotfile('.gitignore', 'dotfiles/gitignore', 'git') }}

{{ dotfile('.hgrc', 'dotfiles/hgrc', 'mercurial') }}
