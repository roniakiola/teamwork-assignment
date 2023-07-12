CREATE TABLE IF NOT EXISTS public.genres
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    genre_name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT genres_pkey PRIMARY KEY (id)
)
-- ALTER TABLE public.genres
-- ALTER COLUMN id SET DATA TYPE integer,
-- ALTER COLUMN id SET NOT NULL,
-- ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;