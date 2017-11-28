
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_nearest_head_distance;

DELIMITER //

CREATE FUNCTION get_nearest_head_distance
(
	trailID INT(11),
    usrID INT(11)
)
RETURNS FLOAT
BEGIN
	SET @usrLoc = (SELECT 
				users.loc
			FROM
				users
			WHERE
				users.loc = usrID);
	SET @trailLoc = get_nearest_head_point(trailID, @usrLoc);
	SET @distance = get_distance(@usrLoc, @trailLoc);
	RETURN @distance;
END //
DELIMITER ;

-- SELECT rating(...);