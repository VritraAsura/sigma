import Foundation

struct OrderModel: Decodable {
    let number: Int
    let date: Date
    let client: ClientModel
    let seller: SellerModel
    let manufacturer: ManufacturerModel
    let model: String
    let year: String
    let color: String
    let accessories: String
    let price: String
}
