
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
  IN minRating INT(11)
)
BEGIN
	SELECT
		trail_id, name
	FROM
		trails
	WHERE
		trails.park_id = (SELECT park_id FROM parks WHERE parks.name = parkName);
END //   

DELIMITER ;

CALL search_by_park("Han Solo");