USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_geocache;

DELIMITER //

CREATE Procedure add_geocache (IN username varchar(45), IN givenDesc text, IN Longitude float, IN Latitude float, IN givenTrail_id int)
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
    values (point(Longitude, Latitude), givenTrail_id);
    
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
    insert into geocaches(gps_id, user_id, geocaches.desc)
    values (@gps_id, @user_id, givenDesc);
    


END //
DELIMITER ;

-- testing

select *
from geocaches;

call add_geocache("Q", 'hidden treasures', 1.4, 2.5, 2);

call add_geocache("Q", 'dsdsd', 3.4, 4.4, 2);
call add_geocache("Q", 'hello', 5.0, 4.4, 2);
call add_geocache("Q", 'jjjdjdjd', 5.0, 4.4, 2);

select *
from users;


select *
from geocaches;





