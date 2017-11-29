use hikers_guide_to_the_galaxy;

-- Inserting fake park names
insert into parks(name) values ("testPark");

select *
from parks;

-- Inserting all trailTypes
insert into trail_types(type) 
values 
("Shared-use trail"), ("Forest road"), ("Rail trail"), ("Towpath"), ("Urban trail"), 
("Segregated trail"), ("Footpath"), ("Bicycle trail"), ("Equestrian trail"), ("Cross-country skiing trail"), 
("Water trail"), ("Motorized trail");

select *
from trail_types;

-- Inserting fake reviews
insert into trail_reviews(text, rating)
values ("It was fun", 4);

select *
from trail_reviews;

-- Inserting fake trails
insert into trails(name, difficulty, length, type_id, park_id)
values ("Test Trail", 1, 5, 
	(select type_id
    from trail_types
    where type_id = 1), 
    (select park_id
    from parks
    where name = "testPark"));
    
select *
from trails;

-- Inserting Fake GPS, The Heads for fake trail
insert into gps_coords(POINT, trail_id)
values (Point(0, 0), 
	(select trail_id
    from trails
    where trail_id = 1));
    
insert into gps_coords(POINT, trail_id)
values (Point(20, 20), 
	(select trail_id
    from trails
    where trail_id = 1));
    
insert into gps_coords(POINT, trail_id)
values (Point(100, 100), 
	(select trail_id
    from trails
    where trail_id = 1));
    
select *
from gps_coords;

select ST_X
	((select point
    from gps_coords
    where gps_id = 2));
    
-- Trail Heads
insert into trail_heads(trail_id, gps_id)
values(
	(select trail_id
    from trails
    where trail_id = 1),
    (select gps_id
    from gps_coords
    where gps_id = 1));
    
insert into trail_heads(trail_id, gps_id)
values(
	(select trail_id
    from trails
    where trail_id = 1),
    (select gps_id
    from gps_coords
    where gps_id = 2));
    
select *
from trail_heads;

-- Inserting activities for a fake trail
insert into activities(gps_id, activities.desc)
values(
	(select gps_id
    from gps_coords
    where gps_id = 3),
    "Guys selling icecream, must have!!");
    
select *
from activities;

-- Creating users

insert into users(username, loc)
values("AaronNg", point(500, 500));

insert into users(username, loc)
values("Q", point(3.4, 3.4));

select *
from users;

-- Creating geoCaches
insert into gps_coords(POINT, trail_id)
values (Point(67, 67), 
	(select trail_id
    from trails
    where trail_id = 1));

insert into geocaches(gps_id, user_id, geocaches.desc)
values(
	(select gps_id
    from gps_coords
    where gps_id = 4), 
    (select user_id
    from users
    where user_id = 1),
    "Hidden some nice rocks under a giant boulder. Try find it!");
    
select *
from geocaches;

-- Creating pictures

insert into gps_coords(POINT, trail_id)
values (Point(99, 99), 
	(select trail_id
    from trails
    where trail_id = 1));

insert into pictures(pic, user_id, gps_id)
values(
	Load_File('/Users/Aaron/Desktop/CS3200/Hikers_Guide/untitled folder/Balanced_Rock.jpg'), 
    (select user_id
    from users
    where user_id = 1),
    (select gps_id 
    from gps_coords
    where gps_id = 5));
    
select *
from pictures;

-- Creating Completed Trails
insert into completed_trails
values(
	(select trail_id
    from trails
    where trail_id = 1),
    (select review_id
    from trail_reviews
    where review_id = 1),
	(select user_id
    from users
    where user_id = 1));
    
select *
from completed_trails;
    
	








