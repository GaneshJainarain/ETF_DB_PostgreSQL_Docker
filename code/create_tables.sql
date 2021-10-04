
CREATE TABLE stock (
    id SERIAL PRIMARY KEY,
    symbol TEXT NOT NULL,
    name TEXT NOT NULL,
    exchange TEXT NOT NULL,
    is_etf BOOLEAN NOT NULL
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
    CONSTRAINT fk_etf FOREIGN KEY (etf_id) REFERENCES stock (id),
    CONSTRAINT fk_holding FOREIGN KEY (holding_id) REFERENCES stock (id)
    -- *NOTE* A foreign key is a column (or combination of columns)
    -- in a table whose values must match values of a column in some other table. 
    -- FOREIGN KEY constraints enforce referential integrity, which essentially says 
    -- that if column value A refers to column value B, 
    -- then column value B must exist.
    -- In this case when a stock is deleted from the stocks table the data 
    -- from the holdings and stock price table also delete.
);

CREATE TABLE stock_price (
    stock_id INTEGER NOT NULL,
    dt TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    open NUMERIC NOT NULL,
    high NUMERIC NOT NULL,
    low NUMERIC NOT NULL,
    close NUMERIC NOT NULL,
    volume NUMERIC NOT NULL,
    PRIMARY KEY(stock_id, dt)
    CONSTRAINT fk_stock FOREIGN KEY (srock_id) REFERENCES stock (id)
);

CREATE INDEX ON stock_price (stock_id, dt DESC);
--Makes it faster for selecting prices for a stock, instead of scanning through the whole table

SELECT create_hypertable('stock_price', 'dt');

--Auto incrementing integer 
    --when we insert a record into this table  itll start with a 1,2,3 etc
    --easy way to reference a unique record in the stock table 