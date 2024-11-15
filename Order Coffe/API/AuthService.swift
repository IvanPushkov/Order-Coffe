//
//  RegistrationService.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 05.11.2024.
//

import Foundation
import Alamofire


enum AuthOperation: String{
    case register = "register"
    case login = "login"
}



class AuthService{
    struct UserInfo: Decodable {
        let token: String
        let tokenLifetime: Int
    }
    static let shared = AuthService()
    
    func tryToAuth(AccountData: [String: Any], operationType: AuthOperation = .register, complection: @escaping (RegistrationCondition)->()) {
            let urlRegistration  = "http://147.78.66.203:3210/auth/" + operationType.rawValue
            let header: HTTPHeaders = ["Content-Type" :"application/json"]
            var responseFromServer: RegistrationCondition!
        
        AF.request(urlRegistration,method: .post, parameters: AccountData, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable{(response: DataResponse<UserInfo, AFError>) in
              //  debugPrint(response)
                switch response.result{
                case .success(let data):  responseFromServer = .success
                    complection(responseFromServer)
                    let token = data.token
                    StorageManager.shared.saveToken(token: token)
                case.failure(_):   responseFromServer = .serverError
                    complection(responseFromServer)
                }
                
            }
    }
    
}
