USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_review;

DELIMITER //

CREATE Procedure add_review(IN givenUsername varchar(45), IN givenTrail_id int, IN givenRating int, IN givenReview TEXT)
BEGIN

    
    -- Creating a new review
    insert into trail_reviews(text, rating)
    values (givenReview, givenRating);
    
    set @review_id = (
    select MAX(review_id)
    from trail_reviews);
    
    set @user_id = (
    select user_id
    from users
    where username = givenUsername);
    
    
    -- Updating completed trails
    
    update completed_trails
    set review_id = @review_id
    where completed_trails.trail_id = givenTrail_id AND completed_trails.user_id = @user_id;

END //
DELIMITER ;

-- Testing, must have add_completed_trails already tested. This test works ontop of that.

select *
from trail_reviews;

select *
from completed_trails;

call add_review("Q", 4, "Chill walk", 5);




