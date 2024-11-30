import UIKit
import Stevia

final class OperationsViewController: UICodeViewController<OperationsView> {

    var operations: [OperationModel] = [
        .purchaseMock,
        .purchaseMock,
        .purchaseMock,
        .saleMock,
        .saleMock,
        .saleMock
    ]

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
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Adicionar", style: .done,
            target: self, action: #selector(newOperationAction)
        )
    }

    @objc private func newOperationAction() {
        let controller = OperationRegisterViewController()
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
        navigationController?.pushViewController(controller, animated: true)
    }
}
