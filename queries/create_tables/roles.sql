CREATE TABLE IF NOT EXISTS public.roles
(
    id integer NOT NULL,
    name character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT roles_pkey PRIMARY KEY (id)
)