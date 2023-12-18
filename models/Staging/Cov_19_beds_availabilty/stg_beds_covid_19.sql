with
source19 as (
    select * from {{ source("public", "CDC_INPATIENT_BEDS_COVID_19") }}
    ),

transformed as (
    select 
    coalesce (state ,0),
    date,
    coalesce (inpatient_beds_occupied,0), 
    coalesce (total_inpatient_beds,0) 
    from source19 b
)

select *from transformed
