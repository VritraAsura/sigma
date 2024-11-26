import Stevia
import UIKit

final class HomeOptionsViewController: UICodeViewController<HomeOptionsView> {

    lazy var profileNavigation = UINavigationController(rootViewController: profileController)
    lazy var profileController = UIViewController()

    lazy var salesNavigation = UINavigationController(rootViewController: salesController)
    lazy var salesController = VehiclesSalesViewController()

    lazy var partnersNavigation = UINavigationController(rootViewController: partnersController)
    lazy var partnersController = UIViewController()

    override func viewDidLoad() {
        rootView.profileItem.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)
        rootView.salesItem.addTarget(self, action: #selector(didTapSales), for: .touchUpInside)
        rootView.partnersItem.addTarget(self, action: #selector(didTapPartners), for: .touchUpInside)
    }

    @objc private func didTapProfile() {
        profileController.view.backgroundColor = .systemBlue
        splitViewController?.showDetailViewController(profileNavigation, sender: nil)
    }

    @objc private func didTapSales() {
        salesController.view.backgroundColor = .systemGreen
        splitViewController?.showDetailViewController(salesNavigation, sender: nil)
    }

    @objc private func didTapPartners() {
        partnersController.view.backgroundColor = .systemRed
        splitViewController?.showDetailViewController(partnersNavigation, sender: nil)
    }
}
