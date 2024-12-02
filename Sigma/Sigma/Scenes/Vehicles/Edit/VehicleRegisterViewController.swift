import Stevia
import UIKit

final class VehicleRegisterViewController: UICodeViewController<VehicleRegisterView> {
    // Properties

    let domain = CoreDataDomain()
    var vehicle: VehicleEntity?

    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = vehicle == nil ? "Novo Veículo" : "Editar Veículo"
        let saveButton = UIBarButtonItem(
            title: "Salvar", style: .done,
            target: self, action: #selector(saveVehicle)
        )
        navigationItem.rightBarButtonItems = [saveButton]

        if let vehicle = vehicle {
            rootView.loadVehicle(vehicle)
            let deleteButton = UIBarButtonItem(
                title: "Excluir", style: .done,
                target: self, action: #selector(deletionConfirmation)
            )
            navigationItem.rightBarButtonItems = [deleteButton, saveButton]
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        rootView.vehicleImageView.addGestureRecognizer(tap)
        rootView.vehicleImageView.isUserInteractionEnabled = true
    }

    // Actions

    @objc private func selectImage() {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.image"], in: .open)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        present(documentPicker, animated: true, completion: nil)
    }
    
    @objc private func saveVehicle() {
        domain.addOrUpdate(entity: vehicle) { s in
            s.imageData = rootView.vehicleImageView.image?.pngData() ?? Data()
            s.chassi = rootView.chassiTextField.string
            s.brand = rootView.brandTextField.string
            s.model = rootView.modelTextField.string
            s.manufactureYear = rootView.manufactureYearTextField.string
            s.modelYear = rootView.modelYearTextField.string
            s.color = rootView.colorTextField.string
            s.plate = rootView.plateTextField.string
            s.price = NSDecimalNumber(decimal: rootView.priceTextField.decimal)
            s.isAvailable = vehicle?.isAvailable ?? true
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func deletionConfirmation() {
        showDeleteAlert { [self] _ in
            domain.deleteEntity(vehicle)
            navigationController?.popViewController(animated: true)
        }
    }
}

extension VehicleRegisterViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first, let data = try? Data(contentsOf: url) else { return }
        if let imagem = UIImage(data: data) {
            rootView.vehicleImageView.image = imagem
        }
    }
}
