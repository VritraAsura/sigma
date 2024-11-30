import Stevia
import UIKit

final class HomeSplitViewController: UISplitViewController {
    // Controllers

    let primaryController = HomeOptionsViewController()

    // Lifecycle

    override func viewDidLoad() {
        self.viewControllers = [primaryController]
        self.preferredDisplayMode = .oneBesideSecondary
        self.minimumPrimaryColumnWidth = 375
        self.maximumPrimaryColumnWidth = 375
        primaryController.rootView.vehiclesItem.sendActions(for: .touchUpInside)
    }
}
