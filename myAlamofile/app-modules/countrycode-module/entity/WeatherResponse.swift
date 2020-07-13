import ObjectMapper
private let calling_code1 = "calling_code"
class WeatherResponse: Mappable {
    //var location: String?
    var success :Bool?
    
    
    var data: [Forecast]?
    
    required init?(map: Map){

    }
    
    func mapping(map: Map) {
      
        data <- map["data"]
        success <- map["success"]
    }
}

class Forecast: Mappable {
    var code: String?
    var calling_code : String?
    

    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        calling_code <- map[calling_code1]

        
    }
}

class CountryCode: Mappable {
    var code: String?
    var calling_code : String?
    

    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        calling_code <- map[calling_code1]

        
    }
}
class otpModule: Mappable {
    var data: Accesstoken?
    var text: String?

    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        data <- map["token"]
        text <- map["text"]
        
    }
}
class Accesstoken: Mappable {
    var reference: String?
    var interval_time :String?
    var expire_time :String?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        reference <- map["reference"]
        interval_time <- map["interval_time"]
        expire_time <- map["expire_time"]
    }
}
