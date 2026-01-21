# Function
# sqrt(x)

#c()
 numbers <- c(4, 8, 15, 16, 23, 42)
 
 number3 <- c(1.5, 2.5, -3.5)
 
# seq()
 
 number5 <- seq(from = 1, to = 10, by = 2)
 
 # step <- seq(from = 0, to = 1, by 0.2)
 # Error: unexpected numeric constant in " step <- seq(from = 0, to = 1, by 0.2"
 
 step <- seq(from = 0, to = 1, by = 0.2)
 # memo: I forgot to include the "=" between by and 0.2. 
 
 # :
 
 series <- 1:10
 # c(1, 2, ,3 ,4, 5, 6, 7, 8, 9, 10) 
 # Error in c(1, 2, , 3, 4, 5, 6, 7, 8, 9, 10) : argument 3 is empty
# extra comma caused an error, not the spacing
# c(1 , 2,3, 4, 5, 6, 7, 8, 9, 10) 
# a space between the number and the comma does not cause an error

# Character Vectors
 chars <- c("apple", "banana", "cherry")
 chars2 <- c("red", "yellow", "green")
 chars3 <- c("A", "B", "C")
 
# Missing Values 
 z <- c(1, 3, NA, 4, 5)
 
z + 2
# It returns [1]  3  4 NA  6  7
# This added 2 to each number in the vector except for the NA value.

# Logical Vectors
logicals <- c(TRUE, FALSE, TRUE, NA)

## logicals <- c(TRUE, false, TRUE, NA)

logicals2 <- c(1 > 2, 3 < 5, 4==4)
logicals2 
# [1] FALSE  TRUE  TRUE
# 1 > 2 = FALSE, 3 < 5 = TRUE, and 4==4 also TRUE
#  > < == test and return logical vectors. 

# [x] Indexing

 z[1]
 #Z[3]
 #Error: object 'Z' not found
 # accediently made it capitalized
 
 z[3]
 # [1] NA
 z[2]
 # [1] 3
 
 z[2:4]
 # [1]  3 NA  4
# it returns the second, third and fourth item in the vector.  
 
 #z[-(1,5)]
 # Error: unexpected ',' in " z[-(1,"
 z[-(1:5)]
 # numeric(0)
 z[-c(1, 5)]
 #[1]  3 NA  4
 # This returns the second, third and fourth item in the vector.  
 # this is because the "-" is excluding index location one and five.
 
 # number3[numbers3 > 0]
 # Error: object 'numbers3' not found
 # the object does not have an "s"
 
 # Logical Indexing
 number3[number3 > 0]
 
 # Inspecting Vectors
 
 ## Length
 
 length(chars)
 # [1] 3
 # there are three sub-objects "apple", "banana", "cherry" in chars
 class(logicals)
 #[1] "logical"
 # this is a logical vector containing only TRUE, FALSE, and NA
 
 str(numbers)
 # num [1:6] 4 8 15 16 23 42
 class(numbers)
 #[1] "numeric"
 # The "num" from str() is the class. The [1:6] is the length. 
 # Then it lists all the items in the vector
 
mixed <- c("candy", 4, "book", 92)
class(mixed) 
#[1] "character"
as.numeric(mixed)
#[1] NA  4 NA 92
#Warning message:
#  NAs introduced by coercion 

chars4 <- c("1", "2", "3")
class(chars4)
# [1] "character"
as.numeric(chars4)
class(chars4)
# [1] "character"
# If we want this to change, we need to reassign the value. 
numeric_char4 <- as.numeric(chars4)
class(numeric_char4)
# [1] "numeric"

# Vectorized Functions
sum(series)
# [1] 55
# adds the vector

mean(series)
# [1] 5.5
sum(series)/length(series)
# [1] 5.5

sd(series)
#[1] 3.02765
# standard deviation

# cleaning up
rm(mixed)
#rm(list = -c("series", "numeric_char4", "logicals"))
# Error in -c("series", "numeric_char4", "logicals") : 
#invalid argument to unary operator
# 🚀 Explore and Play: the -c() is invalid with characters. 
# I asked Boisestate.ai why -c() does not work.
getwd()
save.image("Assignment2_Workspace.RData")

# Correct
rm(list = setdiff(ls(), c("series", "numeric_char4", "logicals")))
