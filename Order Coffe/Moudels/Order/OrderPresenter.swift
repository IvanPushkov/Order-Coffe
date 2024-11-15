//  
//  OrderPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import Foundation

protocol OrderPresenterProtocol : AnyObject {
    var view: OrderViewProtocol? { get set }
    var router: OrderRouterProtocol? { get set }
    var interactor: OrderInteractorProtocol? { get set }
    func configView()
    func showDrinks()
    func showOrderButton()
    func loadCofeeDrinks(drinks: [CofeeDrinksCellModell])
    func reduceButtonActionAt(_ index: Int)
    func increaseButtonActionAt(_ index: Int)
    func loadNewCellModel(newDrinks: [CofeeDrinksCellModell], index: Int)
    func makeOrder()
}

final class OrderPresenter: OrderPresenterProtocol {
    
    weak var view: OrderViewProtocol?
    var router: OrderRouterProtocol?
    var interactor: OrderInteractorProtocol?
    
    func configView() {
        view?.showActivityIndicator()
        interactor?.configView()
    }
    func showDrinks(){
        view?.getCollectionView()
        view?.hideActivityIndicator()
    }
    func loadCofeeDrinks(drinks: [CofeeDrinksCellModell]){
        view?.loadCofeeDrinks(drinks: drinks)
    }
    func reduceButtonActionAt(_ index: Int){
        interactor?.reduceButtonActionAt(index)
    }
    func increaseButtonActionAt(_ index: Int){
        interactor?.increaseButtonActionAt(index)
    }
    func loadNewCellModel(newDrinks: [CofeeDrinksCellModell], index: Int){
        view?.loadCofeeDrinks(drinks: newDrinks)
        view?.reloadCellAt(index: index)
    }
    func showOrderButton(){
        view?.getOrderButton()
    }
    func makeOrder(){
        interactor?.makeOrder()
        router?.goToMadeOrderView()
    }
}
