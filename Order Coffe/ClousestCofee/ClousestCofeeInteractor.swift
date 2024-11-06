//  
//  ClousestCofeeInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation


protocol ClousestCofeeInteractorProtocol : AnyObject{
    var presenter: ClousestCofeePresenterProtocol? { get set }
}

final class ClousestCofeeInteractor: ClousestCofeeInteractorProtocol {
    weak var presenter: ClousestCofeePresenterProtocol?
}
