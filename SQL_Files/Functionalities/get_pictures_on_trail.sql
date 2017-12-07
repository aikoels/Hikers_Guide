USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_pictures_on_trail;

DELIMITER //

CREATE PROCEDURE get_pictures_on_trail
(
	givenTrail_id int
)
BEGIN
    
    select username, pic
	from pictures join gps_coords using (gps_id) join users using (user_id)
	where trail_id = givenTrail_id;
        
END //
DELIMITER ;


select *
from trails;

call get_pictures_on_trail("Test trail");
