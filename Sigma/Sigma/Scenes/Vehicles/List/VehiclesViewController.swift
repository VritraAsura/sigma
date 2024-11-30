import Stevia
import UIKit

final class VehiclesViewController: UICodeViewController<VehiclesView> {

    var vehicles: [VehicleModel] = [
        .mock,
        .mock,
        .mock,
        .mock,
        .mock,
        .mock,
        .mock,
        .mock
    ]

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectSelectedRow(animated: true)
    }

    // Functions

    private func setupView() {
        title = "Veículos disponíveis"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Adicionar", style: .done,
            target: self, action: #selector(newVehicleAction)
        )
    }

    @objc private func newVehicleAction() {
        let controller = VehicleRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension VehiclesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(VehicleItemCell.self)
        let vehicle = vehicles[indexPath.row]
        cell.update(model: vehicle)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = VehicleRegisterViewController()
        controller.vehicle = vehicles[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
