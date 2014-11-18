--Ben Arancibia
--November 18th, 2014
--Week 12 Quiz

--Question 1

--load the csvs into neo4j using cypher statements

--students and housing
LOAD CSV WITH HEADERS FROM 
"file:/users/bcarancibia/CUNY_IS_607/Week12/week-12-quiz-data-students-and-housing.csv" AS csvLine 
CREATE (student:Student {firstname: csvLine.GivenName, 
    lastname: csvLine.Surname, 
    id: csvLine.ID, 
    gender: csvLine.Gender, 
    address: csvLine.StreetAddress, 
    city: csvLine.City, state: csvLine.State, 
    zipcode: csvLine.ZipCode, 
    phone: csvLine.TelephoneNumber }) 
MERGE (dormitory:Dormitory { name: csvLine.Dormitory}) 
CREATE (student)-[:Housed {room: csvLine.Room }]->(dormitory)

--courses in progress

LOAD CSV WITH HEADERS FROM 
"file:/users/bcarancibia/CUNY_IS_607/Week12/week-12-quiz-data-courses.csv" AS csvLine
MATCH (student:Student {id: csvLine.ID})
MERGE (course:Course { department: csvLine.CourseDept, number: csvLine.CourseNumber, title: csvLine.CourseName })
CREATE (student)-[:Enrolled {section: csvLine.Section, i
nstructor: csvLine.Instructor, grade: csvLine.Grade}]->(course)

--Question 2

I think that a graph database is a bad choice. A relational database would be a better solution. 
In an SQL database you would divide the data into three tables: Student, Course, and Housing. 
The Student table will be the parent table and the Course table and the Housing table will be the child tables. 
The Student table will hold the foreign key to those child tables. This is an easier solution in my opinion
then having a graph database with different relationships. 
If there had been loops in the graph, or other information that is difficult to capture in traditional relational structures, 
then a graph database would have been a better choice.

--Question 3

MATCH (rm:Student)-[h:Housed]->(dorm:Dormitory)
MATCH (rk:Student {firstname: "Richard", lastname: "Kowalski"})-[rmh:Housed]->(dorm)
WHERE h.room = rmh.room AND rm <> rk
RETURN rm

--Question 4

MATCH (rk:Student {id:"19457"})-[e:Enrolled]->(course:Course {number: "120", title: "Finite Mathematics"})
CREATE (rk)-[c:Completed {
section: e.section, 
instructor: e.instructor, 
grade: "B"}]->(course)

DELETE e
RETURN rk,c,course

