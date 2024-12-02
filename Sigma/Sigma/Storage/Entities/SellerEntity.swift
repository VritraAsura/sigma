import CoreData

@objc(SellerEntity)
public class SellerEntity: NSManagedObject {
    @NSManaged public var code: String
    @NSManaged public var name: String

    @NSManaged public var operations: [OperationEntity]
    @NSManaged public var orders: [OrderEntity]
}
