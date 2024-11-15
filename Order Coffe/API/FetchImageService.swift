//
//  FetchImageService.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 12.11.2024.
//

import Foundation
import Alamofire

class FetchImageDataService{
    
    func fetchDataFrom(url: String, complection: @escaping(Data)->()){
        
        AF.request(url)
            .validate()
            .response{ response in
                switch response.result{
                case .success(let data): complection(data!)
                case .failure(_): print("No data")
                }
            }
    }
}
