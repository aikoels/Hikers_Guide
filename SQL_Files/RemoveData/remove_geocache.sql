USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_geocache;

DELIMITER //

CREATE Procedure remove_geocache (IN givenGpsID int, IN givenUsername varchar(45))
BEGIN

	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);


	delete from geocaches
    where gps_id = givenGpsID and user_id = @user_id;

END //
DELIMITER ;

select *
from geocaches;