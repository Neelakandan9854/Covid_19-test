with
    sourceicu as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ICU_ALL") }}
        ),

    transformed as (
        select
        state,
        date,
        COALESCE (staffed_adult_icu_beds_occupied,0) as staffed_adult_icu_beds_occupied,
        COALESCE (total_staffed_icu_beds ,0) as total_staffed_icu_beds 
     from sourceicu 
    )

select *from transformed
