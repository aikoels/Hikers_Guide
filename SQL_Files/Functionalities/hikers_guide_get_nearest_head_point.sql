
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_nearest_head_point;

DELIMITER //

CREATE FUNCTION get_nearest_head_point
(
	trailID INT(11),
    usrLoc point
)
RETURNS BLOB
BEGIN
	SET @nearest_gps_id = 
		(SELECT
		trail_heads.gps_id
        FROM
        trail_heads
        WHERE
        trail_heads.trail_id = trailID
        ORDER BY get_distance(get_gps_point(trail_heads.gps_id), usrLoc) 
        LIMIT 1);
	RETURN get_gps_point(@nearest_gps_id);
END //
DELIMITER ;

-- SELECT rating(...);
select *
from trail_heads;

select ST_X(get_nearest_head_point(1, point(101, 101)));
select ST_Y(get_nearest_head_point(1, point(101, 101)));


