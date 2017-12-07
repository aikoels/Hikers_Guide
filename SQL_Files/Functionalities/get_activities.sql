USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_activities;

DELIMITER //

CREATE PROCEDURE get_activities
(
	givenTrail_id int
)
BEGIN
    
	select point as Location, activities.desc
    from gps_coords join activities using (gps_id)
    where trail_id = givenTrail_id;
        
END //
DELIMITER ;

call get_activities("Test trail");