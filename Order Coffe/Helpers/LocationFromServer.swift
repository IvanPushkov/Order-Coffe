import Foundation

// MARK: - Location
struct Location: Codable {
    let id: Int
    let name: String
    let point: Point
}

// MARK: - Point
struct Point: Codable {
    let latitude, longitude: Itude
}

// MARK: - Itude
struct Itude: Codable {
}

typealias Locations = [Location]
