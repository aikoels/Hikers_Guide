USE hikers_guide_to_the_galaxy;


DROP Function IF EXISTS get_completed_trails;

DELIMITER //

CREATE Function get_completed_trails(givenUsername varchar(45))
RETURNS int
BEGIN

	set @user_id = (
    select user_id
    from users
    where username = givenUsername);
    
    set @result = (
    select count(*)
    from completed_trails
    where user_id = @user_id);
    
    return @result;
    
END //
DELIMITER ;

-- Testing
select get_completed_trails("AaronNg");

select get_completed_trails("Q")