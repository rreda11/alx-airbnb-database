-- 1. ENUM Types
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- 2. User Table
CREATE TABLE "User" (
  user_id        UUID         PRIMARY KEY,
  first_name     VARCHAR(100) NOT NULL,
  last_name      VARCHAR(100) NOT NULL,
  email          VARCHAR(255) NOT NULL UNIQUE,
  password_hash  VARCHAR(255) NOT NULL,
  phone_number   VARCHAR(20),
  role           user_role    NOT NULL,
  created_at     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_user_email ON "User"(email);

-- 3. Property Table
CREATE TABLE "Property" (
  property_id     UUID         PRIMARY KEY,
  host_id         UUID         NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  name            VARCHAR(200) NOT NULL,
  description     TEXT         NOT NULL,
  location        VARCHAR(255) NOT NULL,
  pricepernight   DECIMAL(10,2) NOT NULL,
  created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_property_host ON "Property"(host_id);

-- 4. Booking Table
CREATE TABLE "Booking" (
  booking_id   UUID           PRIMARY KEY,
  property_id  UUID           NOT NULL REFERENCES "Property"(property_id) ON DELETE CASCADE,
  user_id      UUID           NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  start_date   DATE           NOT NULL,
  end_date     DATE           NOT NULL,
  total_price  DECIMAL(10,2)  NOT NULL,
  status       booking_status NOT NULL,
  created_at   TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_booking_dates CHECK (end_date > start_date)
);
CREATE INDEX idx_booking_property ON "Booking"(property_id);
CREATE INDEX idx_booking_user ON "Booking"(user_id);

-- 5. Payment Table
CREATE TABLE "Payment" (
  payment_id      UUID           PRIMARY KEY,
  booking_id      UUID           NOT NULL REFERENCES "Booking"(booking_id) ON DELETE CASCADE,
  amount          DECIMAL(10,2)  NOT NULL,
  payment_date    TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_method  payment_method NOT NULL
);
CREATE INDEX idx_payment_booking ON "Payment"(booking_id);

-- 6. Review Table
CREATE TABLE "Review" (
  review_id   UUID        PRIMARY KEY,
  property_id UUID        NOT NULL REFERENCES "Property"(property_id) ON DELETE CASCADE,
  user_id     UUID        NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  rating      INTEGER     NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment     TEXT        NOT NULL,
  created_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_review_property ON "Review"(property_id);
CREATE INDEX idx_review_user ON "Review"(user_id);

-- 7. Message Table
CREATE TABLE "Message" (
  message_id    UUID      PRIMARY KEY,
  sender_id     UUID      NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  recipient_id  UUID      NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  message_body  TEXT      NOT NULL,
  sent_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_message_sender ON "Message"(sender_id);
CREATE INDEX idx_message_recipient ON "Message"(recipient_id);
