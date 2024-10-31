//
//  CustomTextField.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 30.10.2024.
//

import UIKit

class CustomTextField: UITextField{
    
    private var pading  = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
    init(){
        super.init(frame: .zero)
        makeCustoBorder()
        makeCustomTextSettings()
        makeCustomPlaceHolder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: pading)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: pading)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: pading)
    }
    
    private func makeCustomTextSettings(){
        self.font = .systemFont(ofSize: 18)
        self.textColor = .customBrownTextColor
        self.tintColor = .customTextFieldTextColor
    }
    private func makeCustoBorder(){
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.customBrownTextColor.cgColor
        self.layer.borderWidth = 2.2
    }
    private func makeCustomPlaceHolder(){
        let placeHolderAtribute = NSAttributedString(string: "Text please",
                                                     attributes: [
                                                        .foregroundColor: UIColor.customTextFieldTextColor,
                                                        .font: UIFont.systemFont(ofSize: 18)
                                                     ])
        self.attributedPlaceholder = placeHolderAtribute
    }
}
