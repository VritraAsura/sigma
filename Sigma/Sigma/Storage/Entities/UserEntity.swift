import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
    @NSManaged public var username: String
    @NSManaged public var password: String
    @NSManaged public var type: Int16
}
