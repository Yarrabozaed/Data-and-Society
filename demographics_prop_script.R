library(tidyverse)
library(openintro)
library(readxl)
library(plotly)
library(readr)


demographics <- read_csv("https://raw.githubusercontent.com/Yarrabozaed/Data-and-Society/main/reduced_demographics_csv.csv")
View(demographics)
demographics[2, "Category"] <- "STEM"

demographics$Men <- 100 - demographics$Women 


ggplot(demographics, aes(x = Category, y = Women, fill = "Women")) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Women" = "light blue")) +
  xlab("") +
  ylab("Proportion of Women") +
  ggtitle("Proportion of Women per Industry")

#"Transportation and warehousing"
#"STEM"
#"Accommodation and food services" 
#"Health care and social assistance"
category = "Transportation and warehousing"
demo_reduced <- demographics %>% select(-Men, -Women, -Total)

subset_df <- demo_reduced[demo_reduced$Category == category, ]
  
subset_df_long <- reshape2::melt(subset_df, id.vars = "Category")
  
  # Create the bar graph
ggplot(subset_df_long, aes(x = variable, y = value, fill = variable)) +
    geom_bar(stat = "identity") +
    xlab("") +
    ylab("Proportion") +
    ggtitle(paste0("Proportions for ", category)) +
    scale_fill_manual(values = c("honeydew4", "cadetblue", "tomato3", "goldenrod1"))

