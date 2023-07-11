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
    b.*
    FROM books b
    WHERE b.book_name ILIKE '%' || keyword || '%'
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
  author VARCHAR[],
  genre VARCHAR[],
  publishing_year INT,
  avg_rating NUMERIC(2,1),
  _description VARCHAR(1000),
  image_url VARCHAR,
  reviews VARCHAR[],
  borrowing_period INT,
  quantity INT
)
AS $$
BEGIN
RETURN QUERY
  SELECT b.id, b.book_name, b.isbn, 
       (SELECT ARRAY_AGG(a.author_name) 
        FROM authors a 
        JOIN book_author ba ON ba.author_id = a.id 
        WHERE ba.book_id = b.id) AS author,
       (SELECT ARRAY_AGG(g.genre_name) 
        FROM genres g 
        JOIN book_genre bg ON bg.genre_id = g.id 
        WHERE bg.book_id = b.id) AS genre,
       b.publishing_year,
       COALESCE(ROUND((AVG(r.rating))), 1) AS avg_rating,
       b._description, b.image_url, ARRAY_AGG(r.comment) AS reviews, b.borrowing_period, b.quantity
FROM books b
LEFT JOIN reviews r ON b.id = r.book_id
WHERE b.id = input_id
GROUP BY b.id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_book_by_id(2);




    