USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_completed_trail;

DELIMITER //

CREATE Procedure add_completed_trail(IN givenUsername varchar(45), IN givenTrailName varchar(255))
BEGIN

	set @trail_id = (
    select trail_id
    from trails
    where name = givenTrailName);
    
    set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	insert into completed_trails(trail_id, review_id, user_id)
    values (@trail_id, null, @user_id);


END //
DELIMITER ;

-- Testing Trails
select *
from completed_trails;

call add_completed_trail("AaronNg", "Test Trial 4");





