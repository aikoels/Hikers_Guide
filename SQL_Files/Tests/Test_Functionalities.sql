


USE hikers_guide_to_the_galaxy;


SELECT * from gps_coords;
SELECT ST_X(get_gps_point(1)), ST_Y(get_gps_point(1)); -- (0, 0)

SELECT ST_X(get_gps_point(1)), ST_Y(get_gps_point(1)); -- (0, 0)


SELECT ST_X(get_nearest_head_point(1, (SELECT users.loc FROM users WHERE users.user_id = 2))), ST_Y(get_nearest_head_point(1, (SELECT users.loc FROM users WHERE users.user_id = 2)));

SELECT get_distance(point(20, 30), point(42, 50));

SELECT get_rating(1);
