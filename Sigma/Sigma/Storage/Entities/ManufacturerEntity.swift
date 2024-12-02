import CoreData

@objc(ManufacturerEntity)
public class ManufacturerEntity: NSManagedObject {
    @NSManaged public var cnpj: String
    @NSManaged public var name: String
    @NSManaged public var brand: String
    @NSManaged public var email: String
    @NSManaged public var comertialPhone: String
    @NSManaged public var cellphone: String

    @NSManaged public var orders: [OrderEntity]
}
