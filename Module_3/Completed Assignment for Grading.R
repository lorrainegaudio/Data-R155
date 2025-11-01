##### Lesson & Learning Challenges #####

thing_1             # object? (expect an error‑message: not found)

"thing_1"           # character string — prints literally

3                   # numeric literal

mean                # function *object* → prints the function body

mean()              # function *call*   → error: argument is missing

?mean               # opens in Help pane (bottom-right)

help(sample)        # alternate syntax works the same

Sys.Date()      # current date (yyyy-mm-dd)

Sys.time()      # current date + time

Sys.timezone()  # your local timezone string

# Coerce to Date with as.Date()
as.Date("2025-09-07")

set.seed(123)          # reproducible randomness

numbers <- 1:10       

sample(numbers, 3)                 # three unique picks

sample(numbers, 10, replace = TRUE)  # allow repeats

values <- c(1, 2, 3, 4, 5, NA)

mean(values)                       # default na.rm = FALSE → returns NA

mean(values, na.rm = TRUE)         # ignore missing values

mean(values, trim = 0.2, na.rm = TRUE)  # drop 20% from each end first

#📍 Identify: Try median(values, na.rm = TRUE). Why doesn’t median()need trim?
median(values, na.rm = TRUE)
# In R, the trim argument is used with functions like mean() to remove a proportion of the 
## smallest and largest values before performing the calculation.
# mean() is sensitive to extreme values (outliers), so trim is useful.
# median(), by definition, is already robust to outliers.

# 🚀 Explore and Play: What happens if you try sum vs. sum(1:5)? 


# 🚀 Explore and Play: Try out the descriptive statistics and summaries functions on objects.
set.seed(42)
explore_and_play <- sample(numbers, 100, replace = TRUE)  # allow repeats
sum(explore_and_play) 
# [1] 545
prod(explore_and_play)	
# [1] 1.93032e+65
min(explore_and_play)
# [1] 1
max(explore_and_play)
# [1] 10
range(explore_and_play)
# [1]  1 10
sd(explore_and_play)
# [1] 2.893305
var(explore_and_play)
# [1] 8.371212
quantile(explore_and_play)
# 0%  25%  50%  75% 100% 
# 1    3    5    8   10 

# 🚀 Explore and Play: Run the line twice. 
mean(sample(numbers, size = 5, replace = TRUE)) 
# [1] 7.8
mean(sample(numbers, size = 5, replace = TRUE)) 
# [1] 5.6
# Why does the result change each time even though the code is identical?
## Answer: Each time sample is ran, it creates a new sample.

# 🧠 Challenge: Draw 5 numbers without replacement and sort them ascending.
sort(sample(numbers, size = 5, replace = FALSE))
## [1]  1  3  8  9 10

# ✍️ Practice: From the functions we have learned about, practice nesting.

head(sort(unique(c(3, 5, 1, 5, 2, 3, 4)), decreasing = TRUE), 3)
# [1] 5 4 3

sd(head(rev(1:10), 5))
# [1] 1.581139

mean(head(sort(round(runif(10), 2)), 3))
# [1] 0.12

format(as.Date(Sys.time()), "%A, %B %d, %Y")
# [1] "Thursday, September 18, 2025"

length(unique(round(runif(20, 0, 10))))
# [1] 9

rev(rank(c(50, 30, 40)))
# [1] 2 1 3

##### Lesson 4 Assignment #####

# Task 1
# Set a reproducible seed (pick any whole number you like). 
# Use sample() and seq() together to create a vector called **scores** 
# that contains 25 random numbers between 60 and 100, inclusive. 
# Include at least 3 NA values in scores (hint: combine vectors with c()).

# Step 1: Create the sequence from 60 to 100
score_range <- seq(60, 100)

# Step 2: Sample 22 values with replacement from the sequence
random_scores <- sample(score_range, size = 22, replace = TRUE)

## Using Nesting
random_scores <- sample(seq(60, 100), size = 22, replace = TRUE)

# Add 3 NA values
scores <- c(random_scores, NA, NA, NA)

# Shuffle the vector so NA values are randomly placed
scores <- sample(scores)

# Task 2
## a.  Open the help file for sample() in the console.
?sample
## b. In the comment block below, list TWO required arguments and 
## TWO default arguments for sample() exactly as they appear in the Usage section.

# 1. Required arguments: 
## (1) x and (2) size


# 2. Default arguments: 
## (2) replace = FALSE and (2) prob = NULL

# Task 3
## a. Calculate the mean of scores and store it in average_raw. 
# Calculate mean including NA values
average_raw <- mean(scores)
average_raw
## b. Calculate the mean of scores again, this time excluding NA values, and store it in average_clean.
# Calculate mean excluding NA values
average_clean <- mean(scores, na.rm = TRUE)
average_clean


# Task 4
## a. Use sample() to draw 10 values with replacement from scores and 
## store them in sample_scores_positional WITHOUT naming any arguments. 
sample_scores_positional <- sample(scores, 10, TRUE)

## b. Repeat the same call, but this time name every argument; store as sample_scores_named.
sample_scores_named <- sample(x = scores, 
                              size = 10, 
                              replace = TRUE)

# Task 5
## Combine mean() and sample() to calculate the mean of 5 random draws from scores 
### (allow replacement); store the result in mean_of_five. 
## Do this in one line of code.
mean_of_five <- mean(sample(scores, 5, replace = TRUE), 
                     na.rm = TRUE)

# Task 6
## Use Sys.Date() and Sys.time() to create two separate objects, today_date and now_time.
# a. Get current date
today_date <- Sys.Date()

# b. Get current date and time
now_time <- Sys.time()


# Task 7
## In one sentence, explain the difference between a function object and a function call.

# A function object (e.g., mean) refers to the function itself 
# as a value that can be passed or assigned, while a function 
# call (e.g., mean()) executes the function with specific arguments 
# and returns a result.

##### Practice Space #####
# my_object: I used nesting and two new objects
my_object <- sort(sample(x = seq(1, 50), size = 10, replace = FALSE))
# This object contains 10 unique random numbers between 1 and 50, sorted in ascending order.

# 1. Use runif() to create 10 random decimals, then round() them.
# a. Generate 10 random decimal numbers between 0 and 1
random_decimals <- runif(10)

# b. Round them to the nearest whole number
rounded_decimals <- round(random_decimals)
## Or to nearest two decimals
rounded_decimals <- round(random_decimals, digits = 2)

# 2. Nest sample() inside paste() to build a random silly password.
set.seed(123)
silly_password <- paste(sample(c("banana", "robot", "noodle", "zebra", "pickle", "wizard", "cactus"), 3, replace = TRUE))
silly_password

set.seed(999)
silly_password <- paste(sample(c("banana", "robot", "noodle", "zebra", "pickle", "wizard", "cactus"), 3, replace = TRUE))
silly_password

# 3. Open ?sd and compute the standard deviation of values after removing NA.
?sd
sd(scores)
sd(scores, na.rm = TRUE)

##### Save #####
getwd()
save.image("completed_assignment_for_grading.RData")

