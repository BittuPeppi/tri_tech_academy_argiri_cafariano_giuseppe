CREATE TABLE AG_CUSTOMER(
    ID NUMBER PRIMARY KEY,
    FIRSTNAME VARCHAR2(100) NOT NULL,
    LASTNAME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL,
    PHONENUMBER VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL,
    BIRTHDATE DATE NOT NULL,
    PASSWORD VARCHAR2(100) NOT NULL
);

CREATE TABLE AG_CREDITCARD(
    ID NUMBER PRIMARY KEY,
    NCARD VARCHAR2(20) NOT NULL,
    DEADLINE DATE NOT NULL,
    CVV VARCHAR2(5) NOT NULL,
    CUSTOMER NUMBER REFERENCES AG_CUSTOMER(ID) ON DELETE CASCADE
);

CREATE TABLE AG_SELLER(
    ID NUMBER primary key,
    NAME VARCHAR2(100) NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL
);

CREATE TABLE AG_CATEGORY(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE AG_PRODUCT(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    DESCRIPTION VARCHAR2(500) NOT NULL,
    PRICE NUMBER(8,2) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    PHOTO BLOB not null,
    SELLER NUMBER REFERENCES AG_SELLER(ID) ON DELETE CASCADE,
    CATEGORY NUMBER REFERENCES AG_CATEGORY(ID) ON DELETE CASCADE
);

CREATE TABLE AG_ORDERDETAIL(
    ID NUMBER PRIMARY KEY,
    DELIVERY_DATE DATE,
    ORDER_DATE DATE,
    STATUS VARCHAR2(100) NOT NULL,
    PAYMENT_METHOD VARCHAR(50) NOT NULL,
    SHIPPING_DATE DATE
);

CREATE TABLE AG_ORDER(
    ID NUMBER PRIMARY KEY,
    CUSTOMER NUMBER REFERENCES AG_CUSTOMER(ID) ON DELETE CASCADE,
    PRODUCT NUMBER REFERENCES AG_PRODUCT(ID) ON DELETE CASCADE,
    QUANTITY NUMBER NOT NULL,
    DETAIL NUMBER REFERENCES AG_ORDERDETAIL(ID) ON DELETE CASCADE
);

CREATE TABLE AG_RETURN(
    ID NUMBER PRIMARY KEY,
    DETAIL NUMBER REFERENCES AG_RETURNDETAIL(ID) ON DELETE CASCADE,
    PRODUCT NUMBER REFERENCES AG_PRODUCT(ID) ON DELETE CASCADE,
    CUSTOMER NUMBER REFERENCES AG_CUSTOMER(ID) ON DELETE CASCADE
);
