USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_geocaches;

DELIMITER //

CREATE PROCEDURE get_geocaches
(
	givenTrailName VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
	select username, geocaches.desc
	from gps_coords join geocaches using (gps_id) join users using (user_id)
	where trail_id = @trail_id;
        
        
END //
DELIMITER ;


select *
from trails;

call get_geocaches("Test Trail");

