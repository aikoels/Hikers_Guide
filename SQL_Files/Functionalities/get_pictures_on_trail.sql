USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_pictures_on_trail;

DELIMITER //

CREATE PROCEDURE get_pictures_on_trail
(
	givenTrailName VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
    select username, pic
	from pictures join gps_coords using (gps_id) join users using (user_id)
	where trail_id = @trail_id;
        
END //
DELIMITER ;


select *
from trails;

call get_pictures_on_trail("Test trail");
