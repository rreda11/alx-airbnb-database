CREATE PARTITION FUNCTION pfBookingByStartDate (DATE)
AS RANGE LEFT FOR VALUES 
(
    '2022-12-31',
    '2023-12-31',
    '2024-12-31',
    '2025-12-31'
);


CREATE PARTITION SCHEME psBookingByStartDate
AS PARTITION pfBookingByStartDate
ALL TO ([PRIMARY]);


CREATE TABLE BookingPartitioned
(
    booking_id   UNIQUEIDENTIFIER PRIMARY KEY,
    property_id  UNIQUEIDENTIFIER NOT NULL,
    user_id      UNIQUEIDENTIFIER NOT NULL,
    start_date   DATE NOT NULL,
    end_date     DATE NOT NULL,
    total_price  DECIMAL(10,2) NOT NULL,
    status       VARCHAR(20) NOT NULL,
    created_at   DATETIME NOT NULL DEFAULT GETDATE()
)
ON psBookingByStartDate(start_date);


SELECT 
        booking_id,
        SUM(amount) AS total_payment_amount,
        MAX(payment_date) AS latest_payment_date,
        STRING_AGG(payment_method, ', ') WITHIN GROUP (ORDER BY payment_date DESC) AS payment_methods,
        FIRST_VALUE(payment_id) OVER (PARTITION BY booking_id ORDER BY payment_date DESC) AS latest_payment_id
    FROM Payment
    GROUP BY booking_id
