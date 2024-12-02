import CoreData

@objc(OrderEntity)
public class OrderEntity: NSManagedObject {
    @NSManaged public var date: Date
    @NSManaged public var model: String
    @NSManaged public var year: String
    @NSManaged public var color: String
    @NSManaged public var accessories: String
    @NSManaged public var client: ClientEntity
    @NSManaged public var seller: SellerEntity
    @NSManaged public var manufacturer: ManufacturerEntity
    @NSManaged public var price: NSDecimalNumber
}
