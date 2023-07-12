CREATE OR REPLACE FUNCTION update_fine(
  p_fine_id INTEGER,
  p_created_date DATE,
  p_due_date DATE,
  p_payment_date DATE,
  p_balance NUMERIC(5,2),
  p_loan_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
  UPDATE fine
  SET created_date = p_created_date,
      due_date = p_due_date,
      payment_date = p_payment_date,
      balance =  ARRAY[p_balance],
      loan_id = p_loan_id
  WHERE id = p_fine_id;
END;
$$ LANGUAGE plpgsql;
