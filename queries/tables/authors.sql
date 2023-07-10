-- Table: application.authors

-- DROP TABLE IF EXISTS application.authors;

CREATE TABLE IF NOT EXISTS application.authors
(
    id integer NOT NULL DEFAULT nextval('application.authors_id_seq'::regclass),
    author_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT authors_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS application.authors
    OWNER to admin;