import Stevia
import UIKit

final class PartnersView: UICodeView {

    let segmentedControl = UISegmentedControl()
    let tableView = UITableView()

    override func initSubviews() {
        subviews(
            segmentedControl,
            tableView
        )
    }

    override func initLayout() {
        segmentedControl.leading(64).trailing(64).Top == safeAreaLayoutGuide.Top + 32
        segmentedControl.height(48).Bottom == tableView.Top - 32
        tableView.fillHorizontally().bottom(0)
    }

    override func initStyle() {
        self.style { s in
            s.backgroundColor = .systemBackground
        }
        segmentedControl.style { s in
            s.setTitleTextAttributes([
                .font: UIFont.boldSystemFont(ofSize: 24),
                .foregroundColor: UIColor.label
            ], for: .normal)
            s.insertSegment(withTitle: "Clientes", at: 0, animated: false)
            s.insertSegment(withTitle: "Vendedores", at: 1, animated: false)
            s.insertSegment(withTitle: "Montadoras", at: 2, animated: false)
            s.selectedSegmentIndex = 0
        }
    }
}
