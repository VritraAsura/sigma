import CoreData

// MARK: - CoreDataStoring

public protocol CoreDataStoring {
    var persistentContainer: NSPersistentContainer { get }

    func getEntity<T: NSManagedObject>(_ type: T.Type, at uri: URL) throws -> T
    func getEntities<T: NSManagedObject>(_ type: T.Type) throws -> [T]
    func getEntities<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate) throws -> [T]
    func newEntity<T: NSManagedObject>(_ type: T.Type) throws -> T
    func insert(object: NSManagedObject) throws
    func saveIfNeeded() throws
    func remove(itemAt uri: URL) throws
}

extension CoreDataStoring {
    public func getEntity<T: NSManagedObject>(_ type: T.Type, at uri: URL) throws -> T {
        let coordinator = persistentContainer.persistentStoreCoordinator
        let context = persistentContainer.viewContext
        guard let objectID = coordinator.managedObjectID(forURIRepresentation: uri),
              let entity = context.object(with: objectID) as? T
        else { throw CoreDataError.error }
        return entity
    }

    public func getEntities<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate) throws -> [T] {
        let context = persistentContainer.viewContext
        let request = type.fetchRequestEntity()
        request.predicate = predicate
        return try context.fetch(request).compactMap({ $0 as? T })
    }

    public func getEntities<T: NSManagedObject>(_ type: T.Type) throws -> [T] {
        let context = persistentContainer.viewContext
        let request = type.fetchRequestEntity()
        return try context.fetch(request).compactMap({ $0 as? T })
    }

    public func newEntity<T: NSManagedObject>(_ type: T.Type) throws -> T {
        let context = persistentContainer.viewContext

        guard let entityDescription = NSEntityDescription.entity(forEntityName: type.entityName, in: context)
        else { throw CoreDataError.error }

        return T(entity: entityDescription, insertInto: context)
    }

    public func insert(object: NSManagedObject) throws {
        let context = persistentContainer.viewContext
        context.insert(object)
        try saveIfNeeded()
    }

    public func saveIfNeeded() throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }

    public func remove(itemAt uri: URL) throws {
        let coordinator = persistentContainer.persistentStoreCoordinator
        let context = persistentContainer.viewContext

        guard let objectID = coordinator.managedObjectID(forURIRepresentation: uri)
        else { throw CoreDataError.error }

        let entity = context.object(with: objectID)
        context.delete(entity)
        try saveIfNeeded()
    }
}

// MARK: - Supporting

extension NSManagedObject {
    public static var entityName: String {
        return String(describing: self)
    }
    public static func fetchRequestEntity() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest(entityName: entityName)
    }
}

public enum CoreDataError: Error {
    case error
}
