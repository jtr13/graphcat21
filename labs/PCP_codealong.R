library(tidyverse)
library(GGally)
library(plotly)

library(palmerpenguins)
str(penguins)
head(penguins)

# scatterplot matrix

colors3 <- c("orange","cyan","blue")

lattice::splom(penguins[,3:6], cex = .5, pch = 16,
               col = colors3[penguins$species],
               key = list(space="bottom",
                          points=list(pch = 16, col=colors3),
                          text=list(levels(penguins$species))))


ggparcoord(penguins)

# numeric columns only
ggparcoord(penguins, columns = 3:6)

# correlations
ggparcoord(penguins, columns = 3:6, alphaLines = .3)

# clustering
ggparcoord(penguins, columns = 3:6, alphaLines = .3, groupColumn = 1)

ggparcoord(penguins, columns = 3:6, alphaLines = .3,
           groupColumn = 1, splineFactor = 10)






df <- read_csv("data/example.csv")

head(df)



# Back to original data frame
ggparcoord(df[-1], scale = "globalminmax")

df$group <- c(rep("top 6", 6), rep("other", 37))


g <- ggparcoord(df, columns = 2:7, scale = "globalminmax",
                groupColumn = 8, alphaLines = .5) +
  scale_color_manual(values = c('#d95f02','#1b9e77'),
                     guide = guide_legend(reverse = TRUE)) +
  scale_y_continuous(breaks = seq(0, 100, 10))
ggplotly(g)

ggparcoord(df, columns = 2:7, scale="globalminmax",
           groupColumn = 8, alphaLines = .5) +
  scale_color_manual(values = c('#d95f02','#1b9e77'),
                     guide = guide_legend(reverse = TRUE)) +
  scale_y_continuous(breaks = seq(0, 100, 10))





# build it yourself
tidy_df <- df %>% pivot_longer(-`Variable Name`, names_to = "model", values_to = "percent")

g <- ggplot(tidy_df, aes(x = model, y = percent, group = `Variable Name`)) +
  geom_line()

g

g + geom_text(data = df[,1:2], aes(x = .8, y = `Model A`, label = `Variable Name`))

plotly::ggplotly(g)
