##################################################
# Title: "Make Shots Charts Script"
# Description: "script to create shot charts"
# Input: "nba-court.jpg, shots-data.csv"
# Output: "shot charts (pdf and png)"
##################################################

library(jpeg)
library(grid)
library(ggplot2)

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

column_types <- c("factor", "factor", "factor", "factor", "factor", "integer", "integer", "factor", "factor", "factor", "integer", "factor", "integer", "integer", "factor", "integer")
player_data <- read.csv(file = "../data/shots-data.csv", colClasses = column_types, row.names = 1)

iguodala_data <- player_data[player_data$name == 'Andre Iguodala', ]
iguodala_plot <- ggplot(data = iguodala_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
ggsave(filename = "../images/andre-iguodala-shot-chart.pdf", plot = iguodala_plot, width = 6.5, height = 5, units = "in")

green_data <- player_data[player_data$name == 'Draymond Green', ]
green_plot <- ggplot(data = green_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
ggsave(filename = "../images/draymond-green-shot-chart.pdf", plot = iguodala_plot, width = 6.5, height = 5, units = "in")

durant_data <- player_data[player_data$name == 'Kevin Durant', ]
durant_plot <- ggplot(data = durant_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
ggsave(filename = "../images/kevin-durant-shot-chart.pdf", plot = iguodala_plot, width = 6.5, height = 5, units = "in")

thompson_data <- player_data[player_data$name == 'Klay Thompson', ]
thompson_plot <- ggplot(data = thompson_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
ggsave(filename = "../images/klay-thompson-shot-chart.pdf", plot = iguodala_plot, width = 6.5, height = 5, units = "in")

curry_data <- player_data[player_data$name == 'Stephen Curry', ]
curry_plot <- ggplot(data = curry_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
ggsave(filename = "../images/stephen-curry-shot-chart.pdf", plot = iguodala_plot, width = 6.5, height = 5, units = "in")

shot_charts <- ggplot(data = player_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(~ name)
ggsave(filename = "../images/gsw-shot-charts.pdf", plot = iguodala_plot, width = 8, height = 7, units = "in")

png(filename = "../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 1000)
ggplot(data = player_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(~ name)
dev.off()