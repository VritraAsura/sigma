import Stevia
import UIKit

final class SelectionView: UICodeView {
    let searchBar = UISearchBar()
    let tableView = UITableView()

    override func initSubviews() {
        subviews(
            searchBar,
            tableView
        )
    }

    override func initLayout() {
        searchBar.leading(64).trailing(64).Top == safeAreaLayoutGuide.Top + 32
        searchBar.height(48).Bottom == tableView.Top - 32
        tableView.fillHorizontally().bottom(0)
    }

    override func initStyle() {
        self.style { s in
            s.backgroundColor = .systemBackground
        }
        searchBar.style { s in
            s.placeholder = "Buscar por nome"
        }
    }
}
