USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_activities;

DELIMITER //

CREATE Procedure add_activities (IN trailName varchar(255), IN Longitude float, IN Latitude float, IN givenText text)
BEGIN

	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where trailName = trail_id);


	-- Creating the new GPS_Coords
    insert into gps_coords(point, trail_id)
    values(point(Longitude, Latitude), @trail_id);
    
    -- Getting the latest gps_coords
    set @gps_id = (
    select max(gps_id)
    from gps_coords);
    

	insert into activities(gps_id, activities.desc)
    values(@gps_id, givenText);

END //
DELIMITER ;

-- Testing
select *
from activities;

select *
from trails;

