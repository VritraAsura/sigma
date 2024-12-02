import Stevia
import UIKit

final class OrdersViewController: UICodeViewController<OrdersView> {

    let domain = CoreDataDomain()
    var orders: [OrderEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectSelectedRow(animated: true)
        orders = domain.getEntities()
        rootView.tableView.reloadData()
    }

    private func setupView() {
        title = "Perdidos realizados"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Criar Pedido", style: .done,
            target: self, action: #selector(newOrderAction)
        )
    }

    @objc private func newOrderAction() {
        let controller = OrderRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(OrderItemCell.self)
        let order = orders[indexPath.row]
        cell.update(model: order)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = OrderRegisterViewController()
        controller.order = orders[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
