import ObjectMapper

class CountryRespose: Mappable {
    var location: String?
    var success :Bool?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
        success <- map["success"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
        
    }
}

