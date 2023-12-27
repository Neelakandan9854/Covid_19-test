{% snapshot  fct_bedscalculation %}

    {% set new_schema = target.schema + "_snapshot" %}

    {{
        config(
            target_database="covid_19_test",
            target_schema=new_schema,
            unique_key="state",
            strategy="check",
            check_cols=["icubedsshortage", "covidbedsshortage", "allbedsshortage"],
            updated_at="date",
        )
    }}

    select *
    from covid_19_test.{{ target.schema }}.fct_bedscalculation

{% endsnapshot %}
