USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_trail_head;

DELIMITER //

CREATE Procedure add_trail_head(IN givenTrailName varchar(255), IN Longitude float, IN Latitude float)
BEGIN

	set @trail_id = (
    select trail_id
    from trails
    where name = givenTrailName);
    
	-- Inserting a new instance of the GPS
    insert into gps_coords(point, trail_id)
    values (point(Longitude, Latitude), @trail_id);
    
    set @gps_id = (
    select max(gps_id)
    from gps_coords);

	-- Inserting a new instance of a trail head
	insert into trail_heads(trail_id, gps_id)
    values (@trail_id, @gps_id);


END //
DELIMITER ;

-- Testing

select *
from trails;

select *
from gps_coords;

select *
from trail_heads;

call add_trail_head("Test Trial 5", -71.168495, 42.335549);
