import Stevia
import UIKit

final class OperationRegisterViewController: UICodeViewController<OperationRegisterView> {
    // Properties

    let domain = CoreDataDomain()
    var operation: OperationEntity?

    var client: ClientEntity?
    var seller: SellerEntity?
    var vehicle: VehicleEntity?

    var operationType: Int16 = 0

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }

    private func setupView() {
        let operationTitle = " Operação de " + (operationType == 0 ? "Venda" : "Compra")
        title = (operation != nil ? "Editar" : "Nova") + operationTitle

        let saveButton = UIBarButtonItem(
            title: "Salvar", style: .done,
            target: self, action: #selector(saveAction)
        )
        navigationItem.rightBarButtonItems = [saveButton]

        if operation != nil {
            let deleteButton = UIBarButtonItem(
                title: "Excluir", style: .done,
                target: self, action: #selector(deleteAction)
            )
            navigationItem.rightBarButtonItems = [deleteButton, saveButton]
        }

        client = operation?.client
        seller = operation?.seller
        vehicle = operation?.vehicle

        rootView.clientView.setAction { [weak self] in self?.selectClient() }
        rootView.sellerView.setAction { [weak self] in self?.selectSeller() }
        rootView.vehicleView.setAction { [weak self] in self?.selectVehicle() }

        switch operationType {
        case 0: rootView.loadSaleOperation(operation)
        default: rootView.loadPurchaseOperation(operation)
        }
    }

    private func updateView() {
        if let client = client {
            rootView.clientView.update(model: client)
        }
        if let seller = seller {
            rootView.sellerView.update(model: seller)
        }
        if let vehicle = vehicle {
            rootView.vehicleView.update(model: vehicle)
        }
    }

    // Actions

    @objc private func saveAction() {
        guard let client = client, let seller = seller, let vehicle = vehicle else {
            print("Erro ao salvar operação")
            return
        }
        domain.addOrUpdate(entity: operation) { s in
            s.type = operation?.type ?? operationType
            s.date = operation?.date ?? Date()
            s.client = client
            s.seller = seller
            s.vehicle = vehicle
            s.entryAmount = NSDecimalNumber(decimal: rootView.entryTextField.decimal)
            s.financedAmount = NSDecimalNumber(decimal: rootView.financeTextField.decimal)
            s.totalPrice = NSDecimalNumber(decimal: rootView.totalTextField.decimal)
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        showDeleteAlert { [self] _ in
            domain.deleteEntity(operation)
            navigationController?.popViewController(animated: true)
        }
    }

    private func selectClient() {
        let controller = SelectionViewController()
        controller.type = .client
        controller.onSelection = { [weak self] _, model in
            self?.client = model as? ClientEntity
        }
        navigationController?.pushViewController(controller, animated: true)
    }

    private func selectSeller() {
        let controller = SelectionViewController()
        controller.type = .seller
        controller.onSelection = { [weak self] _, model in
            self?.seller = model as? SellerEntity
        }
        navigationController?.pushViewController(controller, animated: true)
    }

    private func selectVehicle() {
        let controller = SelectionViewController()
        controller.type = .vehicle
        controller.onSelection = { [weak self] _, model in
            self?.vehicle = model as? VehicleEntity
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
