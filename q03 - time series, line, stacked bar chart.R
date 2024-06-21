library(ggplot2)
library(vcd)
library(grid)

data <- data.frame(
  Year = c(2019, 2020, 2022, 2023, 2024),
  Browser = rep('Chrome', 5),
  Users = c(22.7, 25.8, 28.7, 30.5, 35.2)
)

pie_plot <- function(data) {
  pie(data$Users, labels = data$Year, main = "Chrome Users Over Years", col = rainbow(length(data$Year)))
}

mosaic_plot <- function(data) {
  data_mosaic <- table(data$Year, data$Browser)
  mosaic(data_mosaic, main = "Mosaic Plot of Browser Users Over Years")
}

scatter_plot <- function(data) {
  ggplot(data, aes(x = Year, y = Users)) +
    geom_point(aes(color = Browser), size = 4) +
    ggtitle("Scatter Plot of Browser Users Over Years") +
    xlab("Year") + ylab("Users (in millions)")
}

pie_plot(data)
mosaic_plot(data)
print(scatter_plot(data))