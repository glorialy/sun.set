city_state<-read.csv("zip_codes_states.csv")
sunset_time<-function(city,state,
                      date=format(Sys.time(),"%Y/%m/%d"),
                      timezone="America/New_York",
                      num.days = 1){
  if (length(which(city_state$city == city &
                      city_state$state == state))==0){
    stop("No such city!")  
  }
  pos<-city_state[which(city_state$city == city &
                          city_state$state == state),]
  pos <- colMeans(pos[!is.na(pos[,2]),c(2,3)])
  lat = pos[1]
  long = pos[2]
  sunrise.set(lat,long,date,timezone,num.days)
}



#  city = 'Arlington'
#  state= 'VA'
  sunset_time("Alexandria","VA",num.days=5)
# misspelling
  city = 'Washington'
  state= 'DC'
  sunset_time("Arlington","VA",num.days=5)
  sunset_time("Washington","DC")
  sunset_time("Chicago","IL")
