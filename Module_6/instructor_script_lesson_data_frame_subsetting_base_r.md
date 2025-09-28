# Instructor Script — Lesson: Data Frame Subsetting (Base R)

> **Use this as a read‑aloud guide while you live‑code.** Each step has what to *say*, what to *type*, and what to *show/explain*. Keep your Console visible. Avoid huge printouts; use `head()`, `table()`, and `nrow()` so students can see patterns without scrolling.

---

## 0) Warm start
**Say:** Today we’ll practice *row/column subsetting* in base R using bracket syntax: `x[rows, cols]`. We’ll build tiny example data, then apply the same ideas to a realistic dataset of bird band observations. I’ll narrate exactly what I’m doing as I type.

**Tip to students:** If anything is unclear, raise your hand and I’ll pause.

---

## 1) Build Dataframes

### A. Simple dataframe (`trial_df`)
**Say:** I’ll start by creating a small vector with numbers 1–3 plus some `NA`s, then I’ll build a two‑column dataframe from it.

**Type:**
```r
set.seed(1)
trial_vec <- sample(x = c(1:3, NA, NA, NA, NA), size = 25, replace = TRUE)
trial_vec
```

**Show/Explain:** Point out you see integers and `NA`. To avoid scrolling, immediately show a quick peek and the length.
```r
head(trial_vec, 10)
length(trial_vec)
```

**Say:** Now I’ll derive a second vector that labels whether the value equals 2.

**Type:**
```r
# Example: Create a new vector trial_vec2 based on trial_vec
trial_vec2 <- ifelse(trial_vec == 2, "two", "not two")
```

**Say:** Let’s assemble the dataframe and peek at it.

**Type:**
```r
# Create a data frame with trial_vec and trial_vec2
trial_df <- data.frame(trial_vec, trial_vec2)

# Check the data frame
head(trial_df)  # first 6 rows
```

**Explain:** Read a row aloud: “Row 1 has value ___ and is labeled ‘two’/‘not two’.” Reinforce: rows are cases, columns are variables.

---

### B. Field Biology dataset (`field_sightings`)
**Say:** Next, a realistic dataset: most birds are untagged; a small number are tagged with a band color.

**Type:**
```r
set.seed(8)
Status  <- sample(c(rep("Untagged", 4168), rep("Tagged", 302)))
Band_Color <- ifelse(Status == "Untagged", "None",
                sample(c("Red", "Blue", "Green", "Yellow",
                         "Silver", "Black", "Orange",
                         "White"), length(Status), replace = TRUE))
field_sightings <- data.frame(Status, Band_Color)

# View the data (opens a spreadsheet-style viewer)
View(field_sightings)
```

**Show/Explain:** In the Viewer, point to the two columns. Note the imbalance: many `Untagged`, fewer `Tagged`. Close the Viewer.

**Optional quick checks (read one line):**
```r
dim(field_sightings)   # rows, columns
head(field_sightings)
```

---

## 2) Bracket Syntax Refresher
**Say:** Bracket subsetting uses `x[rows, cols]`. Rows and columns can be indices, names, or logical expressions. Watch a few small examples.

**Type & Explain:**
```r
field_sightings[1:3, ]          # first 3 rows, all columns
field_sightings[1:3, 1]         # first 3 rows of column 1 (as a vector)
field_sightings[1:3, c(1, 2)]   # first 3 rows of cols 1 and 2
```

**Say:** I’ll read the result—notice how adding a column index after the comma changes what we see.

---

## 3) Subsetting rows by a logical test (simple example with `trial_df`)
**Say:** Here’s the pattern we’ll use all day: build a logical test, then use it between the brackets.

**Type:** *(don’t run the big print—just show the idea as a comment)*
```r
# trial_df[ trial_df[ , "trial_vec"] == 2 , ]
```

**Say:** Instead of printing everything, I’ll store the subset and look at the head.

**Type:**
```r
direct_subset <- trial_df[ trial_df[ , "trial_vec"] == 2 , ]
head(direct_subset)
```

**Explain:** Point out which rows were kept: places where `trial_vec == 2` is `TRUE`. Rows with `1` or `3` or `NA` were not included.

---

## 4) Goal walk‑through: Isolate only the tagged birds

### Step 1 — Create the logical test
**Say:** First I create and store the logical test. I’ll *count* results instead of printing a long TRUE/FALSE list.

**Type:**
```r
logical_test <- field_sightings[ , "Status"] == "Tagged"
# Quick summary of TRUE/FALSE/NA counts:
table(logical_test, useNA = "ifany")
```

**Explain:** The count of `TRUE` should be about 302, matching how we built the data.

### Step 2 — Use the test to subset rows
**Type:**
```r
tagged_only <- field_sightings[ field_sightings[ , "Status"] == "Tagged" , ]
head(tagged_only)
```

**Say:** Let’s verify the number of rows and that all Status values are “Tagged.”

**Type & Explain:**
```r
n_tagged <- nrow(tagged_only)
print(n_tagged)                # expect 302
all(tagged_only[ , "Status"] == "Tagged")
unique(tagged_only[ , "Status"])  # should show just "Tagged"
```

---

## 5) Extraction with `which()` (dropping unknowns/`NA` positions)
**Say:** If your logical test can produce `NA`, wrapping it in `which()` returns the *row positions* where the test is definitely `TRUE`, automatically skipping `NA`.

**Type:**
```r
rows_without_na <- which(trial_df[ , "trial_vec"] == 2)
which_subset <- trial_df[rows_without_na, ]
print(which_subset)
```

**Explain:** `which()` gives positions (1, 5, 9, …) where the test is `TRUE`. `NA` rows don’t appear because they’re not `TRUE`.

