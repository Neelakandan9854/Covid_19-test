


with
    allbed as (select * from {{ ref("int_bedsCalculation") }}),
    final as (
        select
            allbed.state,
            allbed.date,
            allbed.total_patient_beds - occupied_all_beds as allbeds,
            allbed.total_covid_beds - occupied_covid_beds as covidbeds,
            allbed.total_icu_beds - occupied_icu_beds as icubeds,
            allbed.cases as cases,
            ((cases-icubeds)/cases)*100 as icubedsshortage,
            ((cases-covidbeds)/cases)*100 as covidbedsshortage,
            ((cases-allbeds)/cases)*100 as allbedsshortage,
            {{
                bedsall(covidbed='covidbedsshortage',
                icubed='icubedsshortage',
                   albed='allbedsshortage'
                )
            }} as bed_shortage
             
        from allbed
    )
select *
from final
