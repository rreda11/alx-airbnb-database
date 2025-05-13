EXPLAIN SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total,
    b.status AS booking_status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
INNER JOIN [User] u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
WHERE b.status NOT IN ('cancelled', 'deleted')
AND b.end_date >= CURRENT_DATE
AND u.role = 'customer';
