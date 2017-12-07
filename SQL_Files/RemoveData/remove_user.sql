USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_user;

DELIMITER //

CREATE Procedure remove_user (IN givenUsername varchar(45))
BEGIN

	SET SQL_SAFE_UPDATES=0;
    SET foreign_key_checks = 0;

	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);
    
    -- Deleting all pictures associated with user
    delete from pictures
    where user_id = @user_id;
    
    -- Deleting geocaches
    delete from geocaches
    where user_id = @user_id;
    
    -- delete reviews first
    delete trail_reviews
    from trail_reviews join completed_trails
	where user_id = @user_id;
    
    -- delete completed trails
    delete
    from completed_trails
    where user_id = @user_id;

	-- finally deleting the users
	delete from users
    where users.username = givenUsername;
    
	SET SQL_SAFE_UPDATES=1;
    SET foreign_key_checks = 1;

END //
DELIMITER ;

call remove_user("AaronNg");

select *
from users;

select *
from pictures;

select *
from trail_reviews;



