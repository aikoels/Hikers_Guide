
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_nearest_head_point;

DELIMITER //

CREATE FUNCTION get_nearest_head_point
(
	trailID INT(11),
    usrLoc point
)
RETURNS FLOAT
BEGIN
	SET @nearest_gps_id = 
		(SELECT
		trail_heads.gps_id
        FROM
        trail_heads
        WHERE
        trails_heads.trail_id = trailID
        ORDER BY get_distance(get_gps_point(trail.heads.gps_id), usrLoc) 
        LIMIT 1);
	RETURN get_gps_point(@nearest_gps_id);
END //
DELIMITER ;

-- SELECT rating(...);