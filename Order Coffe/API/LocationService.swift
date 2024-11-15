//
//  LocationService.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 07.11.2024.
//

import Foundation
import Alamofire



class LocationService: APIProtocol{
   
    private let locationUrl: String = "http://147.78.66.203:3210/locations"
    
    
    
    func fetchLocations(complection: @escaping (Locations)->()){
        AF.request(locationUrl,headers: getHeader())
            .responseDecodable{(response: DataResponse<Locations, AFError>) in
            //    debugPrint(response)
                switch response.result{
                case .success(let locations): complection(locations)
                case .failure(let error): print(error)
                }
            }
    }
}

