USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_trails;

DELIMITER //

CREATE Procedure add_trails (IN givenName varchar(255), IN givenDifficulty int, IN givenLength int, IN givenType_id int, IN parkName varchar(45))
BEGIN

	set @park_id = (
    select park_id
    from parks
    where parks.name = parkName);
    
    
    if @park_id is null then
    -- Create a new Park
    insert into parks(name)
    values(parkName);
    
    set @park_id = (
    select max(park_id)
    from parks);
    
    end if;
    

	insert into trails(name, difficulty, length, type_id, park_id)
    values (givenName, givenDifficulty, givenLength, givenType_id, @park_id);

END //
DELIMITER ;


-- Testing
call add_trails("Boston City Trail", 1, 6, 13, "testPark");

select *
from parks;

select *
from trails;

select *
from trail_types;

insert into trail_types(type)
values ("Footpath Test");
