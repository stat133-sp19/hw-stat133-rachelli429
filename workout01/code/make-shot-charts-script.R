##################################################
# Title: "Make Shots Charts Script"
# Description: "script to create shot charts"
# Input: ""
# Output: ""
##################################################

install.packages(c("jpeg", "grid" , "ggplot2"))
library(jpeg)
library(grid)
library(ggplot2)

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

col_types <- c("factor", "factor", "factor", "factor", "integer", "integer", "factor", "factor", "factor", "integer", "factor", "integer", "integer")
player_data <- read.csv(file = "../data/shots-data.csv", colClasses = col_types)

iguodala_data <- player_data[name == 'Andre Iguodala', ]

pdf(filename = "../images/andro-iguodala-shot-chart.pdf")
ggplot(data = iguodala_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)')
dev.off()