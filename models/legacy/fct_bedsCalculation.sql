with

    allbed as (
        select * from {{ ref("int_bedsCalculation") }}
        ),

    final as (
        select
            allbed.state,
            allbed.date,
            allbed.total_patient_beds - occupied_all_beds as allbeds,
            allbed.total_covid_beds - occupied_covid_beds as covidbeds,
            allbed.total_icu_beds - occupied_icu_beds as icubeds,
            {{ beds_all('total_patient_beds','occupied_all_beds') }} as Beds_all_status

        from allbed
    )

select *from final
