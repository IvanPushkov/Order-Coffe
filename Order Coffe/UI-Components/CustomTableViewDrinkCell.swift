//
//  CustomTableViewCounterCell.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import UIKit

class CustomTableViewDrinkCell: CustomTableViewPlaceCell{
    var counterView: CustomCounterView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        getCounterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getCounterView(){
        counterView = CustomCounterView(frame: .zero)
        contentView.addSubview(counterView)
        counterView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
            make.trailing.equalToSuperview().inset(8)
        }
        counterView.changeSizeAndColor(color: .customButtomBorderColor, size: 19)
    }
    
    func configure(with model: CofeeDrinksCellModell){
        self.titleLable.text = model.name
        self.subTitle.text = model.totalPrice
        self.counterView.countLabel.text = String(model.count)
    }
    
    func reloadAction(plusAction: UIAction, minusAction: UIAction){
        self.counterView.reloadActions(minusAction: minusAction, plusAction: plusAction)
    }
}
