
import Foundation
import UIKit
import YandexMapsMobile
import SnapKit

protocol YandexMapViewProtocol : AnyObject {
    var presenter: YandexMapPresenterProtocol? { get set }
    func getMapViewWith(center: YMKPoint)
    func getToStoreButton()
    func getPointsOnMap(latitude: Double, longitude: Double, name: String)
    func makeButtonVisible()
}

final class YandexMapView: UIViewController {
    var presenter: YandexMapPresenterProtocol?
    var mapView: YMKMapView!
    var storeButton: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Карта"
        presenter?.viewWasLoaded()
    }
    
}
extension YandexMapView: YandexMapViewProtocol {
 
    func getMapViewWith(center: YMKPoint){
        mapView = YMapView().mapView
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: center,
                zoom: 9,
                azimuth: 0,
                tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 2),
            cameraCallback: nil
        )
        view?.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func getPointsOnMap(latitude: Double, longitude: Double, name: String){
        let point: YMKPoint = YMKPoint(latitude: latitude, longitude: longitude)
        let placeMark: YMKPlacemarkMapObject = mapView.mapWindow.map.mapObjects.addPlacemark()
        placeMark.geometry = point
        placeMark.setTextWithText(
            name,
            style: YMKTextStyle(
                size: 8,
                color: .customBrownTextColor,
                outlineWidth: 200,
                outlineColor: .clear,
                placement: .bottom,
                offset: 10,
                offsetFromIcon: true,
                textOptional: true))
        placeMark.setIconWith(
            UIImage(named: "CofeeMark")!,
            style: YMKIconStyle(
                anchor:CGPoint(x: 0.5, y: 0.5) as NSValue,
                rotationType: .none,
                zIndex: 0,
                flat: true,
                visible: true,
                scale: 0.7,
                tappableArea: nil
            )
        )
        placeMark.addTapListener(with: self)
        placeMark.userData = name
    }
    func getToStoreButton(){
        let button = CustomButton(title: "В магазин")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.leadingMargin.trailing.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(80)
        }
        button.addTarget(nil, action: #selector(toTheStore), for: .touchUpInside)
        storeButton = button
        storeButton.isHidden = true
    }
    @objc func toTheStore(){
        presenter?.goToOrderView()
    }
    func makeButtonVisible(){
        storeButton.isHidden = false
    }
}

extension YandexMapView: YMKMapObjectTapListener{
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        guard let placeMark = mapObject as? YMKPlacemarkMapObject else {
            return false
        }
        self.focusOnPlaceMark(placeMark)
        self.presenter?.selectOrderViewWithName(placeMark.userData)
        return true
    }
    
    func focusOnPlaceMark(_ placeMark: YMKPlacemarkMapObject){
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: placeMark.geometry, zoom: 11, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 0.2), cameraCallback: nil
        )
    }
}

