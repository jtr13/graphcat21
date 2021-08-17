library(tidyverse)
library(GGally)
library(plotly)
df <- read_csv("data/example.csv")

tidy_df <- df %>% pivot_longer(-`Variable Name`, names_to = "model", values_to = "percent")

g <- ggplot(tidy_df, aes(x = model, y = percent, group = `Variable Name`)) +
  geom_line()

g

g + geom_text(data = df[,1:2], aes(x = .8, y = `Model A`, label = `Variable Name`))

plotly::ggplotly(g)

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

library(palmerpenguins)
str(penguins)
ggparcoord(penguins)
ggparcoord(penguins, columns = 3:6)
ggparcoord(penguins, columns = 3:6, alphaLines = .3)
ggparcoord(penguins, columns = 3:6, alphaLines = .3, groupColumn = 1)
ggparcoord(penguins, columns = 3:6, alphaLines = .3, groupColumn = 1,
           splineFactor = 10)

colors3 <- c("orange","cyan","blue")

lattice::splom(penguins[,3:6], cex = .5, pch = 16,
               col = colors3[penguins$species],
               key = list(space="bottom",
                          points=list(pch = 16, col=colors3),
                          text=list(levels(penguins$species))))

pca <- prcomp(penguins[complete.cases(penguins),3:6], scale. = TRUE)
biplot(pca)

ggplot(cbind(penguins_complete, pca$x),
       aes(PC1, PC2, color = species, fill = species)) +
  stat_ellipse(geom="polygon", color = "grey20", alpha = .2) +
  geom_point(shape = 21, color = "black") +
  ggtitle("PCA plot")

ggplot(penguins_complete, aes(bill_length_mm, bill_depth_mm, color = species)) + geom_point() + stat_ellipse(geom="polygon", alpha = .2, aes(fill = species)) + ggtitle("")
