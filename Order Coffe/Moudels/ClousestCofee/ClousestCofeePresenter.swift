//  
//  ClousestCofeePresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation

protocol ClousestCofeePresenterProtocol : AnyObject {
    var view: ClousestCofeeViewProtocol? { get set }
    var router: ClousestCofeeRouterProtocol? { get set }
    var interactor: ClousestCofeeInteractorProtocol? { get set }
    func configClousestCofeeView()
    func getInfoToRows(cofeeRoomsFromServer: Locations)
    func wasChosen(location: Location)
    func goToTheMap()
}

final class ClousestCofeePresenter: ClousestCofeePresenterProtocol {
    weak var view: ClousestCofeeViewProtocol?
    var router: ClousestCofeeRouterProtocol?
    var interactor: ClousestCofeeInteractorProtocol?
    
    func configClousestCofeeView() {
        view?.getLookOnTheMapButton()
        view?.getCofeePlaceTableView()
        interactor?.fetchPlaces()
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
}
