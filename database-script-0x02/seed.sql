-- ##########################################
-- Sample Data for Airbnb Clone Database
-- ##########################################

-- 1. Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice',   'Johnson', 'alice@example.com',   'hash_pw_1', '+1234567890', 'guest', '2025-01-10 09:15:00'),
  ('22222222-2222-2222-2222-222222222222', 'Bob',     'Smith',   'bob@example.com',     'hash_pw_2', '+1234567891', 'host',  '2025-01-11 10:20:00'),
  ('33333333-3333-3333-3333-333333333333', 'Carol',   'Nguyen',  'carol@example.com',   'hash_pw_3', '+1234567892', 'guest', '2025-01-12 11:25:00'),
  ('44444444-4444-4444-4444-444444444444', 'David',   'Lee',     'david@example.com',   'hash_pw_4', '+1234567893', 'host',  '2025-01-13 12:30:00'),
  ('55555555-5555-5555-5555-555555555555', 'Eve',     'Khan',    'eve@example.com',     'hash_pw_5', '+1234567894', 'admin', '2025-01-14 13:35:00');

-- 2. Properties
INSERT INTO "Property" (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage',   'A quaint cottage in the countryside.',      'Upper Valley, CA', 75.00, '2025-02-01 08:00:00', '2025-02-15 09:00:00'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '22222222-2222-2222-2222-222222222222', 'Downtown Loft',  'Modern loft in the heart of the city.',      'Downtown, NY',     120.00,'2025-02-05 10:00:00', '2025-02-16 11:00:00'),
  ('ccccccc3-cccc-cccc-cccc-cccccccccc3', '44444444-4444-4444-4444-444444444444', 'Beachside Bungalow','Steps from the beach with ocean views.', 'Santa Monica, CA', 200.00,'2025-02-10 14:00:00','2025-02-20 15:00:00');

-- 3. Bookings
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('ddddddd4-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1','11111111-1111-1111-1111-111111111111', '2025-03-01', '2025-03-05', 300.00, 'confirmed','2025-02-20 16:00:00'),
  ('eeeeeee5-eeee-eeee-eeee-eeeeeeeeeeee', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2','33333333-3333-3333-3333-333333333333', '2025-03-10', '2025-03-12', 240.00, 'pending',  '2025-02-22 17:00:00'),
  ('fffffff6-ffff-ffff-ffff-ffffffffffff', 'ccccccc3-cccc-cccc-cccc-cccccccccc3','11111111-1111-1111-1111-111111111111', '2025-04-01', '2025-04-07', 1400.00,'canceled', '2025-02-25 18:00:00');

-- 4. Payments
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('99999991-9999-9999-9999-999999999991','ddddddd4-dddd-dddd-dddd-dddddddddddd', 300.00, '2025-02-21 12:00:00', 'credit_card'),
  ('99999992-9999-9999-9999-999999999992','eeeeeee5-eeee-eeee-eeee-eeeeeeeeeeee', 240.00, '2025-02-23 13:00:00', 'paypal');

-- 5. Reviews
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('77777777-7777-7777-7777-777777777777','aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1','11111111-1111-1111-1111-111111111111', 5, 'Absolutely loved the cottage—cozy and quiet!', '2025-03-06 10:00:00'),
  ('88888888-8888-8888-8888-888888888888','bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2','33333333-3333-3333-3333-333333333333', 4, 'Great location, a bit noisy at night but overall fantastic.', '2025-03-13 11:00:00');

-- 6. Messages
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','11111111-1111-1111-1111-111111111111','22222222-2222-2222-2222-222222222222','Hi Bob, I have a question about check-in time.','2025-02-28 09:30:00'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','22222222-2222-2222-2222-222222222222','11111111-1111-1111-1111-111111111111','Hello Alice, check-in is after 3 PM.','2025-02-28 10:00:00'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc','33333333-3333-3333-3333-333333333333','44444444-4444-4444-4444-444444444444','Is the bungalow available for early check-in?','2025-02-27 14:15:00');
