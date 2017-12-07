
insert into completed_trails (trail_id, review_id, user_id)
values(1, 1, 2);
    
insert into trail_reviews(text, rating)
values ("Terrible", 1);

select *
from trail_reviews;

SELECT * FROM trail_heads;
SELECT * FROM trails;
SELECT * FROM trail_reviews;
SELECT * FROM trail_types;
SELECT * FROM users;
SELECT * FROM parks;

UPDATE users SET username = "Nic Cage" WHERE user_id = 5;
UPDATE users SET loc = point(72, 30) WHERE user_id = 5;

select *
from users;


