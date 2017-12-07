USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_trail;

DELIMITER //

CREATE Procedure remove_trail (IN givenTrail_id int)
BEGIN

    -- Delete the actual trail
    delete
    from trails
    where trail_id = givenTrail_id;


END //
DELIMITER ;

call remove_trail(1);

select *
from trail_reviews;

select *
from completed_trails;





