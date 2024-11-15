//  
//  OrderView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 11.11.2024.
//

import Foundation
import UIKit
import SnapKit




protocol OrderViewProtocol : AnyObject {
    var presenter: OrderPresenterProtocol? { get set }
    func showActivityIndicator()
    func hideActivityIndicator()
    func getCollectionView()
    func getOrderButton()
    func loadCofeeDrinks(drinks: [CofeeDrinksCellModell])
    func reloadData()
    func reloadCellAt(index: Int)
}

final class OrderView: UIViewController {
    var presenter: OrderPresenterProtocol?
    var activityView: UIActivityIndicatorView!
    var collectionView: UICollectionView!
    var makeOrderButton: UIButton!
    var drinks = [CofeeDrinksCellModell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Меню"
        presenter?.configView()
    }
    
}

extension OrderView: OrderViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    func showActivityIndicator(){
        let loadView = UIActivityIndicatorView()
        loadView.color = .customBrownTextColor
        loadView.center = view.center
        loadView.startAnimating()
        view.addSubview(loadView)
        activityView  = loadView
    }
    
    func hideActivityIndicator(){
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func getCollectionView(){
        let layaut  = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layaut)
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(18)
            make.top.equalToSuperview().inset(100)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
       
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Drink")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView = collectionView
    }
    
    func getOrderButton(){
        let button = CustomButton(title: "Перейти к оплате")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(35)
            make.trailing.leading.equalToSuperview().inset(18)
        }
        button.addTarget(self, action: #selector(makeOrderAction), for: .touchUpInside)
        makeOrderButton = button
    }
    @objc func makeOrderAction(){
        presenter?.makeOrder()
    }
    func loadCofeeDrinks(drinks: [CofeeDrinksCellModell]){
        self.drinks = drinks
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func reloadCellAt(index: Int){
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.reloadItems(at: [indexPath])
    }
    
   //MARK: - DataSource

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cofeeDrink = drinks[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Drink", for: indexPath) as? CustomCollectionViewCell
            {
            cell.configureWith(cofeeDrinkModel: cofeeDrink)
            let plusAction = getPlusActionFor(index: indexPath.row)
            let minusAction = getMinusActionFor(index: indexPath.row)
            cell.reloadActions(actionPlus: plusAction, actionMinus: minusAction)
          return cell
        }
        else{
            let newCell = UICollectionViewCell(frame: .zero)
            return newCell
        }
    }
    private func getPlusActionFor(index: Int) -> UIAction{
        let actionPlus = UIAction{ [weak self]  _ in
            guard let self = self else { return}
            presenter?.increaseButtonActionAt(index)
        }
        return actionPlus
    }
    private func getMinusActionFor(index: Int) -> UIAction{
        let actionMinus = UIAction{ [weak self] buton in
            guard let self = self else { return}
            presenter?.reduceButtonActionAt(index)
        }
        return actionMinus
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drinks.count
    }
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.485
        let height = collectionView.frame.height * 0.31
        return CGSize(width: width, height: height)
    }
   
}
