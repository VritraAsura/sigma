import Foundation

enum OperationModel: Decodable {
    case purchase(PurchaseOperation)
    case sales(SalesOperation)
}

struct PurchaseOperation: Decodable {
    let number: Int
    let date: Date
    let client: ClientModel
    let seller: SellerModel
    let vehicle: VehicleModel
    let price: Decimal
}

struct SalesOperation: Decodable {
    let number: Int
    let date: Date
    let client: ClientModel
    let seller: SellerModel
    let vehicle: VehicleModel
    let entryAmount: Decimal
    let financedAmount: Decimal
    let totalPrice: Decimal
}
