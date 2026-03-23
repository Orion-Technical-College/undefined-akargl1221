-- Demo accounts for a simple transfer scenario (extend for your write-up).

CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    balance_cents INTEGER NOT NULL CHECK (balance_cents >= 0)
);

TRUNCATE accounts RESTART IDENTITY;
INSERT INTO accounts (name, balance_cents) VALUES
    ('Checking', 10000),
    ('Savings', 5000);
