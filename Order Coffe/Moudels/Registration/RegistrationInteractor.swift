//  
//  RegistrationInteractor.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 29.10.2024.
//

import Foundation


protocol RegistrationInteractorProtocol : AnyObject{
    var presenter: RegistrationPresenterProtocol? { get set }
}

final class RegistrationInteractor: RegistrationInteractorProtocol {
    weak var presenter: RegistrationPresenterProtocol?
}
