-- Table: application.book_genre

-- DROP TABLE IF EXISTS application.book_genre;

CREATE TABLE IF NOT EXISTS application.book_genre
(
    book_id integer,
    genre_id integer,
    CONSTRAINT book_id FOREIGN KEY (book_id)
        REFERENCES application.books (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES application.genres (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS application.book_genre
    OWNER to admin;