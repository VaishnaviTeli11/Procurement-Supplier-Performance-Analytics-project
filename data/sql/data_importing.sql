SET GLOBAL local_infile = ON;

LOAD DATA LOCAL INFILE 'C:/Food Delivery Intelligence/Data/support_tickets.csv'
INTO TABLE support_tickets
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;