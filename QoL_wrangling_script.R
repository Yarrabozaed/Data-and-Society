knitr::opts_chunk$set(echo = TRUE)
library(shiny)
library(tidyverse)
library(openintro)
library(readxl)
library(plotly)
library(readr)
library(albersusa)

QoL <- read_csv("QoL.csv")
View(QoL)

Labels <- read_csv("https://ui-lodes-job-change-public.s3.amazonaws.com/lehd_types_s3.csv")
County <- read_csv("https://ui-lodes-job-change-public.s3.amazonaws.com/sum_job_loss_county.csv")
Tract <- read_csv("https://ui-lodes-job-change-public.s3.amazonaws.com/job_loss_by_tract.csv")
CBSA <- read_csv("https://ui-lodes-job-change-public.s3.amazonaws.com/sum_job_loss_cbsa.csv")
Census_Data <- read_csv("http://www.bls.gov/cew/data/api/2022/3/industry/10.csv", col_names = FALSE, skip = 10, n_max = 51)
states_fips <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/states_fips.csv?token=GHSAT0AAAAAAB6HU4X3XK4C7USKTKX6WGEGZBTJZGQ")
View(states_fips)

## Data
Lab <- c("TotalJobLossIndex", "Agriculture", "Mining", "Utilities", "Construction", "Manufacturing", "Wholesale_Trade", "Retail_Trade", "Transportation_Warehousing", "Information", "Finance_Insurance", "RealEstate", "STEM", "CorpManagement", "WasteManagement", "Education", "Health_SocialAssistance", "Arts", "Accommodations_FoodService", "OtherServices", "PublicAdmin")

LabChange <- County[,-1:-3]
LabChange <- LabChange[,-22:-25]
LabChange <- setNames(LabChange, Lab)
NoChangeFirst <- County[,-4:-28]
NoChangeLast <- County[, -1:-24]
County <- cbind(NoChangeFirst, LabChange, NoChangeLast)

LabChange <- CBSA[,-1:-2]
LabChange <- LabChange[,-22:-25]
LabChange <- setNames(LabChange, Lab)
NoChangeFirst <- CBSA[,-3:-27]
NoChangeLast <- CBSA[, -1:-23]
CBSA <- cbind(NoChangeFirst, LabChange, NoChangeLast)

Lab <- c("Agriculture", "Mining", "Utilities", "Construction", "Manufacturing", "Wholesale_Trade", "Retail_Trade", "Transportation_Warehousing", "Information", "Finance_Insurance", "RealEstate", "STEM", "CorpManagement", "WasteManagement", "Education", "Health_SocialAssistance", "Arts", "Accommodations_FoodService", "OtherServices", "PublicAdmin", "TotalJobLossIndex")

LabChange <- Tract[,-1:-7]
LabChange <- LabChange[,-22:-23]
LabChange <- setNames(LabChange, Lab)
NoChangeFirst <- Tract[,-7:-30]
NoChangeLast <- Tract[, -1:-28]
Tract <- cbind(NoChangeFirst, LabChange, NoChangeLast)

Lab <- c("GeographicArea", "Population_Estimates_Base", "PopEstimate2020", "PopEstimate2021", "PopEstimate2022", "Ranking_Base", "Ranking2020", "Ranking2021", "Ranking2022", "Change_21_22_Number", "Change_21_22_Percent", "Change_20_22_Number", "Change_20_22_Percent", "Ranking_21_22_Number", "Ranking_21_22_Percentage", "Ranking_20_22_Number", "Ranking_20_22_Percentage")

Census_Data <- setNames(Census_Data, Lab)

Census_Data$GeographicArea <- str_replace(Census_Data$GeographicArea, ".", "" )


TGraph <- Tract %>%
  select(state_name, TotalJobLossIndex, total_li_workers_employed)%>%
  group_by(state_name) %>%
  summarize(TJLI = sum(TotalJobLossIndex)/sum(total_li_workers_employed))

prop <- left_join(states_fips, TGraph, c("name"="state_name"))

QoL_Abrev <- left_join(QoL, prop, c("state"="name"))
state_JLI <- TGraph[-9,]

QoL_JLI <- left_join(state_JLI, QoL_Abrev, c("state_name"="state"))

QoL_JLI$JLP <- QoL_JLI$TJLI / QoL_JLI$pop2020

QoL_JLI$QoL_21 <- rowSums(QoL_JLI[, c("healthCareRank_21","educationRank_21","economyRank_21","infrastructureRank_21","oppurtunityRank_21","fiscalStabilityRank_21","crimeAndCorrectionsRank_21","naturalEnvironmentRank_21")])

QoL_JLI$QoL_18 <- rowSums(QoL_JLI[, c("healthCareRank_18","educationRank_18","economyRank_18","infrastructureRank_18","oppurtunityRank_18","fiscalStabilityRank_18","crimeAndCorrectionsRank_18","naturalEnvironmentRank_18")])

QoL_JLI$QoL_21 <- 377 - QoL_JLI$QoL_21

QoL_JLI$QoL_18 <- 372 - QoL_JLI$QoL_18

QoL_Abrev$QoL_change <- QoL_Abrev$lifeQualityRank_18 - QoL_Abrev$lifeQualityRank_21

QoL_JLI$FS_change <- QoL_JLI$fiscalStabilityRank_18 - QoL_JLI$fiscalStabilityRank_21

ggplot(QoL_JLI, mapping = aes(JLP, QoL_21)) +
  geom_point()



qplot(x = TJLI, y=QoL_change , data = QoL_Abrev, 
      geom=c("jitter","smooth"),
      xlab = "Proportion of LI jobs lost (low income jobs lost/sum low income jobs)",
      ylab = "Change in Quality of Life (2018 - 2021)",
      main = "Change in Quality of Life vs Proportion of LI jobs lost")

cor.test(QoL_Abrev$TJLI, QoL_Abrev$QoL_change)




