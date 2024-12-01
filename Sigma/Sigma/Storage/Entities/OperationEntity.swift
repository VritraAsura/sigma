import CoreData

@objc(OperatioEntity)
public class OperationEntity: NSManagedObject {
    @NSManaged public var type: Int16
    @NSManaged public var date: Date
    @NSManaged public var cliente: ClientEntity
    @NSManaged public var seller: SellerEntity
    @NSManaged public var vehicle: VehicleEntity
    @NSManaged public var finance: FinanceEntity?
    @NSManaged public var totalPrice: NSDecimalNumber
}
