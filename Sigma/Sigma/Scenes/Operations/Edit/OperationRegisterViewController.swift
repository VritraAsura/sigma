import Stevia
import UIKit

final class OperationRegisterViewController: UICodeViewController<OperationRegisterView> {
    // Properties

    let domain = CoreDataDomain()
    var operation: OperationEntity?

    var operationType: Int16 = 0

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let operationTitle = " Operação de " + (operationType == 0 ? "Venda" : "Compra")
        title = (operation != nil ? "Editar" : "Nova") + operationTitle

        let saveButton = UIBarButtonItem(
            title: "Salvar", style: .done,
            target: self, action: #selector(saveAction)
        )
        navigationItem.rightBarButtonItems = [saveButton]

        if let operation = operation {
//            rootView.loadVehicle(vehicle)
            let deleteButton = UIBarButtonItem(
                title: "Excluir", style: .done,
                target: self, action: #selector(deleteAction)
            )
            navigationItem.rightBarButtonItems = [deleteButton, saveButton]
        }
    }

    @objc private func saveAction() {
        domain.addOrUpdate(entity: operation) { s in
            s.type = operation?.type ?? operationType
            s.date = operation?.date ?? Date()
//            s.entryAmount = rootView
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        showDeleteAlert { [self] _ in
            domain.deleteEntity(operation)
            navigationController?.popViewController(animated: true)
        }
    }
}
