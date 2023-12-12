with 

source as (

    select * from {{ source('pubilc', 'CDC_INPATIENT_BEDS_ALL') }}

),
source19 as (

    select * from {{ source('pubilc', 'CDC_INPATIENT_BEDS_COVID_19') }}

),
sourceicu as (

    select * from {{ source('pubilc', 'CDC_INPATIENT_BEDS_ICU_ALL') }}

),


transformed as(

    SELECT
        a.*,
        b.*,
        c.*
    FROM
         source a
    LEFT JOIN
         source19 b ON a.STATE = b.STATE AND a.DATE = b.DATE
    LEFT JOIN
         sourceicu c ON a.STATE = c.STATE AND a.DATE = c.DATE
)

select  * from  transformed