

USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_rating;

DELIMITER //

CREATE FUNCTION get_rating
(
	trailID VarChar(45)
)
RETURNS FLOAT
BEGIN
	SET @rating = 
		(SELECT
			AVG(rating)
		FROM
        trail_reviews JOIN completed_trails USING (review_id)
        WHERE
		trail_id = trailID);
        
	RETURN @rating;
END //
DELIMITER ;

-- SELECT rating(...);

select get_rating(1);

        
select *
from trail_reviews;