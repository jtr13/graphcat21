
In order to get the most out of the workshop, please install the
following or update to the latest version in advance.

**ggalluvial** (0.12.3)

**scales** (1.1.1)

Next please run the following code examples to make sure the above
packages are working. The graphs shown below should appear.

``` r
library(tidyverse)
library(ggalluvial)
ggplot(as.data.frame(Titanic),
       aes(y = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age,
           fill = Survived)) +
  geom_alluvium() +
  scale_x_discrete(limits = c("Class", "Sex", "Age"))
```

![](prep2_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Don’t hesitate to contact us in advance if you have any questions:

Joyce Robbins <jtr13@columbia.edu>

Ludmila Janda <ludmila.janda@gmail.com>

best, Joyce and Ludmila
