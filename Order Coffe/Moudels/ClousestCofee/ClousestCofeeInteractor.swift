//  
//  ClousestCofeeInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation


protocol ClousestCofeeInteractorProtocol : AnyObject{
    var presenter: ClousestCofeePresenterProtocol? { get set }
    func fetchPlaces()
    func saveId(id: Int)
}

final class ClousestCofeeInteractor: ClousestCofeeInteractorProtocol {
    weak var presenter: ClousestCofeePresenterProtocol?
    func fetchPlaces() {
        LocationService().fetchLocations { locations in
            self.presenter?.getInfoToRows(cofeeRoomsFromServer: locations)
        }
        
    }
    func saveId(id: Int){
        StorageManager.shared.saveID(id: id)
    }
    
}
