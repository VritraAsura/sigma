import Foundation

final class OperationDomain {
    // Properties

    private let coreData = CoreDataModel.shared

    // Functions

    func getOperations() -> [OperationEntity] {
        do {
            return try coreData.getEntities(OperationEntity.self)
        } catch let error {
            print(error)
            return []
        }
    }

    func createFinance(entryAmount: Decimal, financedAmount: Decimal) -> FinanceEntity? {
        do {
            let finance = try coreData.newEntity(FinanceEntity.self)
            finance.entryAmount = NSDecimalNumber(decimal: entryAmount)
            finance.financedAmount = NSDecimalNumber(decimal: financedAmount)
            try coreData.saveIfNeeded()
            return finance
        } catch let error {
            print(error)
            return nil
        }
    }

    func addOrUpdateOperation(
        uri: URL?, type: Int16, date: Date, totalPrice: Decimal,
        cliente: ClientEntity, seller: SellerEntity, vehicle: VehicleEntity,
        finance: FinanceEntity?
    ) {
        do {
            let operation: OperationEntity
            if let uri = uri {
                operation = try coreData.getEntity(OperationEntity.self, at: uri)
            } else {
                operation = try coreData.newEntity(OperationEntity.self)
            }
            operation.type = type
            operation.date = date
            operation.totalPrice = NSDecimalNumber(decimal: totalPrice)
            operation.cliente = cliente
            operation.seller = seller
            operation.vehicle = vehicle
            operation.finance = finance
            try coreData.saveIfNeeded()
        } catch let error {
            print(error)
        }
    }

    func deleteOperation(_ operation: OperationEntity) {
        do {
            let uri = operation.objectID.uriRepresentation()
            try coreData.remove(itemAt: uri)
        } catch let error {
            print(error)
        }
    }
}
