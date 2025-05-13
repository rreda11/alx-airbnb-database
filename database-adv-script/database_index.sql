-- Enable statistics to measure performance
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Sample query before indexing
-- Measure performance of filtering by booking status
SELECT * FROM Booking WHERE status = 'confirmed';

-- Sample query for user role filtering
SELECT * FROM [User] WHERE role = 'host';

-- Sample query filtering properties by location
SELECT * FROM Property WHERE location = 'Cairo, Egypt';

-- ================================
-- Indexes to improve performance
-- ================================

-- User Table Index
CREATE INDEX idx_user_role ON [User](role);

-- Booking Table Indexes
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property Table Index
CREATE INDEX idx_property_location ON Property(location);

-- ================================
-- Rerun queries after indexing
-- ================================

-- Measure query performance again after indexes
SELECT * FROM Booking WHERE status = 'confirmed';
SELECT * FROM [User] WHERE role = 'host';
SELECT * FROM Property WHERE location = 'Cairo, Egypt';

-- Disable statistics after tests
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
