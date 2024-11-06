

import UIKit

class AuthAlertController: UIAlertController {
    
    let cansleButton = UIAlertAction(title: "Отмена",style: .cancel)
    override func viewDidLoad() {
        self.addAction(cansleButton)
    }    
    convenience init(massage: String){
        self.init(title: "Ошибка", message: massage, preferredStyle: .alert)
    }
}
