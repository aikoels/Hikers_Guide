USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_pictures;

DELIMITER //

CREATE PROCEDURE get_pictures
(
	givenUsername VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @user_id = (
    select user_id
    from users
    where users.username = givenUsername);
    

    select trails.name, ST_X(gps_coords.point) as Lon, ST_Y(gps_coords.point) as Lat, pic
	from pictures join gps_coords using (gps_id) join trails using (trail_id)
	where user_id = @user_id;
        
END //
DELIMITER ;








