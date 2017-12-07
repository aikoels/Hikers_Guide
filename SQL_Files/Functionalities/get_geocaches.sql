USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_geocaches;

DELIMITER //

CREATE PROCEDURE get_geocaches
(
	givenTrail_id int
)
BEGIN
    
	select username, geocaches.desc
	from gps_coords join geocaches using (gps_id) join users using (user_id)
	where trail_id = givenTrail_id;
        
        
END //
DELIMITER ;


select *
from trails;

call get_geocaches("Test Trail");

