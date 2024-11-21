import UIKit


class StorageManager{
    
    static let shared = StorageManager()
    private var storage = UserDefaults.standard
    private let tokenKey: String = "token"
    private let idKey: String = "id"
    private var cofeeOrderModell: [CofeeDrinksCellModell]?
    private var locations = Locations()
    func saveToken(token: String){
        storage.set(token, forKey: tokenKey)
    }
    func saveID(id: Int){
        storage.set(id, forKey: idKey)
    }
    func getToken()-> String?{
        storage.string(forKey: tokenKey)
    }
    
    func getID() -> Int{
        storage.integer(forKey: idKey)
    }
    
    func saveCofeeOrderModell(orderModell: [CofeeDrinksCellModell]){
        cofeeOrderModell = orderModell
    }
    func getCofeeOrderModell() -> [CofeeDrinksCellModell]?{
        return cofeeOrderModell
    }
    func saveLocations(_ newLocations: Locations){
        locations = newLocations
    }
    func getLocations() -> Locations{
        return locations
    }
}
