USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_trail;

DELIMITER //

CREATE Procedure remove_trail (IN givenTrail_id int)
BEGIN

	SET SQL_SAFE_UPDATES=0;
    SET foreign_key_checks = 0;
	
	-- Delete trail_reviews based on trail
    delete trail_reviews
    from trail_reviews join completed_trails using (review_id)
    where trail_id = givenTrail_id;
    
    -- Delete completed_Trails 
    delete 
    from completed_trails
    where trail_id = givenTrail_id;
    
    -- Delete Pictures
    delete pictures
    from pictures join gps_coords
    where trail_id = givenTrail_id;
    
    -- Delete geocaches
    delete geocaches
    from geocaches join gps_coords
    where trail_id = givenTrail_id;
    
    -- Delete activities
    delete activities
    from activities join gps_coords using (gps_id)
    where trail_id = givenTrail_id;
    
    -- Delete trail_heads
    delete trail_heads
    from trail_heads
    where trail_id = givenTrail_id;
    
    -- Delete gps_coords
    delete
    from gps_coords
    where trail_id = givenTrail_id;
    
    -- Delete the actual trail
    delete
    from trails
    where trail_id = givenTrail_id;
    
    SET SQL_SAFE_UPDATES=1;
    SET foreign_key_checks = 1;

END //
DELIMITER ;

call remove_trail("Test trail");

select *
from gps_coords;





