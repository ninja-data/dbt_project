{% set current_date = run_started_at | string | truncate(10, True, "") | int %}
{% set current_year = run_started_at | string | truncate(4, True, "") | int  %}
{% set prev_year = current_year - 10 %}

SELECT 
    COUNT(*) as {{ adapter.quote('cnt') }}
FROM
    {{ ref('fct_flights') }}
WHERE 
    scheduled_departure BETWEEN '{{ current_date }}' AND '{{ current_date | replace(current_year, prev_year) }}'


{# 1 #}
{# {% set source_relation = adapter.get_relation(
        database="dwh_flight",
        schema="intermediate",
        identifier="fct_flights") %}

{{ source_relation.database }}
{{ source_relation.schema }}
{{ source_relation.identifier }}
{{ source_relation.is_table }}
{{ source_relation.is_view }}
{{ source_relation.is_cte }} #}


{# 2 #}
{# {% set source_relation = load_relation( ref("fct_bookings")) %}
{% set columns = adapter.get_columns_in_relation(source_relation) %}

{% for column in columns %}
    {{ 'Columns: '~ column}}
{% endfor %} #}

{# 3 #}
{# {% set source_relation = api.Relation.create(
        database="dwh_flight",
        schema="intermediate",
        identifier="fct_bookings",
        type="table")
%}

{% set columns = adapter.get_columns_in_relation(source_relation) %}

{% for column in columns %}
    {{ 'Columns: '~ column}}
{% endfor %} #}


{# {% do adapter.drop_schema(
    api.Relation.create(
        database="dwh_flight",
        schema="test_schema"
        )
    ) 
%} #}


{# {% set fct_fligths = api.Relation.create(
        database = 'dwh_flight',
        schema = 'intermediate',
        identifier = 'fct_fligths',
        type = 'table'
    ) 
%}

{% set stg_flights__flights = api.Relation.create(
        database = 'dwh_flight',
        schema = 'intermediate',
        identifier = 'stg_flights__flights',
        type = 'table'
    ) 
%}

{% do adapter.expand_target_column_types(stg_flights__flights, fct_fligths) %}

{% for column in adapter.get_columns_in_relation(stg_flights__flights) %}
    {{ 'Column: ' ~ column }}
{%- endfor %} 


{% for column in adapter.get_columns_in_relation(fct_fligths) %}
    {{ 'Column: ' ~ column }}
{%- endfor %}  #}