{{ config(materialized='ephemeral') }}

WITH listings AS (
    SELECT * FROM {{ ref('src_listings') }}
),

hosts AS (
    SELECT * FROM {{ ref('src_hosts') }}
)

SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.price,
    l.minimum_nights,
    l.updated_at AS listing_updated_at,
    h.host_id,
    h.host_name,
    h.is_superhost
FROM listings l
LEFT JOIN hosts h ON l.host_id = h.host_id
