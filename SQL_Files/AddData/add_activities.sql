USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_activities;

DELIMITER //

CREATE Procedure add_activities (IN givenTrail_id int, IN Longitude float, IN Latitude float, IN givenText text)
BEGIN

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

	insert into activities(gps_id, activities.desc)
    values(@gps_id, givenText);

END //
DELIMITER ;

-- Testing
select *
from activities;

select *
from trails;

