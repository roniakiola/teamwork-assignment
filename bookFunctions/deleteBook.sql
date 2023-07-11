--Delete book
CREATE OR REPLACE FUNCTION delete_book(p_book_id INT)
RETURNS BOOLEAN
AS $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_book_id) THEN
    RAISE EXCEPTION 'Book with ID % does not exist.', p_book_id;
  END IF;

  DELETE FROM book_author
  WHERE book_id = p_book_id;

  DELETE FROM book_genre
  WHERE book_id = p_book_id;

  DELETE FROM books
  WHERE id = p_book_id;
  
  RETURN TRUE;
END;
$$
LANGUAGE plpgsql;
