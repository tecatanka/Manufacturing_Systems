# TIME SERIES DECOMPOSITION AND FORECASTING IN R

#READ DATA FILE

passengers<-international.airline.passengers

# VERIFYING NA (Not Available) VALUES

print ("Row and Col positions of NA values")
which(is.na(passengers), arr.ind=TRUE)

#ELIMINATING ROWS WITH NA IN DATAFRAME

passengers<-na.omit(passengers)

# CREATING A COLUMN CALLED Date

library(lubridate)

#https://lubridate.tidyverse.org/reference/ymd.html

passengers$Date<-ym(passengers$Month) #Create a column data as date type

str(passengers) # Check the type of the passengers columns

# CONVERT DATA TO A TIME SERIES

Passenger_ts<-ts(passengers$Passengers_Thousands,frequency = 12, start=c(1949,1))
Passenger_ts

# DECOMPOSITION OF TIME SERIES

Components_passenger_ts<-decompose(Passenger_ts)
plot(Components_passenger_ts)

# PERFORM TIME SERIES FORECASTING WITH HOLTS_WINTER METHOD

library(forecast)

Pass_Model<-HoltWinters(Passenger_ts, seasonal="multiplicative")

Pass_for<-forecast(Pass_Model, h=24, level=c(80,95))

# Visualization of results

plot(Pass_for)
lines(Pass_for$fitted, lty=2, col="purple")

# Forecast data
Pass_for

# ESTIMATING THE QUALITY OF THE FORECASTING MODEL
# CHECK IF RESIDUALS ARE INDEPENDENT (NOT AUTOCORRELATED) AND NORMALLY DISTRIBUTED

acf(Pass_for$residuals, lag.max=20, na.action=na.pass)
Box.test(Pass_for$residuals, lag=20, type="Ljung-Box")
hist(Pass_for$residuals)


#WRITE YOOUR FORECAST IN A CSV FILE

Forecasted_Values<-data.frame(Pass_for)
write.csv(Forecasted_Values, file = "Forecasted.csv")


