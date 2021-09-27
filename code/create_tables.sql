
CREATE TABLE stock (
    id SERIAL PRIMARRY KEY,
    --Auto incrementing integer 
    --when we insert a record into this table  itll start with a 1,2,3 etc
    --easy way to reference a unique record in the stock table 
    symbol TEXT NOT NULL,
    name TEXT NOT NULL,
    exchange TEXT NOT NULL,
    is_etf BOOLEAN NOT NULL,
);

CREATE TABLE etf_holding (
    etf_id INTEGER NOT NULL,
    holding_id INTEGER NOT NULL,
    --These are just references to a stock,
    dt DATE NOT NULL,
    shares NUMERIC,
    weight NUMERIC,
    --How do we uniquely identify one of these holdings?
    --We use a compound primary key
    --The primary key is a combo of the three
    PRIMARY KEY (etf_id, holding_id, dt)
    --This way we have multiple records per holding in the etf for every single day


);

CREATE TABLE stock_price (

);
