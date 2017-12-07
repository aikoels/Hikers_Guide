USE hikers_guide_to_the_galaxy;


DROP Procedure IF EXISTS remove_activity;

DELIMITER //

CREATE Procedure remove_activity (IN givenGPSID int, IN givendesc text)
BEGIN

	delete from actvities
    where gps_id = givenGPSID and activities.desc = givendesc;

END //
DELIMITER ;

select *
from activities;

