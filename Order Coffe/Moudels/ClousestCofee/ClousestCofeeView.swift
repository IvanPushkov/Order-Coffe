
import UIKit
import SnapKit
import CoreLocation


protocol ClousestCofeeViewProtocol : AnyObject {
    var presenter: ClousestCofeePresenterProtocol? { get set }
    func getLookOnTheMapButton()
    func getCofeePlaceTableView()
    func configRows(cofeRooms: Locations)
    func updateView()
    func setViewToShow()
    func showAlert(title: String, message: String, url: String)
}

final class ClousestCofeeView: UIViewController {
    var presenter: ClousestCofeePresenterProtocol?
   weak var lookOnTheMapBotton: CustomButton!
   weak var cofeePlacetableView: UITableView!
    var answer = false
    var cofeRooms: Locations = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.configClousestCofeeView()
    }
}

extension ClousestCofeeView: ClousestCofeeViewProtocol, UITableViewDataSource, UITableViewDelegate  {
//MARK: - ClousestCofeeViewProtocol
    func setViewToShow(){
        view.backgroundColor = .white
        self.title = "Ближайшие кофейни"
    }
    func getLookOnTheMapButton() {
        let button = CustomButton(title: "На карте")
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(18)
        }
        button.addTarget(nil, action: #selector(goToTheMap), for: .touchUpInside)
        lookOnTheMapBotton = button
    }
    @objc func goToTheMap(){
        presenter?.goToTheMap()
    }
    
    func getCofeePlaceTableView(){
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(80)
            make.bottom.equalTo(lookOnTheMapBotton.snp.top).offset(-70)
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
        tableView.sectionFooterHeight = 6
        cofeePlacetableView = tableView
    }
    
    func configRows(cofeRooms: Locations){
        self.cofeRooms = cofeRooms
    }
    func updateView(){
        self.cofeePlacetableView.reloadData()
    }
    func showAlert(title: String, message: String, url: String){
        let alert = LocationAlertController(titleAlert: title, message: message, url: url)
        self.present(alert, animated: true)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewPlaceCell(style: .default, reuseIdentifier: "Cofee")
        cell.titleLable.text = cofeRooms[indexPath.section].name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cofeRooms.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wasChosen(location: cofeRooms[indexPath.section])
    }
    
}

