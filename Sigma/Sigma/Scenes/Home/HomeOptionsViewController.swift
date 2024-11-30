import Stevia
import UIKit

final class HomeOptionsViewController: UICodeViewController<HomeOptionsView> {

    lazy var profileNavigation = UINavigationController(rootViewController: UIViewController())
    lazy var vehiclesNavigation = UINavigationController(rootViewController: VehiclesViewController())
    lazy var operationsNavigation = UINavigationController(rootViewController: OperationsViewController())
    lazy var ordersNavigation = UINavigationController(rootViewController: OrdersViewController())
    lazy var partnersNavigation = UINavigationController(rootViewController: PartnersViewController())
    lazy var logsNavigation = UINavigationController(rootViewController: LogsViewController())

    override func viewDidLoad() {
        rootView.profileItem.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)
        rootView.vehiclesItem.addTarget(self, action: #selector(didTapSales), for: .touchUpInside)
        rootView.operationsItem.addTarget(self, action: #selector(didTapOperations), for: .touchUpInside)
        rootView.requestsItem.addTarget(self, action: #selector(didTapRequests), for: .touchUpInside)
        rootView.partnersItem.addTarget(self, action: #selector(didTapPartners), for: .touchUpInside)
        rootView.logsItem.addTarget(self, action: #selector(didTapLogs), for: .touchUpInside)
    }

    @objc private func didTapProfile() {
        splitViewController?.showDetailViewController(profileNavigation, sender: nil)
    }

    @objc private func didTapSales() {
        splitViewController?.showDetailViewController(vehiclesNavigation, sender: nil)
    }

    @objc private func didTapOperations() {
        splitViewController?.showDetailViewController(operationsNavigation, sender: nil)
    }

    @objc private func didTapRequests() {
        splitViewController?.showDetailViewController(ordersNavigation, sender: nil)
    }

    @objc private func didTapPartners() {
        splitViewController?.showDetailViewController(partnersNavigation, sender: nil)
    }

    @objc private func didTapLogs() {
        splitViewController?.showDetailViewController(logsNavigation, sender: nil)
    }
}
