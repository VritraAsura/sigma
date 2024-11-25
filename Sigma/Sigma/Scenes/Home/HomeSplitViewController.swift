import Stevia
import UIKit

final class HomeSplitViewController: UISplitViewController {
    // Controllers

    let primaryController = HomeOptionsViewController()


    let primaryNavigation = UINavigationController(rootViewController: UIViewController())

    // Lifecycle

    override func viewDidLoad() {
        viewControllers = [primaryController]
        preferredDisplayMode = .oneBesideSecondary
    }
}

extension HomeSplitViewController: UISplitViewControllerDelegate {

}
