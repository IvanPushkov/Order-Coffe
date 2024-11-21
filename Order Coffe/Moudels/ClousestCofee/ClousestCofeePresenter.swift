//  
//  ClousestCofeePresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit


protocol ClousestCofeePresenterProtocol : AnyObject {
    var view: ClousestCofeeViewProtocol? { get set }
    var router: ClousestCofeeRouterProtocol? { get set }
    var interactor: ClousestCofeeInteractorProtocol? { get set }
    func showAlertLocationOff()
    func configClousestCofeeView()
    
    func getInfoToRows(cofeeRoomsFromServer: Locations)
    func wasChosen(location: Location)
    func goToTheMap()
    func setViewToShow()
    func getLookOnTheMapButton()
    func getCofeePlaceTableView()
}

final class ClousestCofeePresenter: ClousestCofeePresenterProtocol {
    weak var view: ClousestCofeeViewProtocol?
    var router: ClousestCofeeRouterProtocol?
    var interactor: ClousestCofeeInteractorProtocol?
    
    func configClousestCofeeView() {
        interactor?.configView()
    }
    func setViewToShow(){
        view?.setViewToShow()
    }
    func getLookOnTheMapButton(){
        view?.getLookOnTheMapButton()
    }
    
    func getCofeePlaceTableView(){
        view?.getCofeePlaceTableView()
    }
    func wasChosen(location: Location) {
        let id = (location.id)
        interactor?.saveId(id: id)
        router?.goToOrderView()
    }
    func goToTheMap(){
        router?.goToTheMap()
    }
    
    
    func getInfoToRows(cofeeRoomsFromServer: Locations){
        view?.configRows(cofeRooms: cofeeRoomsFromServer)
        reloadData()
    }
    
    private func reloadData() {
        view?.updateView()
    }
    
    func showAlertLocationOff(){
        let title: String = "У вас выключена локация"
        let message: String  = "Хотите включить"
        let url: String = "App-Prefs:root=LOCATION_SERVICES"
        view?.showAlert(title: title, message: message, url: url)
    }
    func showAlertBanLocation(){
        let title: String = "У вас включен запрет на использование геопозиции"
        let message: String  = "Хотите включить"
        view?.showAlert(title: title, message: message, url: UIApplication.openSettingsURLString)
    }
}
