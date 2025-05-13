-- User Table Indexes
CREATE INDEX idx_user_role ON [User](role);

-- Booking Table Indexes
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property Table Indexes
CREATE INDEX idx_property_location ON Property(location);

EXPLAIN ANALYZE role FROM [User]
