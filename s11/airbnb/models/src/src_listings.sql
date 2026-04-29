WITH raw_listings AS (
    SELECT * FROM {{ source('airbnb_raw', 'raw_listings') }}
)

SELECT
    listing_id,
    listing_name,
    room_type,
    host_id,
    CAST(price AS DECIMAL(10,2)) AS price,
    minimum_nights,
    CAST(updated_at AS DATE) AS updated_at
FROM raw_listings
