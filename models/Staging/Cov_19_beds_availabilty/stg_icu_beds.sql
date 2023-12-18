with
    sourceicu as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ICU_ALL") }}
        ),

    transformed as (
        select
        coalesce (state,0),
        date, 
        coalesce (staffed_adult_icu_beds_occupied,0), 
        coalesce (total_staffed_icu_beds,0)
        from sourceicu c
    )

select *from transformed
