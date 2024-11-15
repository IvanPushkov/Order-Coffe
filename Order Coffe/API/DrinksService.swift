
import UIKit
import Alamofire

class DrinksService: APIProtocol{
    
    private let urlOfDrinks: String = "http://147.78.66.203:3210/location/\(StorageManager.shared.getID())/menu"
    
    
    func getDrinks(complection: @escaping (CofeeDrinks)-> ()){
        AF.request(urlOfDrinks, headers: getHeader())
        
            .responseDecodable{(response: DataResponse<CofeeDrinks, AFError>) in
                //debugPrint(response)
                switch response.result{
                case .failure(_): print("Drinks not comming")
                case .success(let drinks): complection(drinks)
                }
            }
    }
    
}
