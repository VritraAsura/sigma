import Stevia
import UIKit

final class OperationsView: UICodeView {
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
