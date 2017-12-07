USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_activities;

DELIMITER //

CREATE PROCEDURE get_activities
(
	givenTrailName VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
	select point as Location, activities.desc
    from gps_coords join activities using (gps_id)
    where trail_id = @trail_id;
        
END //
DELIMITER ;

call get_activities("Test trail");