# Vector Build Challenge (Groups)

## Goal: In your group, create a complete set of R vectors. Keep every vector the same length N (you choose N—recommend 3–5). 
## Use correct types (character, numeric, logical, integer, factor). Include at least one NA somewhere.

# 1) Set up: Pick a value for N (how many rows), then run:

N <- 4   # Number of people in your group

pick <- function(x) sample(x, 1)

# 2) Create Vectors

# Rules for all vectors below:
# - Exactly N values per vector.
# - Use c(...) with commas between values.
# - Use straight quotes " for text.
# - Use TRUE/FALSE (unquoted) for logicals.
# - Use the L suffix for integers, e.g., 3L.
# - Use bare NA (no quotes) when you need a missing value.


## A) Numeric vectors

number_1_to_10 <- c(  ,  ,  ,  )     # choose values 1–10; include an NA somewhere if you like
numeric        <- c(  ,  ,  ,  )     # any real numbers (e.g., costs, counts, views)

## B) Integer vector (must use L)

integer <-  c(  ,  ,  ,  )           # keep L suffix (e.g., 1L, 2L, 3L, 4L) 

## C) Logical vector

logical <- c(  ,  ,  ,  )  # use TRUE/FALSE only



## D) Character vectors

name                 <- c("...", "...", "...", "...")

at_handle            <- c("...", "...", "...", "...")

at_handle2           <- c("...", "...", "...", "...")

self_care_activity   <- c("...", "...", "...", "...")

item                 <- c("...", "...", "...", "...")

activity             <- c("...", "...", "...", "...")

top_find             <- c("...", "...", "...", "...")

location             <- c("...", "...", "...", "...")  # any place

group_name           <- c("...", "...", "...", "...")

project              <- c("...", "...", "...", "...")

topic                <- c("...", "...", "...", "...") #theme, idea

social_media_platform<- c("...", "...", "...", "...")

call_to_action       <- c("...", "...", "...", "...") # phrase

mood_factor   <- c("...", "...", "...", "...") # mood

retro_game    <- c("...", "...", "...", "...") # names of games of the past

format_factor <- c("...", "...", "...", "...") # digital content
                        
# 3) “Inspecting Vectors”

## Verify Structure, type, length with length(), class(), str(). Write one sentence explaining what str() shows for any one vector.

# 4) Sub-setting practice

# Position subsets
first_two_names <- ________
last_name       <- ________

# Logical test subsets
nonneg_numeric  <- _____________________   # keep values ≥ 0
long_names      <- _____________________    # names with >4 characters

# 5) Create a Mini Dataframe

Build a tiny table you can reference as “credits” under the stories.

people <- data.frame(
  name = name,
  handle = at_handle,
  likes_it = logical,
  score = number_1_to_10,
  ep = integer
)
str(people)

                        
# Run all the code below to read your Mad Libs: 

# ---------- Story 1 ----------
story1 <- paste(
  "After a long week,", pick(name), "unplugged by trying", pick(self_care_activity),
  "with", pick(group_name), "at their favorite spot,", paste0(pick(location), "."),
  "Vibe rating:", paste0(pick(number_1_to_10), "."),
  "The ", pick(activity), "was going so well, but then a crucial missing", paste0(pick(item), " was discovered."),
  "Going with the flow was", ifelse(pick(logical), "reasonable.", "unreasonable."),
  "They made a plan for Episode", paste0(pick(integer), ","),
  "closing with a", paste0(pick(mood_factor), " mood.")
)

print(story1)
# ---------- Story 2 ----------
story2 <- paste(
  "On a mission for a fashion comeback,", pick(name), "found", pick(item),
  "at", pick(location), "that screamed Y2K.",
  "They spent a total of", paste0(pick(numeric), " dollars—"),
  "but they", ifelse(pick(logical), "remembered", "forgot"), "to get a receipt!",
  "After posting a 'before' shot on", paste0(pick(social_media_platform), ","),
  "the post went viral", ifelse(pick(logical), "by midnight.", "by the next day."),
  "Their retro level was officially", paste0(pick(retro_game), " status,"),
  "and they immediately scheduled Drop", pick(integer),
  "to sell the upcycled item online."
)
print(story2)

# ---------- Story 3 ----------
story3 <- paste(
  "The internet went wild when", pick(at_handle), "dueted with", pick(at_handle2),
  "about the complex topic of", paste0(pick(topic), "."),
  "Views hit an unbelievable", pick(numeric), "in the first hour,",
  "and the comments were", paste0(ifelse(pick(logical), "mostly positive", "mixed and constructive"), "."),
  "The unique", pick(format_factor), "format of the video perfectly carried the episode, making it an instant classic.",
  "Episode", pick(integer), "ended with a direct", paste0(pick(call_to_action), ","),
  "leaving viewers excited for the next video."
)

print(story3)

# ---------- Story 4 ----------
story4 <- paste(
  "The", pick(group_name), "crew planned their next", pick(project),
  "to tackle the local park cleanup at", paste0(pick(location), "."),
  "After an hour, they had filled", pick(integer), "trash bags with", pick(item), 
  "s, but their real find was a perfectly intact", paste0(pick(top_find), "."),
  "Survey", pick(integer),
  "logs noted this unusual discovery, which helped them better understand", pick(topic),
  "As a final", paste0(pick(activity), "activity,"),
  "they sorted the items for recycling."
)
print(story4)