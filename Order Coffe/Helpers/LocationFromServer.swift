import Foundation

// MARK: - Location
struct Location: Codable {
    let id: Int
    let name: String
    let point: Point
}

// MARK: - Point
struct Point: Codable {
    let latitude, longitude: String?
    func getDoubleLatitude() -> Double{
        if let latitude = Double(latitude!){
            return latitude
        }
        return 0.0
    }
    func getDoubleLongitude() -> Double{
        if let longitude = Double(longitude!){
            return longitude
        }
        return 0.0
    }
}

// MARK: - Itude
struct Itude: Codable {
  
    
}

typealias Locations = [Location]
