USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_geocache;

DELIMITER //

CREATE Procedure add_geocache (IN Longitude float, IN Latitude float, IN trailName varchar(255), IN username varchar(45), IN givenDesc text, IN givenGeoCacheCol varchar(45))
BEGIN


	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where trailName = trail_id);
    
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
    insert into geocaches(gps_id, user_id, geocaches.desc, geocashcescol)
    values (@gps_id, @user_id, givenDesc, givenGeoCacheCol);
    


END //
DELIMITER ;

-- testing

select *
from geocaches;





