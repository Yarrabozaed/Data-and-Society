library(ggplot2)
library(scales)
library(readr)
library(ggplot2)

#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/political_leaning/party_affiliation_2021.csv
#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv 
PI <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/personal_income/income.csv")
JL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv")
View(PI)

PI$dif <- PI$`2018` - PI$`2021`
PI$dif1 <- PI$`2021` - PI$`2018`

analysis_income <- merge(JL, PI, by.x = "state_name", by.y = "GeoName")  
cor.test(analysis_income$ProportionOfJobLossIndexToLowIncomeJobs, analysis_income$dif1)
