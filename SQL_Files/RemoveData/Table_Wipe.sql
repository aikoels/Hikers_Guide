USE hikers_guide_to_the_galaxy;

SET SQL_SAFE_UPDATES=0;
SET foreign_key_checks = 0;

truncate table activities;
truncate table completed_trails;
truncate table geocaches;
truncate table gps_coords;
truncate table parks;
truncate table pictures;
truncate table trail_heads;
truncate table trail_reviews;
truncate table trails;
truncate table trail_types;
truncate table users;

SET SQL_SAFE_UPDATES=1;
SET foreign_key_checks = 1;
