//
//  CustomTableViewCell.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 06.11.2024.
//

import UIKit
import SnapKit

class CustomTableViewPlaceCell: UITableViewCell {

    weak var titleLable: UILabel!
    weak var subTitle: UILabel!
    weak var separatorView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCellColorAndShape()
        titleLable = getTitle()
        subTitle =  getSubTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    
    
    func setCellColorAndShape(){
        self.selectionStyle = .none
        backgroundColor = .customButtonTextColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.shadowOpacity = 0.4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    
    
    func getTitle()-> UILabel{
        let label = UILabel()
        label.textColor = .customBrownTextColor
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.left.right.equalToSuperview().inset(18)
        }
        return label
    }
    func getSubTitle()-> UILabel{
        let label = UILabel()
        label.textColor = .customTextFieldTextColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).inset(-4)
            make.leading.equalToSuperview().inset(18)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        return label
    }
    
    

}
