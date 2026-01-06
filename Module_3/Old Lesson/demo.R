# Call Basics

# thing_1
# Error: object 'thing_1' not found
# because it is not in the environment

"thing_1"
# this prints when it is in quotes. No error

thing_1 <- "thing_1"
thing_1
# this now prints because it is saved in the environment

3
# [1] 3

mean
# function (x, ...) 
#  UseMethod("mean")
#<bytecode: 0x0000027f76ddd5c8>
#  <environment: namespace:base>

# mean()
# Error in mean.default() : argument "x" is missing, with no default
# Requires x inside of the ()

?mean
# this opens the help file which explains how to use the function
help(sample)
# help works like ?

# arg(mean)
# Error in arg(mean) : could not find function "arg"
# forgot the s

args(mean)
#function (x, ...) 
#  NULL
# what arguments are required

# Date Time

Sys.Date()

Sys.time()

as.Date()
# Error in as.Date.default() : argument "x" is missing, with no default

as.Date(2025-09-06)
# [1] "1975-07-04"
# this subtracts 2025 - 9 - 6 

as.Date("2025-09-06")
# [1] "2025-09-06"

# sample
set.seed(123)

numbers <- 1:10

sample(numbers)
# [1]  1  7  2  5  3 10  4  6  9  8
# full size of sample

sample(x = numbers, size = 3)
sample(numbers, 3)
# both of these are the same function call

sample(x = numbers, size = 5, replace = TRUE)
# replace defaults to FALSE, include TRUE means that they numbers are replaced
# and can be drawn again

# mean
values <- c(1, 2, 3, 4, 5, NA)

mean(values)
# [1] NA
# You can't calculate the mean when there is an NA in the vector

mean(values, na.rm = TRUE)
# [1] 3

values <- c(1, 2, 3, 4, 5, 1000)

mean(values, trim = 0.2, na.rm = TRUE)

# Nesting Functions

mean(x = sample(numbers, size = 5, replace = TRUE))

x <- sample(numbers, size = 5, replace = TRUE)
mean(x)
# these two are the same function call


# Assignment

## Task 1

# Save
save.image("Assignment3_Workspace.RData")

# Submit Both .R .RData
