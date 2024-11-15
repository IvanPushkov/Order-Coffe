//  
//  MadeOrderInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import Foundation


protocol MadeOrderInteractorProtocol : AnyObject{
    var presenter: MadeOrderPresenterProtocol? { get set }
    func getDataForView()
    func reduceButtonActionAt(_ index: Int)
    func increaseButtonActionAt(_ index: Int)
}

final class MadeOrderInteractor: MadeOrderInteractorProtocol {
    weak var presenter: MadeOrderPresenterProtocol?
    var drinks = [CofeeDrinksCellModell]()
    func getDataForView(){
        drinks = StorageManager.shared.getCofeeOrderModell() ?? []
        presenter?.configView(drinks: drinks)
    }
    func reduceButtonActionAt(_ index: Int) {
        let cellModell = getCellModellAt(index)
        cellModell.reduceCount()
        updateValueInCell(newCellModell: cellModell)
    }
    
    func increaseButtonActionAt(_ index: Int) {
        let cellModell = getCellModellAt(index)
        cellModell.increaseCount()
        updateValueInCell(newCellModell: cellModell)
    }
    private func getCellModellAt(_ index: Int) -> CofeeDrinksCellModell{
       return  drinks[index]
    }
    private func updateValueInCell(newCellModell: CofeeDrinksCellModell){
        var newIndex = 0
        var newDrinks = [CofeeDrinksCellModell]()
        for (index, drink) in drinks.enumerated(){
            if drink.name != newCellModell.name{
                newDrinks.append(drink)
            } else {
                newDrinks.append(newCellModell)
                newIndex = index
            }
        }
        drinks = newDrinks
        presenter?.loadNewCellModel(newDrinks: drinks, index: newIndex)
    }
}
