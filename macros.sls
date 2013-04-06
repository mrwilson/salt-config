{% macro dotfile(new_location, salt_location, requirement=None) -%}
  /home/mrwilson/{{ new_location }}:
    file.managed:
      - source: salt://{{ salt_location }}
      - user: mrwilson
      - group: mrwilson
      - mode: 644
      - makedirs: True
  {% if requirement %}
      - require:
        - pkg: {{ requirement }}
  {% endif %}
{%- endmacro %}

{% macro download(url, target_dir, target_name=None) -%}
  Downloading {{ url }}:
    cmd.run:
    {% if target_name %}
      - name: wget {{ url }} -O {{ target_dir }}/{{ target_name }}
    {% else %}
      - name: wget {{ url }} -P {{ target_dir }}
    {% endif %}
{%- endmacro %}
