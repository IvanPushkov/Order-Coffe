//  
//  YandexMapInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import Foundation


protocol YandexMapInteractorProtocol : AnyObject{
    var presenter: YandexMapPresenterProtocol? { get set }
    func configView()
    func selectMarkWithName(_ name: String)
}

final class YandexMapInteractor: YandexMapInteractorProtocol {
    let locations = StorageManager.shared.getLocations()
    weak var presenter: YandexMapPresenterProtocol?
    func configView(){
        
        presenter?.showTheMap(points: locations.map{$0.point} )
        presenter?.configButton()
        for location in locations{
            let point = location.point
            presenter?.showMark(point: point, name: location.name)
        }
    }
    func selectMarkWithName(_ name: String){
        for location in locations{
            if location.name == name{
                StorageManager.shared.saveID(id: location.id)
            }
        }
    }
}
