# Load necessary libraries
library(ggplot2)
library(ggmosaic)

# Create the dataset
data <- data.frame(
  SCHOOL = c("A", "A", "A", "B", "B", "B", "C", "C", "C", "D", "D", "D"),
  GRADE_LEVEL = c("Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3", "Grade 1", "Grade 2", "Grade 3"),
  NUMBER_OF_STUDENTS = c(25, 30, 20, 22, 28, 18, 20, 25, 15, 28, 32, 24)
)

# Mosaic Plot
ggplot(data) +
  geom_mosaic(aes(x = product(SCHOOL, GRADE_LEVEL), fill = NUMBER_OF_STUDENTS)) +
  labs(title = "Mosaic Plot of Number of Students by School and Grade Level") +
  theme_minimal()

# Histogram Plot
ggplot(data, aes(x = NUMBER_OF_STUDENTS)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram of Number of Students", x = "Number of Students", y = "Frequency") +
  theme_minimal()

# Scatter Plot
ggplot(data, aes(x = SCHOOL, y = NUMBER_OF_STUDENTS, color = GRADE_LEVEL)) +
  geom_point(size = 3) +
  labs(title = "Scatter Plot of Number of Students by School and Grade Level", x = "School", y = "Number of Students") +
  theme_minimal()
