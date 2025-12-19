3+4

# 3.008+7*24)

# Error: unexpected ')' in "3.008+7*24)"

# Memo: This error is because the ) is a typo. 

result <- 3+4

number <- 42

ratio <- number / result


# 🛠 Break Things! 
# Ratio
# Error: object 'Ratio' not found
# case matters

# 🚀 Explore and Play:

# number -> 42

# Error in 42 <- number : invalid (do_set) left-hand side to assignment

number -> something

# something is now in the environment

# 🔍 Look deeper: Why does something work but 42 does not?

# I asked boisestate.ai this question and learned that numbers cannot be names for values unless I use backticks.

"number" -> `42`

greeting <- "Welcome to R"

Statement <- "Productive code is clear and reproducible."

message <- paste(greeting, Statement)

message

getwd()

# setwd("~/BSU/Teaching/Data-R155/Data-R155")


save.image("Assignment_Workspace.RData")
