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

numeric        <- c(  ,  ,  ,  )     # any real numbers

## B) Integer vector (must use L)

integer <-  c(  ,  ,  ,  )           # keep L suffix (e.g., 1L, 2L, 3L, 4L) 

## C) Logical vector

logical <- c(  ,  ,  ,  )  # use TRUE/FALSE only



## D) Character vectors

name                 <- c("...", "...", "...", "...")

at_handle            <- c("...", "...", "...", "...")

item                 <- c("...", "...", "...", "...")

activity             <- c("...", "...", "...", "...")

location             <- c("...", "...", "...", "...")  # any place

group_name           <- c("...", "...", "...", "...")

call_to_action       <- c("...", "...", "...", "...") # phrase

outcomes       <- c("...", "...", "...", "...") # phrase

emotion   <- c("...", "...", "...", "...") # mood

retro_game    <- c("...", "...", "...", "...") # names of games of the past

# Factor Class

social_media_platform<- factor(c("...", "...", "...", "..."),
                               levels = c("...", "...", "...", "..."))

                        
# 3) “Inspecting Vectors”

## Verify Structure, type, length with length(), class(), str(). Write one sentence explaining what str() shows for any one vector.



# 5) Create a Mini Dataframe

# Build a tiny table you can reference as “credits” under the stories.

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
  "After a long week,", pick(name), "unplugged by trying", pick(activity),
  "with", pick(group_name), "at their favorite spot,", paste0(pick(location), "."),
  "Vibe rating:", paste0(pick(number_1_to_10), "."),
  "The ", pick(activity), "was going so well, but then a crucial missing", paste0(pick(item), " was discovered."),
  "Going with the flow was", ifelse(pick(logical), "reasonable.", "unreasonable."),
  "Reminding each other", paste0(pick(call_to_action), "."),
  "They made a plan for Episode", paste0(pick(integer), ","),
  "closing with a", paste0(pick(emotion), " mood.")
)

print(story1)
# ---------- Story 2 ----------

# We now select a single random index to pick from both vectors
selected_index <- sample(1:length(social_media_platform), 1)
selected_platform <- social_media_platform[selected_index]
outcome <- outcomes[selected_index]

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

