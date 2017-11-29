


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
	SET @longitude_1 = ST_X(pointA);
	SET @latitude_1 = ST_Y(pointA);
	SET @longitude_2 = ST_Y(pointB);
	SET @latitude_2 = ST_Y(pointB);
    
    SET @theta = @longitude1 - @longitude2; 
    SET @distance = (sin(RADIANS(@latitude1)) * sin(RADIANS(@latitude2))) + 
                (cos(RADIANS(@latitude1)) * cos(RADIANS(@latitude2)) * 
                cos(RADIANS(@theta))); 
    SET @distance = acos(@distance); 
    SET @distance = DEGREES(@distance); 
    SET @distance = @distance * 60 * 1.1515; 
    RETURN @distance; -- (round(@distance,2)); 
END //
DELIMITER ;