**Mini‑teaching point:** `which_subset` vs `print(which_subset)`: typing an object name usually prints it in the Console; `print()` just makes that printing explicit (and is required inside certain contexts like loops or non‑last lines in R Markdown).

---

## 6) Two‑condition filters and verifying the result
**Say:** Now I’ll combine two conditions with `&`. I’m keeping only rows where `Status` is `Tagged` *and* `Band_Color` is `Blue`.

**Type:**
```r
row_idx <- which(field_sightings[ , "Status"] == "Tagged" &
                  field_sightings[ , "Band_Color"] == "Blue")
subset_blue <- field_sightings[row_idx, ]
head(subset_blue)
```

**Explain:** Read the first few rows aloud. Both conditions are satisfied. Columns are unchanged; we’ve just reduced the *rows*.

**Ask students (1–2 sentences):** What changed after subsetting? What stayed the same?

---

## 7) Selecting columns (by index or by name)
**Say:** The column position comes after the comma. I can use an index or a name.

**Type:**
```r
head(subset_blue[ , "Band_Color"])   # by name
field_sightings[1:10, "Band_Color"]  # rows 1–10, one column
```

**Explain:** We used `head()` in the first line because `subset_blue` might have many rows; in the second line, we already limited to 10 rows, so `head()` isn’t needed.

---

## 8) Selecting multiple columns after a row filter
**Say:** Common workflow: (1) compute a row index, (2) select only the columns you want.

**Type:**
```r
# 1) Row index with two conditions
row_idx <- which(
  field_sightings[ , "Status"] == "Tagged" &
  (field_sightings[ , "Band_Color"] == "Blue" |
   field_sightings[ , "Band_Color"] == "White")
)

# 2) Apply row + multi-column selection (select columns by NAME)
tagged_blue_white <- field_sightings[row_idx, c("Status", "Band_Color")]
head(tagged_blue_white)
```

**Explain:** Rows were reduced by the filter; columns were reduced to just `Status` and `Band_Color`.

**Quick verification:**
```r
all(tagged_blue_white[ , "Status"] == "Tagged")
unique(tagged_blue_white[ , "Band_Color"])  # should show Blue and/or White
nrow(tagged_blue_white)
```

---

## 9) Insertion (overwrite values safely)
**Say:** Insertion means writing values *into* a dataframe. Best practice: copy first so you don’t lose the original.

**Type:**
```r
# Copy, compute row indices, then overwrite a column subset
reintroduction <- field_sightings
indices_untagged <- which(field_sightings[ , "Status"] == "Untagged")
reintroduction[indices_untagged, "Status"] <- "Wild_Hatch"

# Verify the change
unique(reintroduction[ , "Status"])
```

**Explain:** Only the copy changed. The original `field_sightings` remains intact—this is safe, reversible workflow.

**Add a new indicator column:**
```r
reintroduction[ , "Tag_Flag"] <- ifelse(
  reintroduction[ , "Status"] == "Tagged", "Yes", "No"
)
head(reintroduction[ , c("Status", "Tag_Flag")])
```

**Explain:** This column was *inserted* by assignment into `x[rows, column] <- value`. Here `rows` are left blank to affect *all* rows.

---

## 10) Renaming columns

### Example 1 — Rename all columns at once
**Say:** We can replace the full set of column names with a new character vector of the same length.

**Type:**
```r
names(reintroduction)
colnames(reintroduction) <- c("Band_Status", "Breeding_Cohort", "Tag_Flag")
head(reintroduction)
```

**Explain:** We now have three columns with new names. `names()` and `colnames()` are synonyms for dataframes.

**Prompt:** What are two or three different ways to list column names in R? (e.g., `names(df)`, `colnames(df)`, `str(df)`, `names(df)[index]`).

---

### Example 2 — Rename specific columns by index (found via name)
**Say:** Another pattern is “find the index by name, then overwrite just that one name.”

**Type:**
```r
reintroduction2 <- field_sightings  # copy first
names(reintroduction2)[ which(names(reintroduction2) == "Status") ] <- "Band_Status"
names(reintroduction2)[ which(names(reintroduction2) == "Band_Color") ] <- "Breeding_Cohort"
head(reintroduction2)
```

**Explain:** We surgically renamed two columns and left everything else alone.

---

## 11) Close & reinforce
**Say (summary):** Today you saw the core subsetting pattern: `x[rows, cols]`, where rows/cols can be indices, names, or logical expressions. You practiced safe editing by copying before overwriting, and you verified results with quick checks like `head()`, `nrow()`, `unique()`, and `all()`.

**Exit prompt (1–2 min):** Add a memo note answering one of these:
- How did `which()` change your subset compared to a raw logical test with `NA`s?
- Show two ways to list column names and explain when each is handy.
- Explain *why* we copy before editing and give one example from today.

---

## Quick “Common Mistakes” to watch and fix live
- Using `=` instead of `==` in logical tests → **Fix:** “Double equals for comparison.”
- Forgetting the comma in `df[rows, cols]` → **Fix:** “There are always two slots: before and after the comma.”
- Misspelled column names → **Fix:** `names(df)` to confirm; copy–paste exact names.
- Selecting multiple columns without `c()` → **Fix:** `df[ , c("Status", "Band_Color")]`.
- Overwriting the original unintentionally → **Fix:** copy first: `df2 <- df`.
- Huge prints (1000s of rows) → **Fix:** prefer `head()`, `tail()`, `table()`, `nrow()`.

---

### Optional mini‑demos if time allows
- `str(field_sightings)` to summarize structure (types, lengths).
- Counting combinations: `table(field_sightings$Status, field_sightings$Band_Color)` (read one cell).

