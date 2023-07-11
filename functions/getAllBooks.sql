CREATE OR REPLACE FUNCTION get_all_books_with_params(
  keyword TEXT,
  sort_column TEXT,
  sort_order TEXT,
  limit_rows INT,
  offset_rows INT
)
RETURNS TABLE (
  id INT,
  book_name VARCHAR(50),
  isbn VARCHAR(13),
  publishing_year INT,
  _description VARCHAR(1000),
  image_url VARCHAR,
  borrowing_period INT,
  quantity INT
)
AS $$
BEGIN
  RETURN QUERY EXECUTE format(
    'SELECT *
     FROM books
     WHERE book_name ILIKE $1
     ORDER BY %I %s
     LIMIT $2 OFFSET $3',
    sort_column,
    sort_order
  )
  USING '%' || keyword || '%', limit_rows, offset_rows;
END;
$$
LANGUAGE plpgsql;
