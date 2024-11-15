//
//  CustomCollectionViewCell.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var cofeeName = UILabel()
    var cofeePrice = UILabel()
    var cofeeImageView = UIImageView()
    var counterView = CustomCounterView(frame: .zero)
    private var imageCofee = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeContentView()
        getPriceLabel()
        getNameLabel()
        getImageView()
        getCounterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func changeContentView(){
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = true
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 0.2
    }
    
    private  func getNameLabel(){
        cofeeName = UILabel()
        cofeeName.textColor = .customTextFieldTextColor
        contentView.addSubview(cofeeName)
        cofeeName.font = UIFont.systemFont(ofSize: 18)
        cofeeName.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.width.equalToSuperview()
            make.bottom.equalTo(cofeePrice.snp.top).inset(-2)
        }
    }
    private func getPriceLabel(){
        cofeePrice = UILabel()
        cofeePrice.textColor = .customBrownTextColor
        contentView.addSubview(cofeePrice)
        cofeePrice.font = UIFont.boldSystemFont(ofSize: 17)
        cofeePrice.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func getImageView(){
        cofeeImageView = UIImageView()
        contentView.addSubview(cofeeImageView)
        cofeeImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.67)
        }
        cofeeImageView.contentMode = .scaleAspectFill
        cofeeImageView.layer.zPosition = -1
        cofeeImageView.backgroundColor = .clear
    }
    
    private func getCofeeImage(cofeeImageData: Data) -> UIImage?{
        let image = (UIImage(data: cofeeImageData))
        return image
        
    }
    private func getCounterView(){
        contentView.addSubview(counterView)
        counterView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(cofeePrice)
            make.leading.equalTo(cofeePrice.snp.trailing).offset(3)
            make.height.equalTo(cofeePrice)
        }
    }
    
    func configureWith(cofeeDrinkModel: CofeeDrinksCellModell){
        self.cofeeName.text = cofeeDrinkModel.name
        self.cofeePrice.text = cofeeDrinkModel.totalPrice
        cofeeImageView.image = UIImage(data: cofeeDrinkModel.imageData)
        self.counterView.countLabel.text = String(cofeeDrinkModel.count)
        self.counterView.minusButton.undoManager?.removeAllActions()
    }
    func reloadActions(actionPlus: UIAction, actionMinus: UIAction){
        counterView.reloadActions(minusAction: actionMinus, plusAction: actionPlus)
    }
    
}
