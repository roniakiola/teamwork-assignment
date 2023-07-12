CREATE OR REPLACE FUNCTION get_all_loans(
  sort_column TEXT DEFAULT 'id',
  sort_order TEXT DEFAULT 'ASC',
  page_number INTEGER DEFAULT 1,
  page_limit INTEGER DEFAULT 10
)
RETURNS TABLE (
  id INTEGER,
  borrowed_date DATE,
  returned_date DATE,
  due_date DATE,
  book_id INTEGER,
  user_id INTEGER
)
AS $$
BEGIN
  RETURN QUERY
  SELECT loans.id, loans.borrowed_date, loans.returned_date, loans.due_date, loans.book_id, loans.user_id
  FROM loans
  ORDER BY sort_column || ' ' || sort_order
  LIMIT page_limit OFFSET (page_number - 1) * page_limit;
END;
$$ LANGUAGE plpgsql;
