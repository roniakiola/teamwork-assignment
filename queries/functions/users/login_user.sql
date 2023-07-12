CREATE OR REPLACE FUNCTION login_user(
  email TEXT,
  password TEXT
)
RETURNS BOOLEAN
AS $$
DECLARE
  is_valid BOOLEAN;
BEGIN
  SELECT EXISTS(
    SELECT 1
    FROM users
    WHERE email = login_user.email
      AND password = login_user.password
  ) INTO is_valid;

  RETURN is_valid;
END;
$$ LANGUAGE plpgsql;



SELECT login_user(johndoe@example.com, 'pass123');
