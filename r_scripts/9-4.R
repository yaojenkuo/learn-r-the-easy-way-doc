# 程式碼 9-4
weather <- sample(c("sunny", "rainy", "cloudy"), size = 1) weather
if (weather == "sunny"){
    print("Running outdoors!")
} else if (weather == "cloudy"){
    print("Cycling!")
} else {
    print("Working out in the gym!")
}