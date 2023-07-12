CREATE OR REPLACE FUNCTION get_all_fines(
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  fine_id INTEGER,
  created_date DATE,
  due_date DATE,
  payment_date DATE,
  balance NUMERIC(5,2)[],
  loan_id INTEGER
)
AS $$
BEGIN
  RETURN QUERY
  SELECT fine.id, fine.created_date, fine.due_date, fine.payment_date, fine.balance, fine.loan_id
  FROM fine
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
