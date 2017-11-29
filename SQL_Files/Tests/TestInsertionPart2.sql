use hikers_guide_to_the_galaxy;

-- Inserting new parks
insert into parks(name)
values ("Park 3"), ("Park 4"), ("Park 5"), ("Park 6");

select *
from parks;

select *
from trails;

-- Inserting Trails
insert into trails(name, difficulty, length, type_id, park_id)
values ("Test Trial 2", 2, 10, 2, 3), ("Test Trial 3", 3, 50, 6, 3), ("Test Trial 4", 1, 3, 7, 2), ("Test Trial 5", 3, 200, 12, 6);

-- Inserting gps_coords
insert into gps_coords(point, trail_id)
values (Point(-71.058880, 42.360082), 2), (Point(-77.036871, 38.907192), 2), (Point(-77.036871, 38.907192), 2), (Point(-74.005973, 40.712775), 2),
(Point (-71.084264, 42.338303), 3), (Point (-71.054234, 42.364702), 3), (Point (-71.062210, 42.366424), 4);

select *
from gps_coords;

-- Creating new users
select *
from users;

insert into users(username, loc)
values ("Nick Cage", Posearchint(-71.089172, 42.339807));

-- Creating new Reviews
select *
from trail_reviews;