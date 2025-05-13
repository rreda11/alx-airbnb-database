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
