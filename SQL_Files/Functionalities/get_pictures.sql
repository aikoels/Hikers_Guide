USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_pictures;

DELIMITER //

CREATE PROCEDURE get_pictures
(
	givenUsername VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);
    
    select pic
	from pictures
	where user_id = @user_id;
        
END //
DELIMITER ;


select *
from trails;


