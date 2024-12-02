import Stevia
import UIKit

final class OrderRegisterViewController: UICodeViewController<OrderRegisterView> {
    // Properties

    let domain = CoreDataDomain()
    var order: OrderEntity?

    var client: ClientEntity?
    var seller: SellerEntity?
    var manufacturer: ManufacturerEntity?

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
        title = (order != nil ? "Editar" : "Novo") + " Pedido"
        let saveButton = UIBarButtonItem(
            title: "Salvar", style: .done,
            target: self, action: #selector(saveAction)
        )
        navigationItem.rightBarButtonItems = [saveButton]

        if order != nil {
            let deleteButton = UIBarButtonItem(
                title: "Excluir", style: .done,
                target: self, action: #selector(deleteAction)
            )
            navigationItem.rightBarButtonItems = [deleteButton, saveButton]
        }

        client = order?.client
        seller = order?.seller
        manufacturer = order?.manufacturer

        rootView.clientView.setAction { [weak self] in self?.selectClient() }
        rootView.sellerView.setAction { [weak self] in self?.selectSeller() }
        rootView.manufacturerView.setAction { [weak self] in self?.selectManufacturer() }
    }

    private func updateView() {
        if let client = client {
            rootView.clientView.update(model: client)
        }
        if let seller = seller {
            rootView.sellerView.update(model: seller)
        }
        if let manufacturer = manufacturer {
            rootView.manufacturerView.update(model: manufacturer)
        }
    }

    // Actions

    @objc private func saveAction() {
        guard let client = client, let seller = seller, let manufacturer = manufacturer else {
            print("Erro ao salvar operação")
            return
        }
        domain.addOrUpdate(entity: order) { s in
            s.date = order?.date ?? Date()
            s.model = rootView.modelTextField.string
            s.year = rootView.yearTextField.string
            s.color = rootView.colorTextField.string
            s.accessories = rootView.accessoriesTextField.string
            s.client = client
            s.seller = seller
            s.manufacturer = manufacturer
            s.price = NSDecimalNumber(decimal: rootView.priceTextField.decimal)
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        showDeleteAlert { [self] _ in
            domain.deleteEntity(order)
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

    private func selectManufacturer() {
        let controller = SelectionViewController()
        controller.type = .manufacturer
        controller.onSelection = { [weak self] _, model in
            self?.manufacturer = model as? ManufacturerEntity
        }
        navigationController?.pushViewController(controller, animated: true)
    }

}
