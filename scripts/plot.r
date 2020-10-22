library(tidyverse)
library(ggplot2)

args <- commandArgs()


csv <- read_csv(args[6])
p <- ggplot(csv) + 
  geom_line( mapping = aes(x = day, y = size)) +
  theme_grey(base_size=15)
png(filename="/tmp/test.png")
print(p)
dev.off()
