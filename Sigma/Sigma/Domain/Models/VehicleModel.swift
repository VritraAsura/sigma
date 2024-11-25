import Foundation

struct VehicleModel: Decodable {
    let chassi: String
    let plate: String
    let brand: String
    let model: String
    let manufactureYear: String
    let modelYear: String
    let color: String
    let price: Decimal
}
