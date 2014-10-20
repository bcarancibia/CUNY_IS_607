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
	comment_name VARCHAR(50) NOT NULL,
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

INSERT INTO blog_posts_comments (post_id, comment_date, comment_name, comment_text)
VALUES 
	(1,'2014-10-01','Minh Tue Vo',':) I would like to credit Mr. Nguyen Hoang An (a fellow coordinator of Vietnamese edX translation project and a passionate translator as well), Mr. Nguyen Cong Nam and other translators who have volunteered so much of their times to make the translation available online.'),
    (3,'2014-08-06','pipi','video??'),
    (3,'2014-08-06','Nicole Morell','Here’s a video of the process http://youtu.be/MOkB6PJLaH8'),
    (3,'2014-08-15','Balıkesir Haber','For Video thanks.'),
    (4,'2014-05-13','Anuncios gratis','I’m not optimistic about the future of Earth’s climate, I don’t trust the man'),
    (4,'2014-05-15','Modern Tailor','end of time is a bitter truth and we have to face it, we might be able to slow this process but one day it will collapse.'),
    (4,'2014-05-22','George Kimball','Someday historians will look back and wonder what happened to the scientific community when GW became popular in the late 20th century. The normal standards of scientific proof have been reduced to where they are meaningless'),
    (4,'2014-05-23','P. Michael Hutchins','I’ve worked through IPCC reports. What I don’t understand is: (imagine you’re talking to an engineer) What do the models really tell us? '),
    (5,'2014-03-10','Kathryn James','Some years ago at an MIT reunion (I received three degrees in EE from MIT), I learned that MIT was researching the Y chromosome to try to solve male fertility problems.'),
    (5,'2014-03-11','Carol Willing','Thank you for an informative Faculty Forum. Fascinating research and new major for learning about complex women’s health issues. Having friends coping with endometriosis, I am pleased that MIT is taking a leadership role'),
    (5,'2014-03-12','Christine Shadle','Thank you for an excellent talk. Near the end you said that endo is an inflammatory disease, and then, that “many other immune diseases wax and wane with pregnancy.” I find this confusing.'),
    (6,'2014-08-12','RemaxMajesty','social business oh good'),
    (7,'2014-05-02','C Prem Ambrose','Enjoyed the article” Preventing a Chocolate Drought,” very much. Like dark chocolates very much and everyone does. Some years ago, was very involved in imported chocolates on a small scale as a side business.');




