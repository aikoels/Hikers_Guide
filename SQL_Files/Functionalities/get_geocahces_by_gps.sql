USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_geocaches_by_gps;

DELIMITER //

CREATE PROCEDURE get_geocaches_by_gps (in givenLong float, in givenLat float, in givenRange int)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
    select username, geocaches.desc
	from geocaches join gps_coords using (gps_id) join users using (user_id)
	where get_distance(point, point(givenLong, givenLat)) < givenRange;
        
END //
DELIMITER ;


select *
from trails;



