with

    allbeds as(
        select * from {{ ref("stg_beds_all") }}
        ),
    covid_19beds as(
        select * from {{ ref("stg_beds_covid_19") }}
        ),
    icubeds as(
        select * from {{ ref("stg_icu_beds") }}
        ),

    bedscalculation as (
        select
            a.state,
            a.date,
            a.inpatient_beds_occupied as occupied_all_beds,
            b.inpatient_beds_occupied as occupied_covid_beds,
            c.staffed_adult_icu_beds_occupied as occupied_icu_beds,
            a.total_inpatient_beds as total_patient_beds,
            b.total_inpatient_beds  as total_covid_beds,
            c.total_staffed_icu_beds as total_icu_beds

        from allbeds a
        left join covid_19beds b on a.state = b.state and a.date = b.date
        left join icubeds c on a.state = c.state and a.date = c.date
    )

select * from bedscalculation
