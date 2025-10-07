# Read the shareholders data
shareholders <- read.csv("Data.txt")

# Let's see what we have
View(shareholders)
# Extract just the numbers (the second column)
numbers <- shareholders$Number_of_Shareholders.thousands.

# Draw a simple histogram
hist(numbers, 
     main = "Histogram of Number of Shareholders",
     xlab = "Number of Shareholders (thousands)",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")
# Create breaks for 7 classes
breaks <- seq(130, 270, by = 20)  # This gives us: 130, 150, 170, 190, 210, 230, 250, 270

hist(numbers,
     breaks = breaks,
     main = "Histogram with 7 Classes",
     xlab = "Number of Shareholders (thousands)",
     ylab = "Frequency",
     col = "lightgreen",
     border = "black",
     right = FALSE)  # This means left-closed intervals
# Cut the data into classes
classes <- cut(numbers, breaks = breaks, right = FALSE)

# Create frequency table
freq_table <- table(classes)
print(freq_table)

# Make it prettier
freq_df <- as.data.frame(freq_table)
colnames(freq_df) <- c("Class Interval", "Frequency")
print(freq_df)
# Get midpoints of each class
midpoints <- seq(140, 260, by = 20)  # Middle of each interval

# Get frequencies
frequencies <- as.vector(freq_table)

# Draw the polygon
plot(midpoints, frequencies,
     type = "b",  # "b" means both lines and points
     main = "Frequency Polygon",
     xlab = "Number of Shareholders (thousands)",
     ylab = "Frequency",
     col = "blue",
     pch = 16,  # Solid circle points
     lwd = 2)   # Line width
grid()  # Add a grid for easier reading
# Calculate cumulative frequencies
cumulative_freq <- cumsum(frequencies)

# For ogive, we plot at upper class boundaries
upper_boundaries <- seq(150, 270, by = 20)

# Draw the ogive
plot(upper_boundaries, cumulative_freq,
     type = "b",
     main = "Cumulative Frequency Polygon (Ogive)",
     xlab = "Number of Shareholders (thousands)",
     ylab = "Cumulative Frequency",
     col = "red",
     pch = 16,
     lwd = 2)
grid()
# Read the delivery times data
delivery_times <- read.table("Exercise - Lab 05.txt", 
                             header = TRUE)

# Let's see it
View(delivery_times)

# Extract the actual numbers
times <- delivery_times$Delivery_Time_.minutes.