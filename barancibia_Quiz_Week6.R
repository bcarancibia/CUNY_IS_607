#### Benjamin Arancibia####
# October 3rd, 2014
# Week 6 Quiz

install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
class(bowlPool)
#the class of bowlPool is a dataframe

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?
class(hvalues)
#the class of hvalues is a list

# 3. Write R code that shows how many HTML tables are represented in hvalues
length(hvalues)

#number of HTML tables is 7

# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe
Names_df <- readHTMLTable(theURL, which = 1, header = TRUE, stringsAsFactors = FALSE)
Names_df


# 5. Modify the returned data frame so only the Last Name and Points columns are shown.
modified_names_df <- Names_df[, c('Last Name', 'Points')]


# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  
new_url <- 'http://en.wikipedia.org/wiki/Departments_of_Honduras'
new_table <- readHTMLTable(new_url)

# 7 How many HTML tables does that page contain?
length(new_table)

# There are six HTML Tables

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.

#I am using Google Chrome. To view the HTML Page source I right click on the page. After right clicking, I scroll down to view page source.
#When I click on view page source a new tab opens with page source.