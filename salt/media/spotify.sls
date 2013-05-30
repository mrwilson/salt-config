spotify-repo:
  pkgrepo.managed:
    - human_name: Spotify Repo
    - name: deb http://repository.spotify.com stable non-free
    - comps: non-free
    - dist: stable
    - keyserver: keyserver.ubuntu.com
    - keyid: 94558F59
    - require_in:
       - spotify_client

spotify-client:
   pkg.installed:
     - require:
       - pkgrepo: spotify-repo
