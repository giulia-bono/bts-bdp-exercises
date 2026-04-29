WITH raw_hosts AS (
    SELECT * FROM {{ source('airbnb_raw', 'raw_hosts') }}
)

SELECT
    host_id,
    host_name,
    CAST(is_superhost AS BOOLEAN) AS is_superhost,
    CAST(updated_at AS DATE) AS updated_at
FROM raw_hosts
