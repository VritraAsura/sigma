import UIKit
import Stevia

final class OperationsViewController: UICodeViewController<OperationsView> {

    let domain = CoreDataDomain()
    var operations: [OperationEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectSelectedRow(animated: true)
    }

    private func setupView() {
        title = "Operações de compra e venda"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        let newPurchase = UIBarButtonItem(
            title: "Nova Compra", style: .done,
            target: self, action: #selector(newPurchaseAction)
        )
        let newSale = UIBarButtonItem(
            title: "Nova Venda", style: .done,
            target: self, action: #selector(newSaleAction)
        )
        navigationItem.rightBarButtonItems = [newSale, newPurchase]
    }

    @objc private func newPurchaseAction() {
        let controller = OperationRegisterViewController()
        controller.operationType = 0
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func newSaleAction() {
        let controller = OperationRegisterViewController()
        controller.operationType = 1
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension OperationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(OperationItemCell.self)
        let operation = operations[indexPath.row]
        cell.update(model: operation)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = OperationRegisterViewController()
        let operation = operations[indexPath.row]
        controller.operation = operation
        navigationController?.pushViewController(controller, animated: true)
    }
}
