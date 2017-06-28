source('configuration.R')

INSTACART_DATA_DIR<-"/home/USERS/artur.palomino/sbartek/big_data_with_R/instacart_data/"
  
FOOTBALL_DATA_DIR<-"/home/USERS/artur.palomino/sbartek/big_data_with_R/football_data/"

DATA_DIR<-"/home/USERS/artur.palomino/sbartek/big_data_with_R/data/"

zip_files <- list.files(path = INSTACART_DATA_DIR, pattern = "*.zip")
for (ifile in zip_files) {
  unzip(file.path(INSTACART_DATA_DIR, ifile), exdir = DATA_DIR)
}

## https://www.kaggle.com/hugomathien/soccer
ffile <- list.files(path = FOOTBALL_DATA_DIR, pattern = "*.zip")[1]
unzip(file.path(FOOTBALL_DATA_DIR, ffile), exdir = DATA_DIR)

setwd("/home/USERS/artur.palomino/sbartek/big_data_with_R/arturo_palomino")
getwd()
dir()
