import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
    // Properties

    @NSManaged public var username: String
    @NSManaged public var password: String
    @NSManaged public var type: Int16

    // Functions

    func update(username: String, password: String, type: Int16) {
        self.username = username
        self.password = password
        self.type = type
    }
}
