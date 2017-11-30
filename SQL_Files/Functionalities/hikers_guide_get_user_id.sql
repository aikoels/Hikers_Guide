
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_user_id;

DELIMITER //

CREATE FUNCTION get_user_id
(
	usrName VarChar(45)
)
RETURNS BLOB
BEGIN
	RETURN (SELECT users.user_id WHERE users.username = usrName);
END //
DELIMITER ;

