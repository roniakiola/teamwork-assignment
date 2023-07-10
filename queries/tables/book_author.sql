-- Table: application.book_author

-- DROP TABLE IF EXISTS application.book_author;

CREATE TABLE IF NOT EXISTS application.book_author
(
    book_id integer,
    author_id integer,
    CONSTRAINT author_id FOREIGN KEY (author_id)
        REFERENCES application.authors (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES application.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS application.book_author
    OWNER to admin;