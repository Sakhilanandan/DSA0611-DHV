
library(ggplot2)
library(dplyr)
library(tidyr)

data <- data.frame(
  Month = c("Jan", "Feb", "March", "April", "May", "Jun", "July", "August", "Sep", "Oct", "Nov", "Dec"),
  Economic_Condition = c("Good", "Good", "Good", "Good", "Fair", "Fair", "Good", "Bad", "Fair", "Good", "Bad", "Fair"),
  Unemployment_Rate = c(10.7, 9.8, 10.2, 11.2, 15.75, 17.8, 19.4, 25.6, 18.6, 15.6, 26.7, 19.5)
)

# Stacked Bar Plot
stacked_data <- data %>%
  pivot_wider(names_from = Economic_Condition, values_from = Unemployment_Rate, values_fill = list(Unemployment_Rate = 0)) %>%
  pivot_longer(cols = -Month, names_to = "Economic_Condition", values_to = "Unemployment_Rate")

ggplot(stacked_data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Unemployment Rates by Economic Condition", y = "Unemployment Rate") +
  theme_minimal()

# Pie Plot
pie_data <- data %>%
  count(Economic_Condition)

ggplot(pie_data, aes(x = "", y = n, fill = Economic_Condition)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Pie Plot of Economic Conditions", y = "") +
  theme_minimal()

# Grouped Bar Plot
ggplot(data, aes(x = Month, y = Unemployment_Rate, fill = Economic_Condition)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Plot of Unemployment Rates by Economic Condition", y = "Unemployment Rate") +
  theme_minimal()

