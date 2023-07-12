CREATE OR REPLACE FUNCTION get_all_authors()
RETURNS TABLE (
  id INTEGER,
  author_name CHARACTER VARYING(30)
)
AS $$
BEGIN
  RETURN QUERY
  SELECT authors.id, authors.author_name
  FROM authors;
END;
$$ LANGUAGE plpgsql;
