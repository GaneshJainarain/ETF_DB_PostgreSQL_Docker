
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

);

CREATE TABLE stock_price (

);
