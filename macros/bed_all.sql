{% macro beds_all(column_name, decimal_places) -%}
    {% set numerator_value = column_name | float %}
    {% set denominator_value = decimal_places | float %}
    {% if (numerator_value / denominator_value) * 100.0 > 80 %}
        The value is critical_shortage.
    {% else %}
        The value is No_shortage.
    {% endif %}
{%- endmacro %}