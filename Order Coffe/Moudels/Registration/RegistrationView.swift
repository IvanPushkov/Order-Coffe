

import UIKit

struct RegistrationViewControllerViewModel {
    
}

/// @mockable
protocol RegistrationViewProtocol : AnyObject {
    var presenter: RegistrationPresenterProtocol? { get set }
    
    func configure(with viewModel: RegistrationViewControllerViewModel)
}

final class RegistrationView: UIViewController {
    var presenter: RegistrationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .blue
    }
}

extension RegistrationView: RegistrationViewProtocol {
    func configure(with viewModel: RegistrationViewControllerViewModel) {
        
    }
}
