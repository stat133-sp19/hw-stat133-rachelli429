##################################################
# Title: "Make Shots Data Script"
# Description: "script to create csv data flie shot-data.csv that contains the variables for data visualization"
# Input: "5 csv files: andre-iguodala, draymond-green, kevin-durant, klay-thompson, stephen-curry"
# Output: "shot.data.csv file"
##################################################

col_types <- c("factor", "factor", "factor", "factor", "integer", "integer", "factor", "factor", "factor", "integer", "factor", "integer", "integer")
iguodala <- read.csv(file = "../data/andre-iguodala.csv", colClasses = col_types)
green <- read.csv(file = "../data/draymond-green.csv", colClasses = col_types)
durant <- read.csv(file = "../data/kevin-durant.csv", colClasses = col_types)
thompson <- read.csv(file = "../data/klay-thompson.csv", colClasses = col_types)
curry <- read.csv(file = "../data/stephen-curry.csv", colClasses = col_types)

iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"
curry$name <- "Stephen Curry"

iguodala$shot_made_flag <- as.character(iguodala$shot_made_flag)
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag <- as.factor(iguodala$shot_made_flag)

iguodala$period <- as.integer(iguodala$period)
iguodala$minutes <- iguodala$period * 12 - iguodala$minutes_remaining
iguodala$period <- as.factor(iguodala$period)

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

green$shot_made_flag <- as.character(green$shot_made_flag)
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag <- as.factor(green$shot_made_flag)

green$period <- as.integer(green$period)
green$minutes <- green$period * 12 - green$minutes_remaining
green$period <- as.factor(green$period)

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

durant$shot_made_flag <- as.character(durant$shot_made_flag)
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag <- as.factor(durant$shot_made_flag)

durant$period <- as.integer(durant$period)
durant$minutes <- durant$period * 12 - durant$minutes_remaining
durant$period <- as.factor(durant$period)

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

thompson$shot_made_flag <- as.character(thompson$shot_made_flag)
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag <- as.factor(thompson$shot_made_flag)

thompson$period <- as.integer(thompson$period)
thompson$minutes <- thompson$period * 12 - thompson$minutes_remaining
thompson$period <- as.factor(thompson$period)

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

curry$shot_made_flag <- as.character(curry$shot_made_flag)
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag <- as.factor(curry$shot_made_flag)

curry$period <- as.integer(curry$period)
curry$minutes <- curry$period * 12 - curry$minutes_remaining
curry$period <- as.factor(curry$period)

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

big_df <- rbind(iguodala, green, durant, thompson, curry)
big_df$name <- as.factor(big_df$name)

write.csv(
  x = big_df,
  file = "../data/shots-data.csv"
)

sink(file = "../output/shots-data-summary.txt")
summary(big_df)
sink()

