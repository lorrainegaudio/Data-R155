############################################################
# ✅ ANSWER KEY — Practice Space Tasks 1–9 (A+ completion)
# Assumes Setup has already run:
#   library(dslabs)
#   gapminder <- dslabs::gapminder
############################################################

# Load the package and data
library(dslabs)  # use library() to load the package

gapminder <- dslabs::gapminder

########################
# Task 1 — Pick a Year
########################

# Step 1: list years
unique(gapminder$year)

# Step 2: store 2010 as target_year
target_year <- 2010

# 🗣 We use 2010 because it has the most complete data.  (student-facing note)


########################
# Task 2 — Pick Regions
########################

# Step 1: show region options
unique(gapminder$region)

# Step 2: store two regions exactly as shown
region_1 <- "Eastern Asia"
region_2 <- "Southern Asia"

# 🗣 I selected Eastern Asia and Southern Asia as my target regions because
# they contain large populations and meaningful variation in health indicators,
# making them realistic candidates for a pilot shortlist.


########################
# Task 3 — Focus the Pool
########################

# Step 1: build logical tests
is_year   <- gapminder$year == target_year
is_region <- gapminder$region %in% c(region_1, region_2)

# Step 2: combine with AND
keep <- is_year & is_region

# Step 3: subset rows with keep; keep all columns
focus_pool <- gapminder[keep, ]

# EXPLANATION (Task 3 memo):
# "%in%" checks whether each row’s region is in the set {region_1, region_2}.
# "&" requires BOTH conditions to be TRUE: the row is from target_year AND in one of the regions.
# "$" is used to reference specific columns inside the data frame (e.g., gapminder$year).

# Compare rows (focus_pool should be smaller than gapminder)
nrow(focus_pool) < nrow(gapminder)

# 🗣 focus_pool has fewer rows than gapminder because it keeps only one year and two regions.


########################
# Task 4 — Negative Indices
########################

# NOTE (important for later tasks): population is needed in Task 8.
# In dslabs::gapminder, population is typically column 6.
# So we drop columns 7–9 (gdp, continent, region) and KEEP population.

brief_sheet <- focus_pool[, -c(7:9)]

# ✅ Verify
names(brief_sheet)

# EXPLANATION (Task 4 memo):
# Negative indices DROP positions. -c(7:9) means “remove columns 7, 8, and 9.”
# Everything not listed stays.


########################
# Task 5 — Inspect Before Choosing Thresholds
########################

# Life Expectancy (a)
range(brief_sheet$life_expectancy, na.rm = TRUE)
# Example cutoff used for Task 6:
sum(brief_sheet$life_expectancy <= 70)

# Infant Mortality (b)
range(brief_sheet$infant_mortality, na.rm = TRUE)
# Example cutoff used for Task 6:
sum(brief_sheet$infant_mortality >= 35)

# Fertility (c)
range(brief_sheet$fertility, na.rm = TRUE)
# Example cutoff used for Task 6:
sum(brief_sheet$fertility >= 2)

# (If you want the A+ written lines filled in, you can record your actual outputs like:)
# 🗣 Life expectancy range: ____ to ____ years. Count with <= 70: ____.
# 🗣 Infant mortality range: ____ to ____ per 1000. Count with >= 35: ____.
# 🗣 Fertility range: ____ to ____. Count with >= 2: ____.


########################
# Task 6 — Build needs_screen with &
########################

a <- 70  # life expectancy cutoff (keep lower values)
b <- 35  # infant mortality cutoff (keep higher values)
c <- 2   # fertility cutoff (keep higher values)

needs_screen <- brief_sheet[
  brief_sheet$life_expectancy <= a &
    brief_sheet$infant_mortality >= b &
    brief_sheet$fertility >= c,
]

# ✅ Verify
nrow(needs_screen)

# EXPLANATION (Task 6 memos):
# - range() showed what values are possible, so I didn’t pick impossible cutoffs.
# - sum() showed whether a cutoff would keep a reasonable number of rows (not 0).
# - The three conditions are combined with "&" so a row must meet ALL need criteria
#   at the same time to be included.


########################
# Task 7 — | vs %in% equivalence
########################

# Step 1: OR version
A_or_B <- gapminder[
  gapminder$year == target_year &
    (gapminder$region == region_1 | gapminder$region == region_2),
]

# Step 2: %in% version
in_set <- gapminder[
  gapminder$year == target_year &
    gapminder$region %in% c(region_1, region_2),
]

# Step 3: compare row counts
nrow(A_or_B) == nrow(in_set)

# 🗣 Memo:
# "|" chains separate equality tests (region == A OR region == B).
# "%in%" tests membership in a set and is preferable when you have many categories
# because it is shorter, easier to read, and less error-prone.


########################
# Task 8 — which() + population window
########################

# Step 1: inspect population range
range(needs_screen$population, na.rm = TRUE)

# Step 2: build idx with which()
idx <- which(needs_screen$population >= 2e6 & needs_screen$population <= 5e7)

# ✅ Verify: how many matched?
length(idx)

# Step 3: subset with idx (rows) and keep all columns
shortlist <- needs_screen[idx, ]

# Step 4: compact view
shortlist[, c("country", "population", "life_expectancy", "infant_mortality", "fertility")]

# 🗣 Memo:
# which() returns the integer row positions where the condition is TRUE.
# Storing idx is useful because you can reuse the same row positions for multiple subsets/views.


########################
# Task 9 — Explain -, !, !=
########################

# 🗣 Explanation:
# - Negative indexing (e.g., x[-c(1,2)]) DROPS positions by number (rows/columns by location).
# - "!=" means “not equal to” and creates a TRUE/FALSE test (e.g., df$year != 2010).
# - "!" is logical NOT: it flips TRUE/FALSE and can negate any logical test
#   (e.g., !(df$year == 2010) is equivalent to df$year != 2010).