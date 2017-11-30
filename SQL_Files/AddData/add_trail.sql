USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_trails;

DELIMITER //

CREATE Procedure add_trails (IN givenName varchar(255), IN givenDifficulty int, IN givenLength int, IN givenType_id int, IN parkName varchar(45))
BEGIN

	set @park_id = (
    select park_id
    from parks
    where parks.name = parkName);

	insert into trails(name, difficulty, length, type_id, park_id)
    values (givenName, givenDifficulty, givenLength, givenType_id, @park_id);

END //
DELIMITER ;


-- Testing
call add_trails("Boston City Trail", 1, 6, 5, "Park 6");

select *
from trails;
