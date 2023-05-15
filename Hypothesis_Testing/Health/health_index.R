
library(ggplot2)
library(scales)
library(readr)
library(ggplot2)

#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/QoL/QoL.csv
#https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv 
QoL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/QoL/QoL.csv")
JL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv")

analysis_qol <- merge(JL, QoL, by.x = "state_name", by.y = "state")  
View(analysis_qol)
cor.test(analysis_qol$ProportionOfJobLossIndexToLowIncomeJobs, analysis_qol$healthCareRank_21)


ggplot(analysis_qol, aes(x = healthCareRank_21, y = ProportionOfJobLossIndexToLowIncomeJobs)) +
  geom_point() +
  labs(x = "Health Services Rankings",
       y = "Proportion of Low-Income Jobs Lost",
       title = "Health Services Rankings vs. Proportion of Low-Income Jobs Lost by US States") +
  geom_smooth(method = "lm", se = TRUE, color = "blue") 


politcal <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/political_leaning/party_affiliation_2021.csv")

politcal$`Republican/lean Rep.` <- gsub("%", "", politcal$`Republican/lean Rep.`, fixed = TRUE)
politcal$`Republican/lean Rep.`<- as.numeric(politcal$`Republican/lean Rep.`)/100

politcal$`No lean` <- gsub("%", "", politcal$`No lean`, fixed = TRUE)
politcal$`No lean`<- as.numeric(politcal$`No lean`)/100

politcal$`Democrat/lean Dem.` <- gsub("%", "", politcal$`Democrat/lean Dem.`, fixed = TRUE)
politcal$`Democrat/lean Dem.`<- as.numeric(politcal$`Democrat/lean Dem.`)/100

politcal$party <- ifelse(politcal$`Republican/lean Rep.` > politcal$`Democrat/lean Dem.`, "r", "d")

tmp1 <- analysis_qol

analysis_qol <- merge(politcal, tmp1, by.x = "State", by.y = "state_name")    


ggplot(analysis_qol, aes(x = healthCareRank_21, y = ProportionOfJobLossIndexToLowIncomeJobs)) +
  geom_point(aes(color = ifelse(party == "d", "navy", "red"))) +
  labs(x = "Health Services Rankings",
       y = "Proportion of Low-Income Jobs Lost",
       title = "Health Services Rankings vs. Proportion of Low-Income Jobs Lost by US States",
       subtitle = "Colored by Political Affiliation in The 2021 US Elections") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  scale_color_manual(name = "", values = c("navy", "red"), labels = c("Democrat","Republican"))
  

