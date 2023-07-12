CREATE OR REPLACE FUNCTION delete_fine(
  p_fine_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
  DELETE FROM fine
  WHERE id = p_fine_id;
END;
$$ LANGUAGE plpgsql;
