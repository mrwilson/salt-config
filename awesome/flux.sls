flux-repo:
  pkgrepo.managed:
    - human_name: Flux Repo
    - ppa: kilian/f.lux
    - name: flux

flux:
  pkg.installed:
    - pkgs:
      - fluxgui
    - require:
      - pkgrepo: flux-repo
