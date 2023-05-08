library(dplyr)
library(ggplot2)
library(scales)
library(readr)
library(ggplot2)

#This data-set is MASSIVE, download at your own discretion 

Bans <- read_csv("https://data.cdc.gov/api/views/3qs9-qnbs/rows.csv?accessType=DOWNLOAD")
Bans$Date <- as.Date(Bans$Date)

Bans_filtered <- Bans %>% filter(General_or_Under_6ft_Bans_Gatherings_Over != -1)

max_ban_duration_by_state <- Bans_filtered %>%
  group_by(State_Tribe_Territory) %>%
  summarize(max_ban_duration = max(Date) - min(Date))

View(max_ban_duration_by_state)


az <- data.frame(State_Tribe_Territory = "Arizona", max_ban_duration = 0)
nd <- data.frame(State_Tribe_Territory = "North Dakota", max_ban_duration = 0)
sd <- data.frame(State_Tribe_Territory = "South Dakota", max_ban_duration = 0)
# add the new row to the existing data frame
max_ban_duration_by_state <- rbind(max_ban_duration_by_state, az)
max_ban_duration_by_state <- rbind(max_ban_duration_by_state, nd)
max_ban_duration_by_state <- rbind(max_ban_duration_by_state, sd)

JL <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/Hypothesis_Testing/Mask_Req_Length/JL_by_state.csv")

analysis_sd <- merge(JL, max_ban_duration_by_state, by.x = "state_name", by.y = "State_Tribe_Territory") 
analysis_sd$max_ban_duration <- as.integer(gsub(" days", "", analysis_sd$max_ban_duration))

View(analysis_sd)

cor.test(analysis_sd$ProportionOfJobLossIndexToLowIncomeJobs, analysis_sd$max_ban_duration)

highlight_row <- c("Hawaii", "New York", "District of Columbia")

highlight_row1 <- c("Idaho", "Utah")



library(lubridate)
library(scales)
ggplot(analysis_sd, aes(x = max_ban_duration, y = state_name, color = ifelse(state_name %in% highlight_row, "High Prop LIJs Lost", ifelse(state_name %in% highlight_row1, "Low Prop LIJs Lost", "Other")))) +
  geom_point(size = 5) +
  labs(x = "Length of SD Requirement",
       y = "", title = "Maximum Length of Social Distancing (SD) Requirement Duration",
       subtitle = "States with no requirements: AZ, ND, SD",
       caption = "Data Source: Health Data Gov.") +
  theme_minimal() +
  scale_color_manual(name = "Key", values = c("High Prop LIJs Lost" = "navy", "Low Prop LIJs Lost" = "seagreen4", "Other" = "lightblue"))


#TESTS- DONT RUN THIS
JL$state_name[!(JL$state_name %in% max_ban_duration_by_state$State_Tribe_Territory)]
x <- subset(Bans, State_Tribe_Territory == "Arizona")

x1 <- subset(x, General_or_Under_6ft_Bans_Gatherings_Over != -1)
View(x)
