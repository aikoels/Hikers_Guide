insert into trail_reviews(text, rating)
values ("Terrible", 1);

select *
from trail_reviews;

insert into completed_trails (trail_id, review_id, user_id)
values(1, 2, 2);
    
select *
from trail_reviews;
    