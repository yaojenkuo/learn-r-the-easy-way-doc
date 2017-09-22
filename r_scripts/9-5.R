# 程式碼 9-5
weather <- sample(c("sunny", "cloudy", "drizzle", "showers", "storm"), size = 1)
weather
if (weather == "sunny"){
    print("Running outdoors!")
} else if (weather == "cloudy"){
    print("Cycling!")
} else if (weather == "drizzle"){
    print("Working out in the gym!")
} else {
    print("Couch potato.")
}