CREATE OR REPLACE FUNCTION logout_user()
RETURNS BOOLEAN
AS $$
BEGIN

  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;


SELECT logout_user();
DROP FUNCTION IF EXISTS create_book(INT, VARCHAR(50), VARCHAR(13), INT[], INT[], INT, VARCHAR(1000), VARCHAR, INT, INT)
