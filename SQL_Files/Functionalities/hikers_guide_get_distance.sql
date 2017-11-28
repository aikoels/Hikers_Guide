
USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_distance;

DELIMITER //

CREATE FUNCTION get_distance
(
	pointA point,
    pointB point
)
RETURNS FLOAT
BEGIN
RETURN DEGREES(ACOS(
          COS(RADIANS(ST_X(pointA))) *
          COS(RADIANS(ST_X(pointB))) *
          COS(RADIANS(ST_Y(pointB)) - RADIANS(ST_Y(pointA))) +
          SIN(RADIANS(ST_X(pointA))) * SIN(RADIANS(ST_X(pointB)))
        )) * 3961;
END //
DELIMITER ;
