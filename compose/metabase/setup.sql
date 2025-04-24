CREATE DATABASE IF NOT EXISTS metabase;

CREATE TABLE metabase.dummy (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE metabase.azure_cost (
    DepartmentName VARCHAR(255),
    AccountName VARCHAR(255),
    AccountOwnerId VARCHAR(255),
    SubscriptionGuid VARCHAR(255),
    SubscriptionName VARCHAR(255),
    ResourceGroup VARCHAR(255),
    ResourceLocation VARCHAR(255),
    AvailabilityZone VARCHAR(255),
    UsageDateTime DATETIME,
    ProductName VARCHAR(255),
    MeterCategory VARCHAR(255),
    MeterSubcategory VARCHAR(255),
    MeterId VARCHAR(255),
    MeterName VARCHAR(255),
    MeterRegion VARCHAR(255),
    UnitOfMeasure VARCHAR(255),
    UsageQuantity FLOAT,
    ResourceRate FLOAT,
    PreTaxCost FLOAT,
    CostCenter VARCHAR(255),
    ConsumedService VARCHAR(255),
    ResourceType VARCHAR(255),
    InstanceId VARCHAR(255),
    Tags TEXT,
    OfferId VARCHAR(255),
    AdditionalInfo TEXT,
    ServiceInfo1 TEXT,
    ServiceInfo2 TEXT,
    Currency VARCHAR(10)
);

CREATE USER 'healthcheck'@'%' IDENTIFIED BY 'healthcheck';

GRANT SELECT ON metabase.dummy TO 'healthcheck'@'%';

GRANT ALL PRIVILEGES ON `metabase`.* TO 'metabase'@'%';

FLUSH PRIVILEGES;

LOAD DATA INFILE '/var/lib/mysql-files/data.csv'
INTO TABLE metabase.azure_cost
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
