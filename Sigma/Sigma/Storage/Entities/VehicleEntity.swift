import CoreData

@objc(VehicleEntity)
public class VehicleEntity: NSManagedObject {
    @NSManaged public var imageData: Data
    @NSManaged public var chassi: String
    @NSManaged public var brand: String
    @NSManaged public var model: String
    @NSManaged public var manufactureYear: String
    @NSManaged public var modelYear: String
    @NSManaged public var color: String
    @NSManaged public var plate: String
    @NSManaged public var price: NSDecimalNumber
    @NSManaged public var isAvailable: Bool
}
