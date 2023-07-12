CREATE OR REPLACE FUNCTION get_all_roles(
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  filter_column TEXT DEFAULT NULL,
  filter_value TEXT DEFAULT NULL,
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  id INTEGER,
  name CHARACTER VARYING(30)
)
AS $$
BEGIN
  RETURN QUERY
  SELECT roles.id, roles.name
  FROM roles
  WHERE 
    CASE WHEN filter_column IS NOT NULL THEN
    filter_column ILIKE '%' || filter_value || '%'
    ELSE TRUE END
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
