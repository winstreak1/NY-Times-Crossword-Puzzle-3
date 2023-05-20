library(tidyverse)
library(lubridate)
library(textclean)
library(stringi)
library(ggplot2)
library(dplyr)

#Data Cleaning


CROSSWORD2 <- read.csv("clues.csv", stringsAsFactors = FALSE)

CROSSWORD2.TABLE <- list()
hist(CROSSWORD2$year[CROSSWORD2$year>1900], main="Quantity of Cells Used in Dataset by Year", horizontal=FALSE, xlab="Year", ylab="Quantity", col= c("#5BD1E2","#5B57E2","#2571E2"))

hist(CROSSWORD2$year[CROSSWORD2$year>1995], main="Quantity of Cells Used in Dataset by Year", horizontal=FALSE, xlab="Year", ylab="Quantity", col= c("#5BD1E2","#5B57E2","#2571E2"))
CROSSWORD2.COMMON <- CROSSWORD2$answer[CROSSWORD2$year==2000]
CROSSWORD2.TABLE[[1]] <- table(CROSSWORD2.COMMON)
CROSSWORD2.TABLE[[1]] <- data.frame(CROSSWORD2.TABLE[[1]], stringsAsFactors = FALSE)
CROSSWORD2.TABLE[[1]]$CROSSWORD2.COMMON <- as.character(CROSSWORD2.TABLE[[1]]$CROSSWORD2.COMMON)
CROSSWORD2.TABLE[[1]] <- arrange(CROSSWORD2.TABLE[[1]], desc(Freq))
#COPY
CROSSWORD2.COMMON <- CROSSWORD2$answer[CROSSWORD2$year==2001]
CROSSWORD2.TABLE[[2]] <- table(CROSSWORD2.COMMON)
CROSSWORD2.TABLE[[2]] <- data.frame(CROSSWORD2.TABLE[[2]], stringsAsFactors = FALSE)
CROSSWORD2.TABLE[[2]]$CROSSWORD2.COMMON <- as.character(CROSSWORD2.TABLE[[2]]$CROSSWORD2.COMMON)
CROSSWORD2.TABLE[[2]] <- arrange(CROSSWORD2.TABLE[[2]], desc(Freq))

#Placed Limits on Range of words
CROSSWORD2.COMMON.WORDS <- rbind(CROSSWORD2.TABLE[[1]][1:20,],CROSSWORD2.TABLE[[2]][1:20,])

WORDS <- unique(CROSSWORD2.COMMON.WORDS$CROSSWORD2.COMMON[CROSSWORD2.COMMON.WORDS$CROSSWORD2.COMMON!=""])
WORDS <- as.character(WORDS)

COMPOSITE.2000 <- CROSSWORD2$answer[CROSSWORD2$year==2000]
COMPOSITE.2000 <- COMPOSITE.2000[COMPOSITE.2000 %in% WORDS]
COMPOSITE.2000 <- table(COMPOSITE.2000)
COMPOSITE.2000 <- data.frame(COMPOSITE.2000)
COMPOSITE.2000$COMPOSITE.2000 <- as.character(COMPOSITE.2000$COMPOSITE.2000)
COMPOSITE.2000 <- arrange(COMPOSITE.2000, desc(COMPOSITE.2000))

#Barplot 1
barplot(COMPOSITE.2000$Freq, las=1, horiz = TRUE, names.arg = COMPOSITE.2000$COMPOSITE.2000, col= c("#5BD1E2","#5B57E2","#2571E2"), main="2000 Top 20 Words Used in Crosswords", horizontal=FALSE, xlab="Occurrence", ylab="Word", xlim=c(0,60), mgp=c(3,.5,0))

COMPOSITE.2001 <- CROSSWORD2$answer[CROSSWORD2$year==2001]
COMPOSITE.2001 <- COMPOSITE.2001[COMPOSITE.2001 %in% WORDS]
COMPOSITE.2001 <- table(COMPOSITE.2001)
COMPOSITE.2001 <- data.frame(COMPOSITE.2001)
COMPOSITE.2001$COMPOSITE.2001 <- as.character(COMPOSITE.2001$COMPOSITE.2001)
COMPOSITE.2001 <- arrange(COMPOSITE.2001, desc(COMPOSITE.2001))

#Barplot 2
barplot(COMPOSITE.2001$Freq, las=1, horiz = TRUE, names.arg = COMPOSITE.2001$COMPOSITE.2001, col= c("#133ADE","#813ADE","#ED3ADE"), main="2001 Top 20 Words Used in Crosswords", horizontal=FALSE, xlab="Occurrence", ylab="Word", xlim=c(0,60),mgp=c(3,.5,0))

#Placed Limits on Range of words
CROSSWORD2.COMMON.WORDS <- rbind(CROSSWORD2.TABLE[[1]][1:100,],CROSSWORD2.TABLE[[2]][1:20,])

WORDS <- unique(CROSSWORD2.COMMON.WORDS$CROSSWORD2.COMMON[CROSSWORD2.COMMON.WORDS$CROSSWORD2.COMMON!=""])
WORDS <- as.character(WORDS)

COMPOSITE.2000 <- CROSSWORD2$answer[CROSSWORD2$year==1995:2019]
COMPOSITE.2000 <- COMPOSITE.2000[COMPOSITE.2000 %in% WORDS]
COMPOSITE.2000 <- table(COMPOSITE.2000)
COMPOSITE.2000 <- data.frame(COMPOSITE.2000)
COMPOSITE.2000$COMPOSITE.2000 <- as.character(COMPOSITE.2000$COMPOSITE.2000)
#COMPOSITE.2000 <- arrange(COMPOSITE.2000, desc(COMPOSITE.2000))

#Barplot 1
par(cex.axis=0.5)
barplot(COMPOSITE.2000$Freq, las=1, horiz = FALSE, names.arg = COMPOSITE.2000$COMPOSITE.2000, 
        col= c("#5BD1E2","#5B57E2","#2571E2"), main="1995-2019 Top 100 Words Used in Crosswords", 
         ylab="Occurrence", xlab="Word", xlim=c(0,130), mgp=c(3,.5,0), las=2)
