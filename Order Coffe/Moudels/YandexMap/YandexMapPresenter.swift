//  
//  YandexMapPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import Foundation
import YandexMapsMobile

protocol YandexMapPresenterProtocol : AnyObject {
    var view: YandexMapViewProtocol? { get set }
    var router: YandexMapRouterProtocol? { get set }
    var interactor: YandexMapInteractorProtocol? { get set }
    func viewWasLoaded()
    func showMark(point: Point, name: String)
    func showTheMap(points: [Point])
    func selectOrderViewWithName(_ name: Any?)
    func goToOrderView()
    func configButton()
}

final class YandexMapPresenter: YandexMapPresenterProtocol {
   
    weak var view: YandexMapViewProtocol?
    var router: YandexMapRouterProtocol?
    var interactor: YandexMapInteractorProtocol?
    func viewWasLoaded(){
        interactor?.configView()
    }
    func showMark(point: Point, name: String){
        let latitude =   point.getDoubleLatitude()
        let longitude = point.getDoubleLongitude()
      view?.getPointsOnMap(latitude: latitude, longitude: longitude, name: name)
    }
    func showTheMap(points: [Point]){
        let longitudes = points.map { $0.getDoubleLongitude()}
        let latitudes = points.map{$0.getDoubleLatitude()}
        let latitude = getMeedle(values: latitudes)
        let longitude = getMeedle(values: longitudes)
        let center = YMKPoint(latitude: latitude, longitude: longitude)
        view?.getMapViewWith(center: center)
    }
    
    private func getMeedle<T: BinaryFloatingPoint>(values:[T]) -> T{
    var sumValues: T = 0
        for value in values{
            sumValues += value
        }
        return sumValues / T(values.count)
    }
    
    func configButton(){
        view?.getToStoreButton()
    }
    func selectOrderViewWithName(_ name: Any?){
        view?.makeButtonVisible()
        if let name = (name as? String){
            interactor?.selectMarkWithName(name)
        }
    }
    func goToOrderView(){
        router?.goToOrderView()
    }
}
