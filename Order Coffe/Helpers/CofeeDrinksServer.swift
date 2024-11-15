import Foundation

// MARK: - CofeeDrink
struct CofeeDrink: Codable {
    let id: Int
    let name, imageURL: String
    let price: Int
}
typealias CofeeDrinks = [CofeeDrink]

