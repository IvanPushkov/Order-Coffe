//  
//  ClousestCofeeInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation


protocol ClousestCofeeInteractorProtocol : AnyObject{
    var presenter: ClousestCofeePresenterProtocol? { get set }
    func configView()
    func saveId(id: Int)
   
}

final class ClousestCofeeInteractor: ClousestCofeeInteractorProtocol {
    weak var presenter: ClousestCofeePresenterProtocol?
    private var locationManager = LocationManager()
    private func fetchPlaces() {
        LocationService().fetchLocations { locations in
            self.presenter?.getInfoToRows(cofeeRoomsFromServer: locations)
            self.saveLocations(locations)
        }
    }
    func configView(){
        fetchPlaces()
        setUpEllements()
    }
    
    private func setUpEllements(){
        presenter?.setViewToShow()
        presenter?.getLookOnTheMapButton()
        presenter?.getCofeePlaceTableView()
        if !locationManager.checklocationPhoneIsOn() {
            presenter?.showAlertLocationOff() } else {
                checkApplocation()
            }
    }
    
    private func checkApplocation(){
        if !locationManager.checkLocationAppIsOn(){
            presenter?.showAlertLocationOff()
        }
    }
    
    func saveId(id: Int){
        StorageManager.shared.saveID(id: id)
    }
   
    private func saveLocations(_ locations: Locations){
        StorageManager.shared.saveLocations(locations)
    }
    
}
