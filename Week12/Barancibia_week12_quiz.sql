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


