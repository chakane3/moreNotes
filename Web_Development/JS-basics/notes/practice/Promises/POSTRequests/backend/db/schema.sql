DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars;
\c cars;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    username TEXT NOT NULL UNIQUE
);

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    brand TEXT,
    model TEXT,
    year INTEGER,
    owner_id INT REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO users(username) 
VALUES 
('Corey'),
('Jon'), 
('Jhenya'),
('Sparky');

INSERT INTO cars(brand, model, year, owner_id)
VALUES
('Toyota', 'Camery', 1995, 1), 
('Toyota', '4Runner', 1990, 1), 
('Ford', 'Mustang', 1964, 2),
('Ford', 'Explorer', 2005, 3),
('Ford', 'Bronco', 2019, 3);