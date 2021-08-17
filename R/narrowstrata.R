library(tidyverse)
library(ggalluvial)
ggplot(as.data.frame(Titanic),
       aes(y = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age, axis4 = Survived)) +
  geom_stratum(width = .1) +
  geom_flow(width = .1) +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), nudge_x = .1, hjust = 0) +
  scale_x_discrete(limits = c("Class", "Sex", "Age", "Survived"))
