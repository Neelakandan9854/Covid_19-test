with

    source as (
        select * from {{ source("public", "CDC_INPATIENT_BEDS_ALL") }}
        ),

    transformed as (
        select 
        coalesce (state ,null),
        date,
        coalesce (inpatient_beds_occupied,0),
        coalesce (total_inpatient_beds,0)

        from source a
    )

select *from transformed
