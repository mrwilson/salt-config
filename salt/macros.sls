{% macro dotfile(location, salt_location, requirement=None) -%}
  /home/mrwilson/{{ location }}:
    file.symlink:
      - target: /srv/salt-files/{{ salt_location }}
      - force: True
      - makedirs: True
      - user: mrwilson
      - group: mrwilson
      - mode: 644
  {% if requirement %}
      - require:
        - pkg: {{ requirement }}
  {% endif %}
{%- endmacro %}

{% macro download(url, target_dir, target_name=None) -%}
  Downloading {{ url }}:
    cmd.run:
      - name: wget {{ url }} -N -O {{ target_dir }}/{{ target_name }}
      - unless: test -f {{ target_dir }}/{{ target_name }}
{%- endmacro %}
