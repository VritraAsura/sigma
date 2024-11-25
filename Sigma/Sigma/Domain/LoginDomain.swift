import CoreData

public final class LoginDomain {
    // Properties

    private let coreData = CoreDataModel.shared

    // Functions

    public func doLogin(username: String, password: String) -> Bool {
        let user = validate(username: username, password: password)
        guard let user = user else { return false }
        // TODO: Save user loged in
        return true
    }

    // Private Functions

    private func validate(username: String, password: String) -> UserEntity? {
        do {
            let predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
            let list = try coreData.getEntities(UserEntity.self, predicate: predicate)
            return list.first
        } catch let error {
            print(error)
            return nil
        }
    }
}
