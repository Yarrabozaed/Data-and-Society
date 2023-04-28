# https://ballotpedia.org/State-level_mask_requirements_in_response_to_the_coronavirus_(COVID-19)_pandemic,_2020-2022


library(ggplot2)
library(scales)
library(readr)
library(ggplot2)
data <- read_csv("Desktop/masks.csv")
View(data)

mycols <- strsplit(as.character(data$Effective), "; ")
mycols <- do.call(rbind, mycols)
colnames(mycols) <- c("Effective_Initial", "Effective_Updated")
data <- cbind(data, mycols)
data$Effective <- NULL

for (i in 1:nrow(data)) {
  if (data$Effective_Initial[i] == data$Effective_Updated[i]) {
    data$Effective_Updated[i] <- NA
  }
}


mycols <- strsplit(as.character(data$`Type of order ending the mandate`), "; ")
mycols <- do.call(rbind, mycols)
colnames(mycols) <- c("EOT_Initial", "EOT_Updated")
data <- cbind(data, mycols)
data$`Type of order ending the mandate` <- NULL

write.csv(data, file = "masks_1.csv")
data <- read_csv("Desktop/masks_1.csv")

mycols <- strsplit(as.character(data$`Number of days effective`), ";")
mycols <- do.call(rbind, mycols)
colnames(mycols) <- c("Days_Initial", "Days_Updated")
data <- cbind(data, mycols)
data$`Number of days effective` <- NULL

for (i in 1:nrow(data)) {
  if (data$Days_Initial[i] == data$Days_Updated[i]) {
    data$Days_Updated[i] <- NA
  }
}

data$Effective_Initial <- as.Date(data$Effective_Initial, format = "%B %d, %Y")
data$Effective_Updated <- as.Date(data$Effective_Updated, format = "%B %d, %Y")

data$VaccExempt <- as.Date(data$Effective_Initial) + as.numeric(data$Days_Initial)
data$VaccExempt <- as.Date(data$VaccExempt)

data$VaccExempt_Updated <- as.Date(data$Effective_Updated) + as.numeric(data$Days_Updated)
data$VaccExempt_Updated <- as.Date(data$VaccExempt_Updated)

# Create the plot
library(lubridate)
library(scales)
ggplot(data, aes(x = Effective_Initial, y = State)) +
  geom_point(aes(color = "1st requirement start"), size = 5) +
  geom_point(aes(x = VaccExempt, color = "1st requirement end"), size = 5) +
  geom_point(aes(x = Effective_Updated, color = "2nd requirement start"), size = 5) +
  geom_point(aes(x = VaccExempt_Updated, color = "2nd requirement end"), size = 5) +
  scale_x_date(date_breaks = "3 months", labels = date_format("%Y-%m")) +
  scale_color_manual(name = "", values = c("navy", "light blue", "coral4", "coral1"), 
                     labels = c("1st requirement end", "1st requirement start", "2nd requirement end", "2nd requirement start")) +
  labs(x = "Effective Date of Statewide Mask Mandate",
       y = "", title = "Mask Requirement Timelines in States with Statewide Mandates",
       subtitle = "States with no mandates: AK, AZ, FL, GA, ID, MO, NE, OK, SC, SD, TN",
       caption = "Data Source: BallotPedia") +
  theme_minimal()

#write.csv(data, file = "masks_2.csv")


data$Total_Days <- ifelse(is.na(data$Days_Initial), 0, as.numeric(data$Days_Initial)) + ifelse(is.na(data$Days_Updated), 0, as.numeric(data$Days_Updated))
JL_by_state <- CountryByState
#JL_by_state <- JL_by_state[-9,]
analysis <- merge(JL_by_state, data, by.x = "state_name", by.y = "State")                                    
View(analysis)
#cor.test()