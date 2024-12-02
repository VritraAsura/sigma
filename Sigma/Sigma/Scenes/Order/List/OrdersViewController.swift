import Stevia
import UIKit

final class OrdersViewController: UICodeViewController<OrdersView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectSelectedRow(animated: true)
    }

    private func setupView() {
        title = "Veículos disponíveis"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Adicionar", style: .done,
            target: self, action: #selector(newOperationAction)
        )
    }

    @objc private func newOperationAction() {
        let controller = OrderRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(OrderItemCell.self)
//        let order = orders[indexPath.row]
//        cell.update(model: order)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = OrderRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
