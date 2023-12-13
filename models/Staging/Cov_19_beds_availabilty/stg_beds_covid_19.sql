with
source19 as (
    select * from {{ source("public", "CDC_INPATIENT_BEDS_COVID_19") }}
    ),

transformed as (
    select 
    b.state,
    b.date,
    b.inpatient_beds_occupied, 
    b.total_inpatient_beds 
    from source19 b
)

select *from transformed
