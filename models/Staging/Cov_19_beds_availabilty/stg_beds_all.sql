with

    source as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ALL") }}
        ),

    transformed as (
        select 
        a.state,
        a.date,
        a.inpatient_beds_occupied,
        a.total_inpatient_beds

        from source a
    )

select *from transformed
