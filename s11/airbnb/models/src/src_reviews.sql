WITH raw_reviews AS (
    SELECT * FROM {{ source('airbnb_raw', 'raw_reviews') }}
)

SELECT
    review_id,
    listing_id,
    reviewer_name,
    CAST(review_date AS DATE) AS review_date,
    comments,
    CAST(updated_at AS DATE) AS updated_at
FROM raw_reviews
