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
    
    -- If the user has already reviewed the trail then signal error
    
    if (select review_id
    from completed_trails
    where trail_id = givenTrail_id and @user_id = user_id) is not null then
    
    signal sqlstate'10000'
    set message_text = 'Cannot add a review to the same trail';
    
    end if;

    
    
    -- Check if the user has completed the trail, if the user has not states the trail has been created, it will create a row saying
    -- that the user has completed the trail, else update complted_trail.review_id to the button. 
    if (select count(*)
    from completed_trails
    where review_id = @review_id) = 0 then
    
    -- Create a new completed_trail with all of its parameters
    insert into completed_trails(trail_id, review_id, user_id)
    values (givenTrail_id, @review_id, @user_id);
    
    else 
    
	-- Updating completed trails
    update completed_trails
    set review_id = @review_id
    where completed_trails.trail_id = givenTrail_id AND completed_trails.user_id = @user_id;
    
    end if;

END //
DELIMITER ;

-- Testing, must have add_completed_trails already tested. This test works ontop of that.

select *
from trail_reviews;

select *
from completed_trails;

select count(*)
    from completed_trails
    where review_id = 5;
    
call add_review("Q", 4, 5, "Chill walk");
call add_review("Q", 2, 5, "not fun");

select *
    from completed_trails
    where trail_id = 4 and @user_id = 1;




