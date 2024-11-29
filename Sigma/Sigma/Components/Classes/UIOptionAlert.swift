import UIKit

public class UIOptionAlert {

    // Properties

    public let alert: UIAlertController
    public weak var view: UIViewController?

    // Lifecycle

    public init(title: String, message: String, view: UIViewController?) {
        self.view = view
        self.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }

    // Functions

    @discardableResult
    public func addAction(style: UIAlertAction.Style, title: String, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        alert.addAction(action)
        return self
    }

    public func present() {
        DispatchQueue.main.async {
            self.view?.present(self.alert, animated: true)
        }
    }
}
