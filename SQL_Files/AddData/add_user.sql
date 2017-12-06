USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_user;

DELIMITER //

CREATE Procedure add_user 
(IN username varchar(45), 
IN pass varchar(45), 
IN email varchar(100), 
IN Longitude float, 
IN Latitude float)
BEGIN

	insert into users(username, password, email, loc)
    values(username, pass, email, point(Longitude, Latitude));

END //
DELIMITER ;


-- Testing purposes
call add_user("Mr Chicken", "cluck cluck", "chicken@chicken.edu", -71.116660, 42.377003);

select *
from users;