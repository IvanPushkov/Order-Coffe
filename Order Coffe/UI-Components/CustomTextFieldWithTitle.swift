//
//  CustomTextField.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 30.10.2024.
//

import UIKit

class CustomTextFieldWithTitle: UIView{
    lazy var titleLable = getTitleLable()
    lazy var textField = getTextField()
    
    init(title: String, placeHolderText: String){
        super.init(frame: .zero)
        titleLable.text = title
        textField.placeholder = placeHolderText
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getTitleLable() -> UILabel{
        let lable = UILabel()
        lable.textColor = .customBrownTextColor
        lable.font = .systemFont(ofSize: 15)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    private func getTextField() -> CustomTextField{
        let myTextField = CustomTextField()
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        return myTextField
    }
    
    private func setupView(){
        self.addSubview(titleLable)
        self.addSubview(textField)
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 4),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

}
