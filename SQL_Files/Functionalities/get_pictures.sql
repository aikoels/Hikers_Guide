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

select *
from pictures;

select *
from gps_coords;

call add_picture("admin", 2, 4.555, 2.1111, "url.com/blah/blah");

call add_user("admin", "pass", "email", 2.5, 13.44444);

call get_pictures("admin");

select *
from users;





