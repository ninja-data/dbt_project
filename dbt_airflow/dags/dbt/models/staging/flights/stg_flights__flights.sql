{{ 
    config(
        materialized = 'table'
    ) 
}}

SELECT 
    flight_id, 
    flight_no::varchar(11) as flight_no, 
    scheduled_departure, 
    scheduled_arrival, 
    departure_airport, 
    arrival_airport, 
    status, 
    aircraft_code, 
    actual_departure, 
    actual_arrival
FROM {{ source('demo_src', 'flights') }}
{% if target.name == 'dev' %}
LIMIT 100000
{% endif %}