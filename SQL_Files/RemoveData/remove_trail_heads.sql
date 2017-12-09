USE hikers_guide_to_the_galaxy;

DROP Procedure IF EXISTS remove_trail_head;

DELIMITER //

CREATE Procedure remove_trail_head (IN gpsID int, IN trailID int)
BEGIN

    -- Delete the actual trail
    delete
    from trail_heads
    where gpsID = gps_id AND trail_id = trailID;


END //
DELIMITER ;

CALL remove_trail_head(13, 4);
SELECT * FROM trails;