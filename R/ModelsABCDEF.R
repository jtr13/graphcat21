library(tidyverse)
library(GGally)
library(plotly)
df <- read_csv("../data/example.csv")
df$group <- c(rep("top 6", 6), rep("other", 37))
g <- ggparcoord(df, columns = 2:7, scale = "globalminmax",
                groupColumn = 8, alphaLines = .5) +
  scale_color_manual(values = c('#d95f02','#1b9e77'),
                     guide = guide_legend(reverse = TRUE)) +
  scale_y_continuous(breaks = seq(0, 100, 10))
ggplotly(g)
