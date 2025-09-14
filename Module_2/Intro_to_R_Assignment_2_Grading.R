# Intro to R – Assignment 2 (Vectors & Summaries) – Completed template
# -------------------------------------------------------------------
# GRADING KEY (rubric overview)
# Points | Criterion                           | Common Pain Point                              | Grader Tip
# 0.5    | Tasks 1‑2 vector foundations        | Different vector lengths; manual growth calc   | growth must use vector subtraction
# 0.5    | Tasks 3‑4 exploration & subsetting  | forgetting str(); wrong logical condition      | positive_growth uses >0 ; last_two uses index 3:4
# 0.5    | Task 5 summaries                    | using loops; forgetting na.rm; calc wrong obj  | use mean()/sum()
# 0.5    | Task 6 data frame                   | vectors different length; forgot growth col    | str(sales) shows 4 vars × 4 obs
# 0.5    | Technical quality & submission      | script errors; missing .RData upload           | Source entire script, verify no errors
# -------------------------------------------------------------------
# Directions for graders: run top‑to‑bottom; objects appear; check against key.

# ---------- Task 1: Build two numeric vectors ---------- ####
# 📌 Grading Key (Tasks 1‑2)
# Pain: vectors of unequal length; numbers entered as characters.
# Tip: Use c() and numeric literals.
sales_q1 <- c(12000, 15000, 13000, 18000)
sales_q2 <- c(12500, 16000, 12800, 19000)

# ---------- Task 2: Calculate growth ---------- ####
# growth should be vectorised subtraction (Q2 − Q1)
growth <- sales_q2 - sales_q1    # expected: 500 1000 -200 1000

# ---------- Task 3: Inspect ---------- ####
# 📌 Grading Key
# Pain: Using typeof() instead of str(); not commenting.
# Tip: class() returns high‑level type; str() shows full structure.
class(growth)     # "numeric"
str(growth)       # num [1:4] 500 1000 -200 1000
# str() reveals growth is a numeric vector of length 4 with the listed values.

# ---------- Task 4: Subset ---------- ####
# 📌 Grading Key
# Pain: forgetting logical filter or index logic; off‑by‑one indices.
positive_growth <- growth[growth > 0]   # keep only positives
last_two        <- sales_q2[3:4]        # last two elements by position

# ---------- Task 5: Vectorised summaries ---------- ####
# 📌 Grading Key
# Pain: using loops; not saving objects.
avg_q2   <- mean(sales_q2)   # 15075
total_q1 <- sum(sales_q1)    # 58000

# ---------- Task 6: Mini data frame ---------- ####
# 📌 Grading Key
# Pain: vectors unequal length; using data.frame() with stringsAsFactors.
months <- c("Jan", "Feb", "Mar", "Apr")
sales  <- data.frame(
  month      = months,
  sales_q1   = sales_q1,
  sales_q2   = sales_q2,
  growth     = growth,
  stringsAsFactors = FALSE
)
str(sales)   # 4 obs. of 4 variables

# ---------- Task 7: Reflection ---------- ####
# Mixing characters and numerics in one atomic vector forces all elements
# to type character because R can only store one type per vector.

# ---------- Task 8: Stretch (optional) ---------- ####
# Example: percent growth rounded to 1 decimal place.
pct_growth <- round((growth / sales_q1) * 100, 1)  # % change Q1→Q2
# pct_growth demonstrates vector arithmetic + round()

# ---------- SAVE & SUBMIT ---------- ####
# Uncomment after verifying working directory.
# save.image("Assignment2_Workspace.RData")

# End of Assignment 2
