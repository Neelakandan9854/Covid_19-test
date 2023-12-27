with
source19 as (
    select * from {{ source("public", "CDC_INPATIENT_BEDS_COVID_19") }}
    ),

transformed as (
    select 
    state,
    date,
    COALESCE (inpatient_beds_occupied,0) as inpatient_beds_occupied,
    COALESCE (total_inpatient_beds ,0) as total_inpatient_beds
    from source19 
)

select *from transformed
