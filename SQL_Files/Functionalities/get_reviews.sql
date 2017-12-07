USE hikers_guide_to_the_galaxy;

DROP PROCEDURE IF EXISTS get_reviews;

DELIMITER //

CREATE PROCEDURE get_reviews
(
	givenTrail_id int
)
BEGIN
    
    select username, text
    from trail_reviews join completed_trails using (review_id) join users using (user_id)
    where trail_id = givenTrail_id;
        
END //
DELIMITER ;

select *
from trail_reviews;

call get_reviews("Test trail");


