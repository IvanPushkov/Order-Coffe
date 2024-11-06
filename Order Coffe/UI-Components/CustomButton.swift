

import UIKit

class CustomButton: UIButton {

    init(title: String){
        super.init(frame: .zero)
        self.titleLabel!.text = title
        setNewConfiguration()
        settingShape()
        settingColor()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func settingColor(){
        self.tintColor = .customButtonColor
        self.layer.borderColor = UIColor.customButtomBorderColor.cgColor
    }
    private func settingShape(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        
    }
    private func setNewConfiguration(){
        var config  = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.attributedTitle = AttributedString(self.titleLabel?.text ?? "", attributes: AttributeContainer([.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.customButtonTextColor]))
        self.configuration = config
    }
}
