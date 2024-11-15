//  
//  YandexMapView.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 14.11.2024.
//

import Foundation
import UIKit
import YandexMapsMobile
import MapKit



struct YandexMapViewControllerViewModel {
    
}


protocol YandexMapViewProtocol : AnyObject {
    var presenter: YandexMapPresenterProtocol? { get set }
    
    func configure(with viewModel: YandexMapViewControllerViewModel)
}

final class YandexMapView: UIViewController {
    var presenter: YandexMapPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var mapView = MKMapView(frame: view.bounds)
        mapView.showsUserLocation = true
    }
}

extension YandexMapView: YandexMapViewProtocol {
    func configure(with viewModel: YandexMapViewControllerViewModel) {
        
    }
}
