//  
//  ClousestCofeeView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import Foundation
import UIKit

struct ClousestCofeeViewControllerViewModel {
    
}


protocol ClousestCofeeViewProtocol : AnyObject {
    var presenter: ClousestCofeePresenterProtocol? { get set }
    
    func configure(with viewModel: ClousestCofeeViewControllerViewModel)
}

final class ClousestCofeeView: UIViewController {
    var presenter: ClousestCofeePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ClousestCofeeView: ClousestCofeeViewProtocol {
    func configure(with viewModel: ClousestCofeeViewControllerViewModel) {
        
    }
}
