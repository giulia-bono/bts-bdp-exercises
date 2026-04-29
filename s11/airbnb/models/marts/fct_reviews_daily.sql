{{ config(materialized='incremental', unique_key='review_date') }}

WITH reviews AS (
    SELECT * FROM {{ ref('src_reviews') }}
)

SELECT
    review_date,
    COUNT(*) AS num_reviews
FROM reviews

{% if is_incremental() %}
    WHERE review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}

GROUP BY review_date
ORDER BY review_date
