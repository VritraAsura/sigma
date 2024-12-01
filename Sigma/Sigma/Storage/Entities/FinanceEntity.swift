import CoreData

@objc(FinanceEntity)
public class FinanceEntity: NSManagedObject {
    @NSManaged public var entryAmount: NSDecimalNumber
    @NSManaged public var financedAmount: NSDecimalNumber
    @NSManaged public var operation: OperationEntity
}
