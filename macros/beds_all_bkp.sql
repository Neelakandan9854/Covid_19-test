{% macro bedsall_bkp(icubed, covidbed, albed) -%}
    {% if icubed > 80 %}
        'Critical Shortage'
    {% elif covidbed > 80 %}
        'Covid Shortage'
    {% elif albed > 80 %}
        'Bed Shortage'
    {% else %}
        'No Shortage'
    {% endif %}
{%- endmacro %}