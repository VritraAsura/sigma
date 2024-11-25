import CoreData

public class CoreDataModel: CoreDataStoring {
    // Properties

    public static let shared = CoreDataModel()

    public var persistentContainer: NSPersistentContainer

    // Lifecycle

    public init() {
        let modelName = "CoreDataModel"

        guard let modelURL = Bundle(for: type(of: self)).url(forResource: modelName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL)
        else { fatalError() }

        let container = NSPersistentContainer(name: modelName, managedObjectModel: model)

        container.loadPersistentStores { storeDescription, error in
            print(storeDescription)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        self.persistentContainer = container
    }
}
