USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_user;

DELIMITER //

CREATE Procedure remove_user (IN givenUsername varchar(45))
BEGIN

	-- finally deleting the users
	delete from users
    where users.username = givenUsername;


END //
DELIMITER ;

call remove_user("AaronNg");




