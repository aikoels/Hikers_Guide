USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS search;

DELIMITER //

CREATE PROCEDURE search
(
  IN trailName VarChar(255), -- can be blank
  IN parkName VarChar(45), -- can be blank
  IN minDifficulty INT(11),
  IN maxDifficulty INT(11),
  IN minLen INT(11),
  IN maxLen INT(11),
  IN maxDis INT(11),
  IN typeID INT(11),
  IN minRating INT(11),
  IN usrID INT(11)
)
BEGIN

	drop table if exists temp;
	create temporary table temp (
    select *
    from trails);
    
    if trailName != "" then 
    
        delete from temp
        where temp.name != trailName;
        
	end if;
        
	if parkName != "" then

		delete from temp
        where temp.park_id != (
					select park_id
					from parks
					where parks.name = parkName);
                    
	end if;
        
	delete from temp
	where 
	temp.difficulty <= minDifficulty 
	AND
	temp.difficulty >= maxDifficulty
	AND
	temp.length <= minLen
	AND
	temp.length >= maxLen
	AND
	(SELECT get_nearest_head_distance(temp.trail_id, usrID)) >= maxDis
	AND
	typeID != temp.type_id
	AND
	(SELECT get_rating(temp.trail_id)) <= minRating;
    
    select *
    from temp;
        
END //   

DELIMITER ;

-- Testing

SET SQL_SAFE_UPDATES = 0;

select *
from parks;

select *
from trails;

select *
from users;

call search("", "", 0, 3, 0, 99999, 800000000, 1, 0, 3);

