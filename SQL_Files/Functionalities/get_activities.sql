USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_activities;

DELIMITER //

CREATE PROCEDURE get_activities
(
	givenTrail_id int
)
BEGIN
    
	select ST_X(point) as Lon, ST_Y(point) as Lat, activities.desc
    from gps_coords join activities using (gps_id)
    where trail_id = givenTrail_id;
        
END //
DELIMITER ;

call get_activities(2);