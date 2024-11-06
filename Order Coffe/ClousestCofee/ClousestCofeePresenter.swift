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
}

final class ClousestCofeePresenter: ClousestCofeePresenterProtocol {
    weak var view: ClousestCofeeViewProtocol?
    var router: ClousestCofeeRouterProtocol?
    var interactor: ClousestCofeeInteractorProtocol?
}
