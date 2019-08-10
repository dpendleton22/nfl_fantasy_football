library(tidyr)
library(dplyr)
library(xlsx)
library(digest)

data <- read.xlsx("2018_NFL_RUSHING.xlsx", 1)

colnames(data) <- as.character(unlist(data[1,]))

data <- data[-1,]

data <- data %>% 
  separate(Player, c("Player", "Abbreviation"), sep = "\\|")

data <- data %>% 
  separate(Player, c("Player", "Pro_Bowl"), sep = "\\*")

data$Pro_Bowl[!is.na(data$Pro_Bowl)] <- 1
data$Pro_Bowl[is.na(data$Pro_Bowl)] <- 0

data$Player_ID <- sapply(data$Player, function(x) {digest(x, algo = "sha1")})

data <- data[which(as.numeric(data$`Y/G`) > 20),]

View(data)

write.csv(data, "2018_NFL_RUSHING_cleaned.csv")