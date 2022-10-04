CREATE TABLE Station (
    statNr  serial primary key,
    name    text
);

CREATE TABLE Room (
    roomNr      serial primary key,
    beds        int,
    station_id  int REFERENCES Station(statNr)
);

CREATE TABLE StationPersonell(
    persNr      serial primary key,
    name        text,
    station_id  int REFERENCES Station(statNr)
);

CREATE TABLE Caregiver(
    caregiver_id    serial primary key,
    qualification   text
);

CREATE TABLE Doctor(
    doctor_id   serial primary key,
    rank        text,
    area        text
);

CREATE TABLE Patient(
    patientNr   serial primary key,
    name        text,
    disease     text,
    treats      int REFERENCES Doctor(doctor_id)
);

CREATE TABLE Admission(
    admission_from  date,
    admission_to    date,
    roomNr          int REFERENCES Room(roomNr),
    patientNr       int REFERENCES Patient(patientNr)
);