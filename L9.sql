CREATE TABLE RETAIL_CENTRE
        (center_id  NUMBER(4) NOT NULL,
        retail_type VARCHAR(25) NOT NULL,
        address     VARCHAR(25) NOT NULL
        );

CREATE TABLE EXPRESS_TRANSPORTATION
        (schedule_number    NUMBER(4) NOT NULL,
        tr_type             VARCHAR(25) NOT NULL,
        delivery_route      VARCHAR(25) NOT NULL
        );

CREATE TABLE ITEM   
        (item_number        NUMBER(4) NOT NULL,    
        item_weight         VARCHAR2(25) NOT NULL,    
        dimention           VARCHAR2(25),    
        insurance_amount    VARCHAR2(8),    
        destination         NUMBER(9,2),
        delivery_date       CHAR(10),
        center_id           NUMBER(4) NOT NULL   
        );

CREATE TABLE ITEM_TRANSPORTATION
        (item_number        NUMBER(4) NOT NULL,
        schedule_number    NUMBER(4) NOT NULL
        );
    
 -- create primary keys       
ALTER TABLE RETAIL_CENTRE
ADD CONSTRAINT center_id Primary Key (center_id);
        
ALTER TABLE EXPRESS_TRANSPORTATION
ADD CONSTRAINT schedule_number Primary Key (schedule_number);

ALTER TABLE ITEM
ADD CONSTRAINT item_number Primary Key (item_number);

--- create foreign key and handle the bridge constraints
ALTER TABLE ITEM
ADD FOREIGN KEY (center_id) REFERENCES RETAIL_CENTRE(center_id);

ALTER TABLE ITEM_TRANSPORTATION
ADD CONSTRAINT item_schedule PRIMARY KEY (item_number, schedule_number);

ALTER TABLE ITEM_TRANSPORTATION
ADD FOREIGN KEY (item_number) REFERENCES ITEM(item_number);

ALTER TABLE ITEM_TRANSPORTATION
ADD FOREIGN KEY (schedule_number) REFERENCES EXPRESS_TRANSPORTATION(schedule_number);



