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
       COALESCE(ROUND(AVG(r.rating), 2), 0) AS avg_rating,
       b._description, b.image_url, ARRAY_AGG(r.comment) AS reviews, b.borrowing_period, b.quantity
FROM books b
LEFT JOIN reviews r ON b.id = r.book_id
WHERE b.id = input_id
GROUP BY b.id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT * FROM get_book_by_id(1);

--Create new book
CREATE OR REPLACE FUNCTION create_book(
  book_name VARCHAR(50),
  isbn VARCHAR(13),
  author_ids INT[],
  genre_ids INT[],
  publishing_year INT,
  _description VARCHAR(1000),
  image_url VARCHAR,
  borrowing_period INT,
  quantity INT
)
RETURNS INT
AS $$
DECLARE 
  new_book_id INT;
  author_id INT;
  genre_id INT;
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM authors WHERE id = ANY(author_ids)
  ) THEN RAISE EXCEPTION 'One or more of the author IDs do not exist in the database';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM genres WHERE id = ANY(genre_ids)
  ) THEN RAISE EXCEPTION 'One or more of the genre IDs do not exist in the database';
  END IF;

  INSERT INTO books (book_name, isbn, publishing_year, _description, image_url, borrowing_period, quantity)
  VALUES (book_name, isbn, publishing_year, _description, image_url, borrowing_period, quantity)
  RETURNING id INTO new_book_id;

  FOREACH author_id IN ARRAY author_ids LOOP
    INSERT INTO book_author (book_id, author_id)
    VALUES (new_book_id, author_id);
  END LOOP;

  FOREACH genre_id IN ARRAY genre_ids LOOP
    INSERT INTO book_genre (book_id, genre_id)
    VALUES (new_book_id, genre_id);
  END LOOP;

  RETURN new_book_id;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT create_book(
  'Book 6',
  '9780123456789',
  ARRAY[1, 3], -- Author IDs
  ARRAY[2, 4], -- Genre IDs
  2023,
  'Description of Book 6',
  'https://example.com/book6.jpg',
  14,
  5
);

--Update book
CREATE OR REPLACE FUNCTION update_book(
  p_book_id INT,
  p_book_name VARCHAR(50) = NULL,
  p_isbn VARCHAR(13) = NULL,
  p_author_ids INT[] = NULL,
  p_genre_ids INT[] = NULL,
  p_publishing_year INT = NULL,
  p_description VARCHAR(1000) = NULL,
  p_image_url VARCHAR = NULL,
  p_borrowing_period INT = NULL,
  p_quantity INT = NULL
)
RETURNS BOOLEAN
AS $$
DECLARE
  existing_author_ids INT[];
  existing_genre_ids INT[];
BEGIN
  IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_book_id) THEN
    RAISE EXCEPTION 'Book with ID % does not exist.', p_book_id;
  END IF;

  SELECT ARRAY_AGG(author_id) INTO existing_author_ids
  FROM book_author ba
  WHERE ba.book_id = p_book_id;

  SELECT ARRAY_AGG(genre_id) INTO existing_genre_ids
  FROM book_genre bg
  WHERE bg.book_id = p_book_id;

  UPDATE books
  SET 
    book_name = COALESCE(p_book_name, books.book_name),
    isbn = COALESCE(p_isbn, books.isbn),
    publishing_year = COALESCE(p_publishing_year, books.publishing_year),
    _description = COALESCE(p_description, books._description),
    image_url = COALESCE(p_image_url, books.image_url),
    borrowing_period = COALESCE(p_borrowing_period, books.borrowing_period),
    quantity = COALESCE(p_quantity, books.quantity)
  WHERE
    id = p_book_id;

  IF p_author_ids IS NOT NULL AND
    EXISTS (SELECT 1 FROM UNNEST(p_author_ids) AS author_id
    WHERE author_id NOT IN (SELECT id FROM authors)) THEN
    RAISE EXCEPTION 'One or more author IDs do not exist.';
  END IF;

  IF p_genre_ids IS NOT NULL AND
    EXISTS (SELECT 1 FROM UNNEST(p_genre_ids) AS genre_id
    WHERE genre_id NOT IN (SELECT id FROM genres)) THEN
    RAISE EXCEPTION 'One or more genre IDs do not exist.';
  END IF;

  IF p_author_ids IS NOT NULL THEN
    DELETE FROM book_author
    WHERE book_id = p_book_id;

    INSERT INTO book_author (book_id, author_id)
    SELECT p_book_id, author_id
    FROM UNNEST(p_author_ids) AS author_id;
  END IF;

  IF p_genre_ids IS NOT NULL THEN
    DELETE FROM book_genre
    WHERE book_id = p_book_id;

    INSERT INTO book_genre (book_id, genre_id)
    SELECT p_book_id, genre_id
    FROM UNNEST(p_genre_ids) AS genre_id;
  END IF;

  RETURN TRUE;
END;
$$
LANGUAGE plpgsql;

--USAGE EXAMPLE:
SELECT update_book(1, 'New Book Name', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);









    