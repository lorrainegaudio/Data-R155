# Intro to R – Assignment 1 (Completed template)
# -------------------------------------------------------------------
# GRADING KEY (rubric overview)
# Points | Criterion                               | Common Pain Point                          | Grader Tip
# .5      | Tasks 1‑3 numeric objects               | '=' instead of '<-' ; hard‑coded numbers   | Confirm total_revenue uses objects
# .5      | Tasks 4‑6 character + paste()           | missing quotes ; paste default sep = ""    | sentence must be "yellow banana"
# .5      | Task 7 class() + save.image()           | wrong directory ; thinking class() mutates | Check workspace file exists
# .5      | Task 8 new object + comment             | reuses one skill only ; no comment         | Look for combo + meaningful comment
# .5      | Technical quality & submission          | script errors ; missing files              | Source entire script, verify uploads
# -------------------------------------------------------------------
# Directions for graders: run top‑to‑bottom; inspect Environment pane;
# compare against notes above.

# ---------- Task 1: Numeric objects ----------
# 📌 Grading Key (Tasks 1‑3)
# Pain: students often use '=' or re‑type 62*100 directly.
# Tip: object names must be used; code runs error‑free.
items_sold <- 62      # numeric

# Task 2
unit_price <- 100     # numeric

# Task 3
total_revenue <- items_sold * unit_price  # should equal 6200

# ---------- Task 4: Character objects ----------
# 📌 Grading Key (Tasks 4‑6)
# Pain: missing quotes or forgetting space in paste().
# Tip: resulting sentence must read "yellow banana" exactly.
first_word  <- "yellow"
second_word <- "banana"

# Task 6
sentence <- paste(first_word, second_word)  # default sep=" "

# ---------- Task 7: Inspect & save ----------
# 📌 Grading Key (Task 7)
# Pain: not setting working directory; expecting class() to change type.
# Tip: Ensure class(total_revenue) == "numeric" and workspace file appears.
class(total_revenue)  # numeric
class(sentence)       # character

save.image("Assignment1_Workspace.RData")  # adjust path if needed

# ---------- Task 8: Create‑your‑own ----------
# 📌 Grading Key (Task 8)
# Pain: only uses one prior skill or lacks a clarifying comment.
# Tip: Should combine at least two earlier skills + comment.
my_object <- paste(sentence, total_revenue)  # combines string & numeric
# Comment: my_object stores "yellow banana 6200" as one character string.

# ---------- End of script ----------
# 📌 Technical Quality Check
# Pain: placeholders left, objects missing, errors on Source.
# Tip: Source now; Environment should list seven objects; no console errors.
