CREATE TABLE IF NOT EXISTS CUSTOMER(
	id BIGSERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name  TEXT NOT NULL,
	email      TEXT NOT NULL UNIQUE,
	adddress   TEXT NOT NULL,
	create_at  TIMESTAMP WITH TIME ZONE
);

INSERT
INTO CUSTOMER(id, first_name, last_name, email, address, create_at)
VALUES(1, 'Hüseyin', 'AYDIN', 'huseyinaydin99@gmail.com', 'Türkiye,TR', now()),
(2, 'Ali', 'Ünsüz', 'alivelikirkdokuzelli@hotmail.com', 'Türkiye,TR', now()),
(3, 'Veli', 'Bal', 'velialikirkdokuzelli@hotmail.com', 'Türkiye,TR', now()),
(4, 'Maria', 'Mercedes', 'sercedesmaria@outlook.com', 'Türkiye,TR', now());

CREATE TABLE IF NOT EXISTS CUSTOMER_ORDER(
	id, 		 BIGSERIAL PRIMARY KEY,
	customer_id  BIGINT	        NOT NULL REFERENCES CUSTOMER(id),
	total_amount NUMERIC(10, 2) NOT NULL,
	create_at    TIMESTAMP WITH TIME ZONE
);

INSERT INTO CUSTOMER_ORDER(customer_id, total_amount, create_at)
VALUES(1, 1.00, now()),
	  (2, 7.25, now()),
	  (3, 8.71, now()),
	  (4, 0.28, now());
	 
	 
CREATE TABLE IF NOT EXISTS PRODUCT(
	id            BIGSERIAL PRIMARY KEY,
	product_name  TEXT            NOT NULL,
	price 		  NUMERIC(10, 2), NOT NULL,
	discounted	  BOOLEAN		  NOT NULL
);

INSERT INTO PRODUCT(id, product_name, price, discounted)
VALUES(1, 'Pırasa', 1.40, false),
(2, 'Ispanak', 0.40, false),
(3, 'Kabak', 0.19, false),
(4, 'Patlıcan', 0.89, false) --ne kadar da uzun değil mi? (:

CREATE TABLE IF NOT EXISTS ORDER_ITEM(
	id,        BIGSERIAL PRIMARY KEY,
	order_id   BIGINT         NOT NULL REFERENCES CUSTOMER_ORDER(id),
	product_id BIGINT		  NOT NULL REFERENCES PRODUCT(id),
	quantity   INT 			  NOT NULL CHECK(quantity > 0),
	price 	   NUMERIC(10, 2) NOT NULL
);

INSERT INTO ORDER_ITEM(order_id, product_id, quantity, price)
VALUES(1, 1, 1, 1.40),
(1, 2, 1, 0.40),
(2, 3, 2, ,.38),
(4, 4, 1, 1.00),
(4, 5, 1, 1.90);