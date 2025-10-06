

# Load necessary libraries
library(tidyverse)

# Load the dataset
songs <- read.csv("youtube_songs.csv", stringsAsFactors = FALSE)

# Inspect the first few rows
head(songs)

# Top 10 most-viewed songs
top_songs <- songs %>%
  arrange(desc(view_count)) %>%
  head(10)

# Wrap long titles at 30 characters
top_songs$title_wrapped <- str_wrap(top_songs$title, width = 30)

# Bar Chart
ggplot(top_songs, aes(x = reorder(title_wrapped, view_count), y = view_count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Top 10 Most Viewed YouTube Songs",
       x = "Song Title",
       y = "View Count") +
  theme_minimal(base_size = 10)  # Reduce font size for readability