# Vibe Coding Demo

# Vibe coding is like watching a mentor work: you describe the vibe of what you want, 
# and the assistant produces code. 

# That’s great for inspiration, but copy-pasting without thinking can flip the control: 
# now the AI is in control, not you.

# Imagine I asked an AI: ‘make a fancy Taylor Swift list with nested pieces and summaries.’ 

# --- Hypothetical "AI vibe" output ---
# uses packages, functions, pipes, and concepts we haven't learned

# purrr/stringr/tibble/dplyr would be required here
make_artist <- function(name, albums, years) {
  tibble::tibble(album = albums, year = years) |>
    dplyr::mutate(since_debut = year - min(year))
}

ts_tbl <- make_artist(
  "Taylor Swift",
  c("Fearless","Red","1989","folklore","Midnights"),
  c(2008, 2012, 2014, 2020, 2022)
)

ts_list_fancy <- list(
  meta = list(artist = "Taylor Swift", grammy_aoty = 4L),
  discography = split(ts_tbl, ts_tbl$since_debut >= 6),
  shout = purrr::map(ts_tbl$album, ~ stringr::str_to_upper(.x))
)

ts_list_fancy

# How to stay in control

# 1 Set constraints

## "base R only—no packages, no functions"

## Ask AI for a template

topic_name <- "Your Topic"
items <- c("item1","item2","item3")
numbers <- c(1, 2, 3)               # any numeric facts
flags <- c(TRUE, FALSE, TRUE)        # yes/no facts

highlight <- list(title = "favorite thing", why = "short reason")

my_list <- list(
  name = topic_name,
  items = items,
  numbers = numbers,
  flags = flags,
  highlight = highlight
)

## “explain what each line does.”

# 2 Ask questions

# What is happening with highlight?

# What are example use cases for lists?
## Follow up with questions about how you might apply it to your own interests.

# 3 Write original code in your assignment and make sure you understand it
## Explain your code with notations and memos


# Human-centered mindset: you set constraints, ask questions, and you write your own code