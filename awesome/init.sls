{% from 'macros.sls' import dotfile %}

awesome:
  pkg:
    - installed

{{ dotfile('.config/awesome/rc.lua', 'awesome/rc.lua', 'awesome') }}
{{ dotfile('.config/awesome/theme.lua', 'awesome/theme.lua', 'awesome') }}
