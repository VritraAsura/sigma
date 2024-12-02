import CoreData

final class CoreDataDomain {
    // Properties

    private let coreData = CoreDataModel.shared

    // Functions

    func getEntities<T: NSManagedObject>(predicate: NSPredicate? = nil) -> [T] {
        do {
            if let predicate = predicate {
                return try coreData.getEntities(T.self, predicate: predicate)
            } else {
                return try coreData.getEntities(T.self)
            }
        } catch let error {
            print(error)
            return []
        }
    }

    func addOrUpdate<T: NSManagedObject>(entity type: T?, _ update: (T) -> Void) {
        do {
            let entity: T
            if let uri = type?.objectID.uriRepresentation() {
                entity = try coreData.getEntity(T.self, at: uri)
            } else {
                entity = try coreData.newEntity(T.self)
            }
            update(entity)
            try coreData.saveIfNeeded()
        } catch let error {
            print(error)
        }
    }

    func deleteEntity(_ entity: NSManagedObject?) {
        guard let uri = entity?.objectID.uriRepresentation() else { return }
        do {
            try coreData.remove(itemAt: uri)
        } catch let error {
            print(error)
        }
    }
}
