
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_nearest_head_distance;

DELIMITER //

CREATE FUNCTION get_nearest_head_distance (trailID INT(11), usrID INT(11))
RETURNS FLOAT
BEGIN

	declare result float default -1;
    declare usrPoint point default
    (select loc
    from users
    where user_id = usrID);
    
    declare trailLocation point default get_nearest_head_point(trailID, usrPoint);
    
    select get_distance(usrPoint, trailLocation) into result;
    
	return result;
END //
DELIMITER ;

select get_nearest_head_distance(1, 3);
