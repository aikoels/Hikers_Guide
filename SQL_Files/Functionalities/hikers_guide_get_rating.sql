

USE hikers_guide_to_the_galaxy;

DROP FUNCTION IF EXISTS get_rating;

DELIMITER //

CREATE FUNCTION get_rating
(
	trailID VarChar(45)
)
RETURNS FLOAT
BEGIN
	SET @rating = AVG(
    (SELECT
		trail_reviews.rating
	FROM
		trail_reviews
	WHERE
		trail_reviews.review_id IN
	(SELECT
		review_id
        FROM
        completed_trails
        WHERE
        completed_trails.trail_id = trailID)));
	RETURN @rating;
END //
DELIMITER ;

-- SELECT rating(...);