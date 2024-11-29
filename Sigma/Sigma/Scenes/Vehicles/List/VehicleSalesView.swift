import Stevia
import UIKit

final class VehicleSalesView: UICodeView {
    // Views

    let tableView = UITableView()

    override func initSubviews() {
        subviews(
            tableView
        )
    }

    override func initLayout() {
        tableView.fillContainer()
    }
}
