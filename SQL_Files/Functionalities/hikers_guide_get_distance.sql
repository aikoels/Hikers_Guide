


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

	set @lat1 = ST_Y(pointA);
    set @lng1 = ST_X(pointA);
    
    set @lat2 = ST_Y(pointB);
    set @lng2 = ST_X(pointB);
    
    
    RETURN 6371 * 2 * ASIN(SQRT(
            POWER(SIN((@lat1 - abs(@lat2)) * pi()/180 / 2),
            2) + COS(@lat1 * pi()/180 ) * COS(abs(@lat2) *
            pi()/180) * POWER(SIN((@lng1 - @lng2) *
            pi()/180 / 2), 2) ));
END //
DELIMITER ;




