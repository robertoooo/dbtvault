CAST(MD5_BINARY(IFNULL((UPPER(TRIM(CAST(BOOKING_REF AS VARCHAR)))), '^^')) AS BINARY(16)) AS BOOKING_PK,
CAST(MD5_BINARY(CONCAT(
    IFNULL(UPPER(TRIM(CAST(CUSTOMER_ID AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST('9999-12-31' AS VARCHAR))), '^^') ))
AS BINARY(16)) AS CUSTOMER_PK,
CAST(MD5_BINARY(CONCAT(
    IFNULL(UPPER(TRIM(CAST(CUSTOMER_ID AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(BOOKING_REF AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(TO_DATE('9999-12-31') AS VARCHAR))), '^^') ))
AS BINARY(16)) AS CUSTOMER_BOOKING_PK,
CAST(MD5_BINARY(CONCAT(
    IFNULL(UPPER(TRIM(CAST(CUSTOMER_ID AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(NATIONALITY AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(PHONE AS VARCHAR))), '^^') ))
AS BINARY(16)) AS BOOK_CUSTOMER_HASHDIFF,
CAST(MD5_BINARY(CONCAT(
    IFNULL(UPPER(TRIM(CAST('STG' AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(BOOKING_DATE AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(BOOKING_REF AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(DEPARTURE_DATE AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(DESTINATION AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(PRICE AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(TO_DATE('9999-12-31') AS VARCHAR))), '^^') ))
AS BINARY(16)) AS BOOK_BOOKING_HASHDIFF