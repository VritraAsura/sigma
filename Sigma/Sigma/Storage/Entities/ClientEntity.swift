import CoreData

@objc(ClientEntity)
public class ClientEntity: NSManagedObject {
    @NSManaged public var cpf: String
    @NSManaged public var name: String
    @NSManaged public var income: NSDecimalNumber
    @NSManaged public var neighborhood: String
    @NSManaged public var city: String
    @NSManaged public var state: String
    @NSManaged public var homePhone: String?
    @NSManaged public var cellphone: String

    @NSManaged public var operations: [OperationEntity]
    @NSManaged public var orders: [OrderEntity]
}
