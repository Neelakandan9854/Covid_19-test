{% macro bedsall(icubed, covidbed, albed) %}
  CASE
    WHEN {{icubed }} > 80 THEN
      'Critical Shortage'
    WHEN {{covidbed }} > 80 THEN
      'Covid Shortage'
    WHEN {{albed }} > 80 THEN
      'Bed Shortage'
    else 'No Shortage'
    
  END
{% endmacro %}