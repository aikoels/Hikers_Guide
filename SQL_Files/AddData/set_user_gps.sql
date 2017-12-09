USE hikers_guide_to_the_galaxy;

DROP Procedure IF EXISTS set_user_gps;

DELIMITER //

CREATE Procedure set_user_gps (IN givenUsername varchar(45), IN Longitude float, IN Latitude float)
BEGIN

	set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	update users
    set loc = point(Longitude, Latitude)
    where user_id = @user_id;

END //
DELIMITER ;

-- Testing, Changes AaronNg GPS from 500, 500 to new GPS coordinates
select ST_X(loc), ST_Y(loc)
from users;

call set_user_gps("admin", -71.072136, 42.347228);