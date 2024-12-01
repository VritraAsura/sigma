// FIXME: Excluir depois de implementar CoreData

import Foundation

extension OperationModel {
    static var purchaseMock: OperationModel {
        OperationModel.purchase(
            PurchaseOperation(
                number: 1,
                date: Date(),
                client: .mock,
                seller: .mock,
                vehicle: .mock,
                price: 12_000
            )
        )
    }

    static var saleMock: OperationModel {
        OperationModel.sales(
            SalesOperation(
                number: 1,
                date: Date(),
                client: .mock,
                seller: .mock,
                vehicle: .mock,
                entryAmount: 2_000,
                financedAmount: 10_000,
                totalPrice: 12_000
            )
        )
    }
}

extension ClientModel {
    static var mock: ClientModel {
        ClientModel(
            cpf: "000.111.222-33",
            nome: "Fulano Beltrano da Silva",
            address: AddressModel(
                neighborhood: "Da Paz",
                city: "Manaus",
                state: "AM"
            ),
            homePhone: "31",
            cellphone: "(92) 99191-9191",
            income: "R$ 1.400,00"
        )
    }
}

extension SellerModel {
    static var mock: SellerModel {
        SellerModel(
            code: "1234567890",
            user: "vendedor"
        )
    }
}

extension VehicleModel {
    static var mock: VehicleModel {
        VehicleModel(
            imageData: Data(),
            chassi: "D2392HWD9U0DJ1WS10",
            brand: "NVIDEA",
            model: "RTX 4090",
            manufactureYear: "2023",
            modelYear: "2024",
            color: "Verde",
            plate: "RTX-4090",
            price: 12_000,
            isAvailable: true
        )
    }
}

extension OrderModel {
    static var mock: OrderModel {
        OrderModel(
            number: 1,
            date: Date(),
            client: .mock,
            seller: .mock,
            manufacturer: .mock,
            model: "Honda",
            year: "City",
            color: "Cinza",
            accessories: "Nenhum",
            price: 70_000
        )
    }
}

extension ManufacturerModel {
    static var mock: ManufacturerModel {
        ManufacturerModel(
            cnpj: "11.111.111.0001-01",
            name: "Name",
            brand: "Honda",
            email: "honda@honda.com",
            comertialPhone: "31",
            cellphone: "92992929292"
        )
    }
}
