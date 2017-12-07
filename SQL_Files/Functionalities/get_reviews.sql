USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_reviews;

DELIMITER //

CREATE PROCEDURE get_reviews
(
	givenTrailName VarChar(45)
)
BEGIN
        
	-- Finding the trail_id from name
    set @trail_id = (
    select trail_id
    from trails
    where givenTrailName = trails.name);
    
    select username, text
    from trail_reviews join completed_trails using (review_id) join users using (user_id)
    where trail_id = @trail_id;
        
END //
DELIMITER ;

select *
from trail_reviews;

call get_reviews("Test trail");


