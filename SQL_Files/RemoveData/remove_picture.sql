USE hikers_guide_to_the_galaxy;

DROP Procedure IF EXISTS remove_picture;

DELIMITER //

CREATE Procedure remove_picture (IN givenPic_id int)
BEGIN

    -- Delete the actual trail
    delete
    from picture
    where pic_id = givenPic_id;


END //
DELIMITER ;
