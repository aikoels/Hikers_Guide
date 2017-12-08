USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_pictures_on_trail;

DELIMITER //

CREATE PROCEDURE get_pictures_on_trail
(
	givenTrail_id int
)
BEGIN
    
    select username, pic, ST_X(gps_coords.point) as Lon, ST_Y(gps_coords.point) as Lat
	from pictures join gps_coords using (gps_id) join users using (user_id)
	where trail_id = givenTrail_id;
        
END //
DELIMITER ;

