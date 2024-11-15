//  
//  MadeOrderView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 13.11.2024.
//

import Foundation
import UIKit

protocol MadeOrderViewProtocol : AnyObject {
    var presenter: MadeOrderPresenterProtocol? { get set }
    func getTableView()
    func getPayButton()
    func configView()
    func getOrderLabelWith(title: String)
    func getNewDrinks(drinks:[CofeeDrinksCellModell])
    func reloadCellAt(_ index: Int)
}

final class MadeOrderView: UIViewController {
    var presenter: MadeOrderPresenterProtocol?
    var orderTableView: UITableView!
    var payButton: CustomButton!
    var timeOrderTitileLable: UILabel!
    var drinks =  [CofeeDrinksCellModell]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Ваш заказ"
        configView()
    }
}

extension MadeOrderView: MadeOrderViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    func getPayButton(){
        let button = CustomButton(title: "Перейти к оплате")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(35)
            make.trailing.leading.equalToSuperview().inset(18)
        }
        button.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        payButton = button
    }
    
    @objc func payButtonAction(){
        
    }
    func getOrderLabelWith(title: String){
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 27)
        label.textColor = .customBrownTextColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.top.equalTo(orderTableView.snp.bottom).offset(10)
        }
        timeOrderTitileLable = label
    }
    
    func getTableView(){
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
        tableView.sectionFooterHeight = 6
        orderTableView = tableView
        
    }
    func configView(){
        presenter?.viewWasLoaded()
    }
    func getNewDrinks(drinks: [CofeeDrinksCellModell]){
        self.drinks = drinks
    }
    
    //MARK: - UITableViewDataSource
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let curentIndex = indexPath.section
        let drink = drinks[curentIndex]
        let cell = CustomTableViewDrinkCell(style: .default, reuseIdentifier: "Cofee")
        cell.configure(with: drink)
        cell.reloadAction(plusAction: getPlusActionFor(curentIndex), minusAction: getMinusActionFor(curentIndex))
        
        
        return cell
    }
    private func getPlusActionFor(_ index: Int) -> UIAction{
        let actionPlus = UIAction{ [weak self]  _ in
            guard let self = self else { return}
            presenter?.increaseButtonActionAt(index)
        }
        return actionPlus
    }
    private func getMinusActionFor(_ index: Int) -> UIAction{
        let actionMinus = UIAction{ [weak self] buton in
            guard let self = self else { return}
            presenter?.reduceButtonActionAt(index)
        }
        return actionMinus
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
//MARK: - UITableViewDelegate
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    func reloadCellAt(_ index: Int){
        let indexPath = IndexPath(row: 0, section: index)
        if let tableView = self.orderTableView{
            tableView.reloadRows(at: [indexPath], with: .middle)
        }
    }
}
