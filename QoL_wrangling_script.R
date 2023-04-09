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
states_fips <- read_csv("Desktop/Data-and-Society/states_fips.csv")

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
  select(state_name, TotalJobLossIndex)%>%
  group_by(state_name) %>%
  summarize(TJLI = sum(TotalJobLossIndex))

QoL_Abrev <- left_join(QoL, states_fips, c("state"="name"))
state_JLI <- TGraph[-9,]

QoL_JLI <- left_join(state_JLI, QoL_Abrev, c("state_name"="state"))

QoL_JLI$JLP <- QoL_JLI$TJLI / QoL_JLI$pop2020

"""
TGraph$state_name <- state.abb[match(TGraph$state_name, state.name)]
TGraph$state_name <- replace_na(TGraph$state_name, "DC")

us_states_Tract <- left_join(us_states, TGraph, c("iso_3166_2"="state_name"))

Census_Data$GeographicArea <- state.abb[match(Census_Data$GeographicArea, state.name)]
Census_Data$GeographicArea <- replace_na(Census_Data$GeographicArea, "DC")

USStatesTract <- left_join(us_states_Tract, Census_Data, c("iso_3166_2" = "GeographicArea"))
View(Census_Data)
USStatesTract$Proportion <- USStatesTract$TJLI / USStatesTract$PopEstimate2020


ggplot(USStatesTract) +
  geom_sf(aes(fill = Proportion)) +
  scale_fill_continuous(low="yellow", high="red") +
  my_map_theme()
"""