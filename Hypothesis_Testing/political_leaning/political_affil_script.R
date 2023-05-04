library(ggplot2)
library(scales)
library(readr)
library(ggplot2)

#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/political_leaning/party_affiliation_2021.csv
#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv 
politcal <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/political_leaning/party_affiliation_2021.csv")
JL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv")

politcal$`Republican/lean Rep.` <- gsub("%", "", politcal$`Republican/lean Rep.`, fixed = TRUE)
politcal$`Republican/lean Rep.`<- as.numeric(politcal$`Republican/lean Rep.`)/100

politcal$`No lean` <- gsub("%", "", politcal$`No lean`, fixed = TRUE)
politcal$`No lean`<- as.numeric(politcal$`No lean`)/100

politcal$`Democrat/lean Dem.` <- gsub("%", "", politcal$`Democrat/lean Dem.`, fixed = TRUE)
politcal$`Democrat/lean Dem.`<- as.numeric(politcal$`Democrat/lean Dem.`)/100

analysis_political <- merge(JL, politcal, by.x = "state_name", by.y = "State")  
View(analysis_political)
cor.test(analysis_political$ProportionOfJobLossIndexToLowIncomeJobs, analysis_political$`Democrat/lean Dem.`)
cor.test(analysis_political$ProportionOfJobLossIndexToLowIncomeJobs, analysis_political$`Republican/lean Rep.`)


#data:  analysis_political$ProportionOfJobLossIndexToLowIncomeJobs and analysis_political$`Republican/lean Rep.`
#t = -7.9966, df = 49, p-value = 1.934e-10
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#  -0.8514618 -0.6016004
#sample estimates:
#  cor 
#-0.7524366 
