
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_gps_point;

DELIMITER //

CREATE FUNCTION get_gps_point
(
	gpsID INT(11)
)
RETURNS BLOB
BEGIN
	SET @gps_point = 
		(SELECT
		gps_coords.point
        FROM
        gps_coords
        WHERE
        gps_coords.gps_id = gpsID);
	RETURN @gps_point;
END //
DELIMITER ;
