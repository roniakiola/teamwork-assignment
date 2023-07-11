--Get all books using parameters for search keyword, column name for sorting, sorting order, number of rows returned and offset of rows
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
  RETURN QUERY
  SELECT
    books.*
    FROM books
    WHERE books.book_name ILIKE '%' || keyword || '%'
    ORDER BY sort_column || ' ' || sort_order
    LIMIT limit_rows OFFSET offset_rows;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_all_books_with_params('book', 'book_name', 'ASC', 10, 0);

--Get book by ID
CREATE OR REPLACE FUNCTION get_book_by_id(input_id INT)
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
RETURN QUERY
  SELECT * FROM books WHERE books.id = input_id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_book_by_id(2);

--Trying to make dynamic fetch for all tables, not working
CREATE OR REPLACE FUNCTION get_item_by_id(table_name TEXT, id INT)
  RETURNS void
  LANGUAGE plpgsql AS
$$
BEGIN
   EXECUTE format('SELECT * FROM %I WHERE id = %s', table_name, id);
END
$$;