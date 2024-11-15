

import UIKit

protocol LoginRouterProtocol : AnyObject{
    var viewController: UIViewController? { get set }
    func goToClousestCofeeView()
}

final class LoginRouter: LoginRouterProtocol {
    func goToClousestCofeeView() {
        viewController?.navigationController?.pushViewController(ClousestCofeeBuilder.build(), animated: true)
    }
    
    var viewController: UIViewController?
}

