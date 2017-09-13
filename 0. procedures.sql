/*15*/
CREATE PROCEDURE Get_Customer_Info
@customer_id INT
AS
BEGIN
SELECT firstname, lastname, city FROM customer WHERE cid=@customer_id
END

EXECUTE Get_Customer_Info
@customer_id = 1