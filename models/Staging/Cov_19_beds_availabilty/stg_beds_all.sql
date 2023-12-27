with

    source as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ALL") }}
        ),

    transformed as (
        select 
        state,
        date,
        COALESCE (inpatient_beds_occupied,0) as inpatient_beds_occupied,
        COALESCE (total_inpatient_beds,0) as total_inpatient_beds
        from source 
    )

select *from transformed
