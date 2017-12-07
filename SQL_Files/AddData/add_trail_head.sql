USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_trail_head;

DELIMITER //

CREATE Procedure add_trail_head(IN givenTrail_id int, IN Longitude float, IN Latitude float)
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

	-- Inserting a new instance of a trail head
	insert into trail_heads(trail_id, gps_id)
    values (givenTrail_id, @gps_id);


END //
DELIMITER ;

-- Testing

select *
from parks;

select *
from gps_coords;

select *
from trail_heads;

call add_trail_head("Test Trial 5", -71.168495, 42.335549);
