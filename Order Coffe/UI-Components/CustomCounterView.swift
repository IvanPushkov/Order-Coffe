//
//  CustomCounterView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 12.11.2024.
//

import UIKit
import SnapKit

class CustomCounterView: UIView{
    var minusButton: UIButton!
    var plusButton: UIButton!
    var countLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getMinusButton(color: .customButtonTextColor)
        getPlusButton(color: .customButtonTextColor)
        getCountLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func removeActions(){
        plusButton.removeTarget(nil, action: nil, for: .touchUpInside)
        minusButton.removeTarget(nil, action: nil, for: .touchUpInside)
    }
    
    func reloadActions(minusAction: UIAction, plusAction: UIAction){
        removeActions()
        plusButton.addAction(plusAction, for: .touchUpInside)
        minusButton.addAction(minusAction, for: .touchUpInside)
    }
    
    func changeSizeAndColor(color: UIColor, size: Float){
        minusButton.tintColor = color
        plusButton.tintColor = color
        countLabel.textColor = color
        minusButton.snp.makeConstraints { make in
            make.size.equalTo(size)
        }
        plusButton.snp.makeConstraints { make in
            make.size.equalTo(size)
        }
        countLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(size))
    }
    
  private  func getMinusButton(color: UIColor = .customButtonTextColor, size: Float = 17){
        let button = UIButton(type: .system)
        self.addSubview(button)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = color
        button.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.size.equalTo(size)
        }
        minusButton = button
    }
    private  func getPlusButton(color: UIColor = .customButtonTextColor, size: Float = 17){
        let button = UIButton()
        self.addSubview(button)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = color
        button.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.size.equalTo(size)
        }
        plusButton = button
    }
    private  func getCountLabel(color: UIColor = .customBrownTextColor, size: Float = 17){
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CGFloat(size))
        label.textColor = color
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.center.equalToSuperview()
        }
        countLabel = label
    }
    
}
