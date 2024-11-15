//  
//  OrderInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import Foundation


protocol OrderInteractorProtocol : AnyObject{
    var presenter: OrderPresenterProtocol? { get set }
    func configView()
    func reduceButtonActionAt(_ index: Int)
    func increaseButtonActionAt(_ index: Int)
    func makeOrder()
}

final class OrderInteractor: OrderInteractorProtocol {
    var drinks = [CofeeDrinksCellModell]()
    weak var presenter: OrderPresenterProtocol?
    let drinkService = DrinksService()
    let fetchImageDataService = FetchImageDataService()
    
    func configView(){
        drinkService.getDrinks { [self] drinks in
            getCofeeDrinkModellsWithData(drinks: drinks) { [self] cofeeModells in
               launchViewWith(modell: cofeeModells)
            }
        }
    }
    
    private func launchViewWith(modell: [CofeeDrinksCellModell]){
        self.drinks = modell
        self.presenter?.loadCofeeDrinks(drinks: modell)
        self.presenter?.showDrinks()
        self.presenter?.showOrderButton()
    }
    
    private func getCofeeDrinkModellsWithData(drinks: CofeeDrinks, complection: @escaping ([CofeeDrinksCellModell])-> ()){
        var cofeDrinkCellModels: [CofeeDrinksCellModell] = []
        let queueForLoaddata = DispatchQueue.global(qos: .utility)
        let group = DispatchGroup()
        for (drink) in drinks{
            group.enter()
            queueForLoaddata.async(){ [self] in
                fetchImageDataService.fetchDataFrom(url: drink.imageURL){ data in
                    DispatchQueue.main.async {
                        cofeDrinkCellModels.append(CofeeDrinksCellModell(name: drink.name, imageData: data, startPrice: drink.price))
                    }
                    group.leave()
                }
            }
        }
        group.notify(queue: DispatchQueue.main){
            complection(cofeDrinkCellModels)
        }
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
    func makeOrder(){
        let drinksForOrder = drinks.filter{ drink in
            drink.count > 0
        }
        StorageManager.shared.saveCofeeOrderModell(orderModell: drinksForOrder)
    }
}
    
