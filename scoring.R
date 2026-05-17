library(readr)
library(dplyr)

# Read data
votes <- read_csv("votes.csv", show_col_types = FALSE)

# Calculate scores and aggregate by book
results <- votes %>%
  mutate(score = 20 + (11 - position)) %>%   # 30 for 1st, 21 for 10th
  group_by(title, author) %>%
  summarise(score = sum(score), .groups = "drop") %>%
  arrange(desc(score))

# Write output
write_csv(results, "my_scores.csv")
