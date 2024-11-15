//  
//  MadeOrderPresenter.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import Foundation

protocol MadeOrderPresenterProtocol : AnyObject {
    var view: MadeOrderViewProtocol? { get set }
    var router: MadeOrderRouterProtocol? { get set }
    var interactor: MadeOrderInteractorProtocol? { get set }
    func configView(drinks: [CofeeDrinksCellModell])
    func viewWasLoaded()
    func reduceButtonActionAt(_ index: Int)
    func increaseButtonActionAt(_ index: Int)
    func loadNewCellModel(newDrinks: [CofeeDrinksCellModell], index: Int)
}

final class MadeOrderPresenter: MadeOrderPresenterProtocol {
    weak var view: MadeOrderViewProtocol?
    var router: MadeOrderRouterProtocol?
    var interactor: MadeOrderInteractorProtocol?
    
    func viewWasLoaded(){
        interactor?.getDataForView()
    }
    func configView(drinks: [CofeeDrinksCellModell]) {
        view?.getNewDrinks(drinks: drinks)
        view?.getPayButton()
        view?.getTableView()
        let title = """
Время ожидания заказа
15 минут!
Спасибо, что выбрали нас!
"""
        view?.getOrderLabelWith(title: title )
    }
    func reduceButtonActionAt(_ index: Int){
        interactor?.reduceButtonActionAt(index)
    }
    func increaseButtonActionAt(_ index: Int){
        interactor?.increaseButtonActionAt(index)
    }
    func loadNewCellModel(newDrinks: [CofeeDrinksCellModell], index: Int){
        view?.getNewDrinks(drinks: newDrinks)
        view?.reloadCellAt(index)
    }
}
