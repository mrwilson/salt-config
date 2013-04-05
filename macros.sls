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
