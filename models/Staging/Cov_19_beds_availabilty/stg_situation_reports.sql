with
    src as (select * from {{ source("public", "JHU_COVID_19") }}),
    transformed as (
        select iso3166_1, date, case_type, coalesce(cases, 0) as cases from src
    )

select *
from transformed
