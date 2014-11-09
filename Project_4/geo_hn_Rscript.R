setwd("/users/bcarancibia/CUNY_IS_607/Project_4")

geo_hn <- read.table(file = "import_draft_v3.csv", header = TRUE, sep = ",")
options("scipen"=100, "digits"=10)

save(geo_hn, file="geo_hn.RData")