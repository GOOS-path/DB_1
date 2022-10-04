CREATE TABLE City(
    region  text,
    name    text,
    primary key (region, name)
);

CREATE TABLE Station(
    name        text primary key,
    tracks      int,
    city_region text,
    city_name   text,

    FOREIGN KEY (city_region, city_name)
        REFERENCES City(region, name)

);

CREATE TABLE Train(
    trainNr         serial primary key,
    length          int,
    start_station   text REFERENCES Station(name),
    end_station     text REFERENCES Station(name)
);

CREATE TABLE Connected(
    departure       date,
    arrival         date,
    start_station   text REFERENCES Station(name),
    end_station     text REFERENCES Station(name),
    trainNr         int REFERENCES Train(trainNr)
);