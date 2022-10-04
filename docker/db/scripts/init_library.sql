CREATE TABLE Publisher(
    publisher_id    serial primary key,
    name            text,
    address         text
);

CREATE TABLE Category(
    title           text primary key,
    parent_title    text REFERENCES Category(title)
);

CREATE TABLE Book(
    isbn            serial primary key,
    author          text,
    page_count      int,
    title           text,
    year            date,
    publisher_id    serial REFERENCES Publisher(publisher_id)
);

CREATE TABLE Book_Category(
    title                         text REFERENCES Category(title),
    isbn                          int REFERENCES Book(isbn),
    CONSTRAINT category_book_pkey PRIMARY KEY (title, isbn)
);

CREATE TABLE Copy(
    copy_number serial primary key,
    place       int,
    book_id     int REFERENCES Book(isbn)
);

CREATE TABLE Reader(
    reader_id   serial primary key,
    name        text,
    surname     text,
    birthday    date,
    address     text
);

CREATE TABLE Library(
    copy_number int REFERENCES Copy(copy_number),
    reader_id   int REFERENCES Reader(reader_id),
    end_date    date,
    CONSTRAINT  copy_reader_pkey PRIMARY KEY (copy_number, reader_id)
);