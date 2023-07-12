CREATE OR REPLACE FUNCTION create_fine(
  p_created_date DATE,
  p_due_date DATE,
  p_payment_date DATE,
  p_balance NUMERIC(5,2),
  p_loan_id INTEGER
)
RETURNS VOID
AS $$
BEGIN
  INSERT INTO fine (created_date, due_date, payment_date, balance, loan_id)
  VALUES (p_created_date, p_due_date, p_payment_date, ARRAY[p_balance], p_loan_id);
END;
$$ LANGUAGE plpgsql;
