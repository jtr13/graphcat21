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
ggparcoord(penguins, columns = c(3, 5, 4, 6), alphaLines = .3)

# clustering
ggparcoord(penguins, columns = 3:6, alphaLines = .3, groupColumn = 1)

ggparcoord(penguins[1:5,], columns = 3:6, alphaLines = .3,groupColumn = 1, splineFactor =10)



df <- read_csv("data/example.csv")

head(df)



# Back to original data frame
ggparcoord(df[-1], scale = "globalminmax")

df$var <- c(paste0("X", 1:6), rep("other", 37))

ggparcoord(df, columns = 2:7, scale = "globalminmax",
           groupColumn = 8) +
  scale_color_manual(values = c("#FCB711", "#F37021",
                                "#CC004C", "#6460AA",
                                "#0089D0", "#0DB14B", "grey70") ) +
  scale_y_continuous(breaks = seq(0, 100, 10))

df$var <- fct_relevel(df$var, "other", after = Inf)

head(df)


ggparcoord(df, columns = 2:7, scale = "globalminmax",
                groupColumn = 8) +
  scale_color_manual(values = c("#FCB711", "#F37021",
                                "#CC004C", "#6460AA",
                                "#0089D0", "#0DB14B", "grey70") ) +
  scale_y_continuous(breaks = seq(0, 100, 10))


ggplotly(g)

ggparcoord(df, columns = 2:7, scale="globalminmax",
           groupColumn = 8, alphaLines = .5) +
  scale_color_manual(values = c('#d95f02','#1b9e77'),
                     guide = guide_legend(reverse = TRUE)) +
  scale_y_continuous(breaks = seq(0, 100, 10))





# build it yourself
tidy_df <- df %>% pivot_longer(-c(`Variable Name`, var), names_to = "model", values_to = "percent")

tidy_top6 <- tidy_df %>% filter(var != "other")
tidy_other <- tidy_df %>% filter(var == "other")

ggplot(tidy_other, aes(x = model, y = percent, group = `Variable Name`)) +
  geom_line(color = "grey70") +
  geom_line(data = tidy_top6, aes(group = var, color = var), lwd = 1.25) +
  scale_color_manual(values = c("#FCB711", "#F37021",
                                "#CC004C", "#6460AA",
                                "#0089D0", "#0DB14B", "grey70") ) +
  scale_y_continuous(breaks = seq(0, 100, 10))


g + ggrepel::geom_text_repel(data = df[,1:2], aes(x = .8, y = `Model A`, label = `Variable Name`))

plotly::ggplotly(g)
