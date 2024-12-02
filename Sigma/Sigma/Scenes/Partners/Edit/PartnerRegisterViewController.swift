import Stevia
import UIKit

final class PartnerRegisterViewController: UICodeViewController<PartnerRegisterView> {
    // Properties

    let domain = CoreDataDomain()
    var selectedPartnerType: PartnersViewController.PartnerType = .client
    var partner: NSManagedObject?

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let saveButton = UIBarButtonItem(
            title: "Salvar", style: .done,
            target: self, action: #selector(saveAction)
        )
        navigationItem.rightBarButtonItems = [saveButton]

        title = (partner != nil ? "Editar " : "Novo " ) + selectedPartnerType.title

        if partner != nil {
            let deleteButton = UIBarButtonItem(
                title: "Excluir", style: .done,
                target: self, action: #selector(deleteAction)
            )
            navigationItem.rightBarButtonItems = [deleteButton, saveButton]
        }

        switch selectedPartnerType {
        case .client:
            rootView.loadClient(partner as? ClientEntity)
        case .seller:
            rootView.loadSeller(partner as? SellerEntity)
        case .manufacturer:
            rootView.loadManufacturer(partner as? ManufacturerEntity)
        }
    }

    @objc private func saveAction() {
        switch selectedPartnerType {
        case .client:
            domain.addOrUpdate(entity: partner as? ClientEntity) { s in
                s.cpf = rootView.codeTextField.string
                s.name = rootView.nameTextField.string
                s.income = NSDecimalNumber(decimal: rootView.incomeTextField.decimal)
                s.neighborhood = rootView.neighborhoodTextField.string
                s.city = rootView.cityTextField.string
                s.state = rootView.stateTextField.string
                s.homePhone = rootView.homePhoneTextField.string
                s.cellphone = rootView.cellphoneTextField.string
            }
        case .seller:
            domain.addOrUpdate(entity: partner as? SellerEntity) { s in
                s.code = rootView.codeTextField.string
                s.name = rootView.nameTextField.string
            }
        case .manufacturer:
            domain.addOrUpdate(entity: partner as? ManufacturerEntity) { s in
                s.cnpj = rootView.codeTextField.string
                s.name = rootView.nameTextField.string
                s.brand = rootView.brandTextField.string
                s.email = rootView.emailTextField.string
                s.comertialPhone = rootView.homePhoneTextField.string
                s.cellphone = rootView.cellphoneTextField.string
            }
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        showDeleteAlert { [self] _ in
            domain.deleteEntity(partner)
            navigationController?.popViewController(animated: true)
        }
    }
}
