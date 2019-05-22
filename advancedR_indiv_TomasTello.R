source('scripts/load_libraries.R')

raw_data_train <-fread('data/house_price_train.csv', stringsAsFactors = F)
raw_data_test <-fread('data/house_price_test.csv', stringsAsFactors = F)

str(raw_data_train)


##### Data cleaning and Preparation ######

raw_data_train$date <- as.Date(raw_data_train$date, "%m/%d/%Y")
raw_data_train$zipcode <- as.factor(raw_data_train$zipcode)

raw_data_train[ , names(raw_data_train)[sapply(raw_data_train, is.integer)]:=
             lapply(.SD,as.numeric),.SDcols = 
             names(raw_data_train)[sapply(raw_data_train, is.integer)]]

str(raw_data_train)

#Detect Missing values
sum(is.na(raw_data_train))

#Variable analysis
summary(raw_data_train)

##### Exploratory Data Analysis ######

#plot missing values
plot_missing(raw_data_train)

#Variable analysis
plot_density(raw_data_train[,-c('id')])
plot_boxplot(raw_data_train[,-c('id')], by = "price")
plot_correlation(raw_data_train[,-c('id')])



