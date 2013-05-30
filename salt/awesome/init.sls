{% from 'macros.sls' import dotfile %}

awesome-packages:
  pkg.installed:
    - names:
      - awesome
      - xlockmore

{{ dotfile('.config/awesome/rc.lua', 'awesome/rc.lua', 'awesome') }}
{{ dotfile('.config/awesome/theme.lua', 'awesome/theme.lua', 'awesome') }}
