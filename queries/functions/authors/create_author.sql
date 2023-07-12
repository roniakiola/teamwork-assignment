CREATE OR REPLACE FUNCTION create_author(
  p_author_name character varying(30)
)
RETURNS VOID
AS $$
DECLARE
  user_id INTEGER;
BEGIN
  INSERT INTO authors (author_name)
  VALUES (p_author_name);
    RETURNING id INTO id;
    RETURN id;
END;
$$ LANGUAGE plpgsql;

