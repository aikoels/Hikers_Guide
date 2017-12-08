USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS add_completed_trail;

DELIMITER //

CREATE Procedure add_completed_trail(IN givenUsername varchar(45), IN givenTrail_id int)
BEGIN
    
    set @user_id = (
    select user_id
    from users
    where username = givenUsername);

	insert into completed_trails(trail_id, review_id, user_id)
    values (givenTrail_id, null, @user_id);

END //
DELIMITER ;

-- Testing Trails





