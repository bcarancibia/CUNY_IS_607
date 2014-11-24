--Ben Arancibia--
--Week 8 Assignment--
--October 20th, 2014--

--Design a small database that tracks blog posts, comments, and tags--

--Question 1 (blog)--
-- http://www.theverge.com/ is a website/blog that has comments, blogposts, and tags.
-- example of post with comments and tags: http://www.theverge.com/2014/10/20/7013795/apple-pay-banks-default-card

--Question 2(database design)--

--see attached diagram


--Question 3(physical database)--
--used command line to implement--

CREATE DATABASE Blog;
\connect blog;

CREATE TABLE blog_posts (
	post_id SERIAL,
	blog_title VARCHAR(255) NOT NULL,
	author_firstname VARCHAR(50) NOT NULL,
	author_lastname VARCHAR(50) NOT NULL,	
	blog_post_date DATE NOT NULL,
	PRIMARY KEY (post_id)
);

CREATE TABLE blog_posts_comments (
	post_id INTEGER NOT NULL REFERENCES blog_posts(post_id),
	comment_date DATE NOT NULL,
	comment_username VARCHAR(50) NOT NULL,
	comment_text VARCHAR(500) NOT NULL
); 

CREATE TABLE blog_posts_tags (
	post_id INTEGER NOT NULL REFERENCES blog_posts(post_id),
	tags VARCHAR(50) NOT NULL
); 

--Question 4 (Insert data into the database)--

INSERT INTO blog_posts (blog_title, author_firstname, author_lastname, blog_post_date)
VALUES 
	('Amazon Kindle Voyage review','Chris', 'Ziegler','2014-10-20'),
    ('New Gold Rush: why banks are racing to be the first card in your Apple Pay','Ben', 'Popper','2014-10-20'),
    ('This is the Fitbit Surge, a $250 superwatch with built-in GPS','Chris', 'Welch','2014-10-20'),
    ('Googles redesigned Gmail app supports Yahoo and Outlook accounts','Tom','Warren','2014-10-20'),
    ('Spotify Family lets you share a subscription from $14.99 per month','Tom','Warren','2014-10-20'); 

INSERT INTO blog_posts_comments (post_id, comment_date, comment_username, comment_text)
VALUES 
	(1,'2014-10-20','houkoholic','The removal of the page turn button + having a recessed screen was insanely annoying with the paperwhite. If not for the better screen I vastly prefer having the page button on my 3rd gen Kindle. I’m glad Amazon fixed the two biggest issues with the paperwhite.'),
    (1,'2014-10-20','dealandi','What’s with those lines and dots? They look out of places. I prefer it cleaned, even if it means I have to memorize the locations to press and swipe.'),
    (2,'2014-10-20','iamisaactorres','Won’t having access to NFC payments in more places also help Android/Google Wallet users as well? Granted its easier to just authenticate with your fingerprint vs turning on your device, tapping the app, putting in a pin and THEN putting it to the reader. But still. More NFC in more places is a win, right?'),
    (2,'2014-10-20','forty2j','It helps them in theory, but if the consumer has a problem with the experience (because it’s clumsy or inconvenient, or because they’re not comfortable with what’s being done with their data) then they won’t participate.'),
    (3,'2014-10-20','stephen.ellerington','What about support for Apple Health?'),
    (4,'2014-10-20','warisz00r','One less app in my Android devices.'),
    (4,'2014-10-20','Arthur V.*','Not if you’re running any AOSP-based ROMs, like Cyanogenmod or ParanoidAndroid.'),
    (5,'2014-10-20','der_Damo','finally – yippie.');

INSERT INTO blog_posts_tags(post_id, tags)
VALUES
	(1, 'Amazon'),
	(1, 'Kindle'),
	(1, 'e-reader'),
	(1, 'review'),
	(2, 'PayPal'),
	(2, 'Apple'),
	(2, 'Digitial Wallet'),
	(3, 'Fitbit'),
	(4, 'Update'),
	(5, 'Premium'),
	(5, 'Spotify');

-- Question 5 (Query the Data)--

-- SQL query that returns all of the blog posts, with associated comments and tags --
SELECT * 
from blog_posts
inner join blog_posts_comments on (blog_posts.post_id = blog_posts_comments.post_id)
inner join blog_posts_tags on (blog_posts.post_id = blog_posts_tags.post_id);

--SQL query that returns all of the posts for a given tag--
SELECT * 
from blog_posts
inner join blog_posts_comments on (blog_posts.post_id = blog_posts_comments.post_id)
inner join blog_posts_tags on (blog_posts.post_id = blog_posts_tags.post_id)
WHERE (blog_posts_tags.tags = 'Fitbit');














