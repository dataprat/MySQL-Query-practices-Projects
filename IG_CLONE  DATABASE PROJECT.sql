/*  || Q1 Create an ER diagram or draw a schema for the given database.||  */


/*  || Q2 We want to reward the user who has been around the longest, Find the 5 oldest users.||  */ 

select * from users  
order by created_at
limit 5;


/*  || Q3 To understand when to run the ad campaign, figure out the day of the week most users register on.|| */ 


select count(id),dayname(created_at) as day from users      
group by dayname(created_at)
order by id;


/* || Q4 To target inactive users in an email ad campaign, find the users who have never posted a photo.|| */


select u.id,username,image_url as photos_posted from users u
left join photos p
on u.id = p.user_id                                                      
where image_url is null;


/* || Q5 Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?|| */


select p.id as photo_id,u.username,p.image_url as images,count(l.photo_id) as likes from photos p
inner join likes l
on p.id = l.photo_id
inner join users u
on u.id = p.user_id
group by p.id
order by count(l.photo_id) desc
limit 1;


/* || Q6 The investors want to know how many times does the average user post.|| */


select (select count(*) from photos) / (select count(*) from users) as avg_posts;


/* || Q7 A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.|| */


select count(t.id),tag_name from tags t
inner join photo_tags pt
on t.id = pt.tag_id                                  
inner join photos p
on pt.photo_id =p.id
group by tag_name
order by count(t.id) desc limit 5;


/* || Q8 To find out if there are bots, find users who have liked every single photo on the site.||*/

select l.user_id,u.username,count(l.photo_id) as likes from users u
inner join likes l
on u.id = l.user_id
group by l.user_id
order by count(l.photo_id) desc;



/* || Q9 To know who the celebrities are, find users who have never commented on a photo.|| */


select u.id,u.username,c.comment_text from users u
left join comments c                                      
on u.id = c.user_id
where c.comment_text is null;


/* || Q10 Now it's time to find both of them together, find the users who have never commented on any photo or have commented on every photo.|| */


select u.id,u.username,count(c.comment_text) from users u
left join comments c                                      
on u.id = c.user_id
where c.comment_text is null or c.comment_text is not null
group by u.username
order by count(c.comment_text) desc;