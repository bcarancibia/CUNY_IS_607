--Postgresql load in data
--used command line

CREATE wiki

\connect wiki

CREATE TABLE wikilog (
    dataid SERIAL PRIMARY KEY,
    projectcode text,
    pagename text,
    pageviews int,
    bytes bigint
);

COPY wikilog (projectcode, pagename, pageviews, bytes)
FROM E'/users/bcarancibia/CUNY_IS_607/20141001140000.txt'   --you will need to change this--
WITH DELIMITER ' ';


Deliverable 

SELECT * FROM wikidata ORDER BY pageviews DESC;



1. Database (257)
2. Data:image/pgn (220)
3. Data (203)
4. Data mining (196)
5. Data Protection Act 1998 (174)