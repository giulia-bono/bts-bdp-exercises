{{ config(materialized='table') }}

SELECT * FROM {{ ref('_int_listing_with_host') }}
