with
    sourceicu as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ICU_ALL") }}
        ),

    transformed as (
        select
        c.state,
        c.date, 
        c.staffed_adult_icu_beds_occupied, 
        c.total_staffed_icu_beds
        from sourceicu c
    )

select *from transformed
