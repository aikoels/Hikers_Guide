USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_picture;

DELIMITER //

CREATE Procedure add_picture (IN username varchar(45), IN Longitude float, IN Latitude float, IN givenPic varchar(255))
BEGIN

    -- Finding user_id from a name
    set @user_id = (
    select user_id
    from users
    where users.username = username);

	-- If the given GPS doesnt exist create a new instance of it
    if (select count(*) 
		from gps_coords
        where gps_coords.point = point(Longitude, Latitude))
        = 0 then
        
    -- create a new gps ID
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), @trail_id);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    
    else 
    
	-- Find Existing gps if not create new
	set @gps_id = (
    select gps_id
    from gps_coords
    where gps_coords.point = point(Longitude, Latitude));
    
    end if;    

    -- Creating geocache and inserting it
    insert into pictures(pic, user_id, gps_id)
    values (givenPic, @user_id, @gps_id);
    


END //
DELIMITER ;

-- testing






