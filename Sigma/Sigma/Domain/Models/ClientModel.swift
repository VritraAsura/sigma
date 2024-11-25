import Foundation

struct ClientModel: Decodable {
    let cpf: String
    let nome: String
    let address: AddressModel
    let homePhone: String?
    let cellphone: String
    let income: String
}

struct AddressModel: Decodable {
    let neighborhood: String
    let city: String
    let state: String
}
