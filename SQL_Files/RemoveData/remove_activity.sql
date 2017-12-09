USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_activity;

DELIMITER //

CREATE Procedure remove_activity (IN givenGPSID int, IN givendesc text)
BEGIN

	delete from activities
    where gps_id = givenGPSID and activities.desc = givendesc;

END //
DELIMITER ;

select *
from activities;

<<<<<<< HEAD
CALL remove_activity(5, "Get Free Candy!");
=======
>>>>>>> 741878180636b3be5e4e3f49960c1bf5eb8051c2

