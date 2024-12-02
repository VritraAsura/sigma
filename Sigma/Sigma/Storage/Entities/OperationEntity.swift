import CoreData

@objc(OperatioEntity)
public class OperationEntity: NSManagedObject {
    @NSManaged public var type: Int16
    @NSManaged public var date: Date
    @NSManaged public var client: ClientEntity
    @NSManaged public var seller: SellerEntity
    @NSManaged public var vehicle: VehicleEntity
    @NSManaged public var entryAmount: NSDecimalNumber?
    @NSManaged public var financedAmount: NSDecimalNumber?
    @NSManaged public var totalPrice: NSDecimalNumber
}
