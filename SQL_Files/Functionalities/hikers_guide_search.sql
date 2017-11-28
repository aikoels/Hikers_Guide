
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
	SELECT
		trail_id, trails.name
	FROM
		trails
	WHERE
		trails.difficulty >= minDifficulty 
        AND
        trails.difficulty <= maxDifficulty
        AND
        trails.length >= minLen
        AND
        trails.length <= maxLen
        AND
        (SELECT get_rating(trails.trail_id)) >= minRating
        AND
        (SELECT get_nearest_head_distance(trails.trail_id, usrID)) <= maxDis;
        -- **NEED TO ADD TRAIL TYPE FILTER**
END //   

DELIMITER ;

-- CALL search(...);