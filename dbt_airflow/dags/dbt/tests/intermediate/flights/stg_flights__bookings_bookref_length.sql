{{
  config(
    severity = 'error',
    error_if = '>1500000',
    warn_if = '>150000',
    )
}}
SELECT 
    b.book_ref
FROM 
    {{ ref('stg_flights__bookings') }} b
WHERE
    length(book_ref) > 5
