# Vector Build Challenge (Groups)

## Goal: In your group, create a complete set of R vectors. Keep every vector the same length N (you choose N—recommend 3–5). 
## Use correct types (character, numeric, logical, integer, factor). Include at least one NA somewhere.

# 1) Set up: Pick a value for N (how many rows), then run:

N <- 4   # choose 3–5 (your group’s choice)


# 2) Create Vectors

# Rules for all vectors below:
# - Exactly N values per vector.
# - Use c(...) with commas between values.
# - Use straight quotes " for text.
# - Use TRUE/FALSE (unquoted) for logicals.
# - Use the L suffix for integers, e.g., 3L.
# - Use bare NA (no quotes) when you need a missing value.


## A) Numeric vectors

number_1_to_10 <- c(2, 5, NA, 9)     # choose values 1–10; include an NA somewhere if you like
numeric        <- c(12.5, -3.14, 0, 8.75)     # any real numbers (e.g., costs, counts, views)

## B) Integer vector (must use L)

integer <-  c(7L, 0L, 42L, 13L)           # keep L suffix (e.g., 1L, 2L, 3L, 4L) 

## C) Logical vector

logical <- c(TRUE, FALSE, TRUE, FALSE)  # use TRUE/FALSE only



## D) Character vectors

name                 <- c("Ava", "Luis", "Mina", "Jamal")

at_handle            <- c("@avacodes", "@luisR", "@mina_data", "@jamal.dev")

at_handle2           <- c("@ava", "@luis", "@mina", "@jamal")

self_care_activity   <- c("walk", "tea", "nap", "stretch")

item                 <- c("notebook", "pen", "headphones", "water bottle")

activity             <- c("coding", "reading", "debugging", "plotting")

top_find             <- c("shiny trick", "ggplot theme", "vector hack", "pipe tip")

location             <- c("Boise, ID", "Seattle, WA", "Austin, TX", "Madison, WI")

group_name           <- c("Vector Ninjas", "NA Hunters", "Type Titans", "R Rangers")

project              <- c("Lesson 4 demo", "Data cleanup", "Survey analysis", "Gradebook sync")

topic                <- c("factors", "joins", "tidy evaluation", "discrete random variables") #theme, idea

social_media_platform<- c("X", "Mastodon", "Instagram", "LinkedIn")

call_to_action       <- c("Click to learn", "Try the code", "Share your plot", "Follow for tips")

outcomes <- c(
  "It instantly became a viral dance challenge.",
  "The post was quickly reshared on thousands of stories.",
  "Thousands of comments asked for a full video tutorial.",
  "The post led to a surprise real-time photo collab."
)

## E) Factor vectors

emotion   <- factor(c("focused", "curious", "tired", "motivated")) # mood

retro_game    <- factor(c("Pac-Man", "Tetris", "Galaga", "Oregon Trail")) # names of games of the past

format_factor <- factor(c("blog post", "video", "podcast", "infographic")) # digital content

                        
                        
# Run this code: 
# Tiny helper to pick one random element from a vector
pick <- function(x) sample(x, 1)

# ---------- Story 1 ----------
story1 <- paste(
  "After a long week,", pick(name), "unplugged by trying", pick(activity),
  "with", pick(group_name), "at their favorite spot,", paste0(pick(location), "."),
  "Vibe rating:", paste0(pick(number_1_to_10), "."),
  "The ", pick(activity), "was going so well, but then a crucial missing", paste0(pick(item), " was discovered."),
  "Going with the flow was", ifelse(pick(logical), "reasonable.", "unreasonable."),
  "Reminding each other that ", paste0(pick(call_to_action), "."),
  "They made a plan for Episode", paste0(pick(integer), ","),
  "closing with a", paste0(pick(emotion), " mood.")
)

print(story1)
# ---------- Story 2 ----------

# We now select a single random index to pick from both vectors
selected_index <- sample(1:length(social_media_platform), 1)
selected_platform <- social_media_platform[selected_index]
platform_outcome <- platform_outcomes[selected_index]

story2 <- paste(
  "On a mission for a fashion comeback,", pick(name), "found", pick(item),
  "at", pick(location), "that screamed Y2K.",
  "They spent a total of", paste0(pick(numeric), " dollars—"),
  "but they", ifelse(pick(logical), "remembered", "forgot"), "to get a receipt!",
  "After posting a 'before' shot on", paste0(pick(selected_index), ","),
  "the post went viral", ifelse(pick(logical), "by midnight.", "by the next day."),
  "Their retro level was officially", paste0(pick(retro_game), " status,"),
  "and they immediately upcycled the item online for", paste0(pick(numeric), " dollars—"),  
  "and sold in", pick(integer), "minutes.", 
  "The community response was so strong, they had this final message for their followers:", 
  paste0(pick(call_to_action), ".")
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