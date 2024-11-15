

import Foundation
import Alamofire

protocol APIProtocol{
    func getHeader() -> HTTPHeaders
}

extension APIProtocol{
    func getHeader() -> HTTPHeaders{
         let token: String = "Bearer " + (StorageManager.shared.getToken() ?? "NO")
         let header: HTTPHeaders = ["Authorization": token]
         return header
    }
}
