import ObjectMapper
private let calling_code1 = "calling_code"
class WeatherResponse: Mappable {
    //var location: String?
    var success :Bool?
    
    
    var data: [Forecast]?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
        //location <- map["location"]
        data <- map["data"]
        success <- map["success"]
    }
}

class Forecast: Mappable {
    var code: String?
    var calling_code : String?
    
//    var temperature: Int?
//    var conditions: String?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        calling_code <- map[calling_code1]
//        temperature <- map["temperature"]
//        conditions <- map["conditions"]
        
    }
}

