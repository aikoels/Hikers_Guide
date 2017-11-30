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
    
		set @park_id = (
		select park_id
		from parks
		where parks.name = parkName);
        
        if @park_id is null then
        truncate table temp;
        end if;
                    
		delete from temp
        where temp.park_id != @park_id;
                    
	end if;
        
	delete from temp
	where 
	temp.difficulty < minDifficulty 
	or
	temp.difficulty > maxDifficulty;
	
    delete from temp
    where
	temp.length < minLen
	or
	temp.length > maxLen;
    
    delete from temp
    where
	(SELECT get_nearest_head_distance(temp.trail_id, usrID)) >= maxDis;
	
    delete from temp
    where
	typeID != temp.type_id;

    delete from temp
    where
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

-- Should return trail ID 1
call search("", "", 0, 3, 0, 7, 99999, 1, 0, 3);

-- Testing TrailName search
-- Empty
call search("doesnt exist", "", 0, 3, 0, 7, 99999, 1, 0, 3);
-- Actual
call search("Test Trail", "", 0, 3, 0, 7, 99999, 1, 0, 3);

-- Testing ParkName search
-- empty
call search("", "doesnt exist", 0, 3, 0, 7, 99999, 1, 0, 3);
-- Actual
call search("", "testPark", 0, 3, 0, 7, 99999, 1, 0, 3);

-- Testing min and max difficulty
-- empty
call search("", "", 2, 3, 0, 7, 99999, 1, 0, 3);
-- actual
call search("", "", 0, 1, 0, 7, 99999, 1, 0, 3);

-- Tesitng min and max length
-- empty
call search("", "", 0, 3, 0, 3, 99999, 1, 0, 3);
call search("", "", 0, 3, 6, 7, 99999, 1, 0, 3);
-- actual
call search("", "", 0, 3, 3, 7, 99999, 1, 0, 3);

-- Testing distance
-- empty
call search("", "", 0, 3, 0, 4, 0, 1, 0, 3);
-- Actual
call search("", "", 0, 3, 0, 6, 9999, 1, 0, 3);

-- Testing TypeID
-- empty
call search("", "", 0, 3, 0, 7, 99999, 3, 0, 3);
-- actual
call search("", "", 0, 3, 0, 7, 99999, 5, 0, 3);

        
