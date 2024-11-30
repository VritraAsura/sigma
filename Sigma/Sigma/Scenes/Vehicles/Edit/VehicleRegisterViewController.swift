import Stevia
import UIKit

final class VehicleRegisterViewController: UICodeViewController<VehicleRegisterView> {
    // Properties

    var vehicle: VehicleModel?

    lazy var deletionAlert = UIOptionAlert(
        title: "Confirmar Exclusão",
        message: "Você deseja excluir este veículo",
        view: self
    )

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

        deletionAlert.addAction(style: .cancel, title: "Cancelar")
        deletionAlert.addAction(style: .destructive, title: "Excluir") { [weak self] _ in
            self?.deleteVehicle()
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
        print("Salvar")
        navigationController?.popViewController(animated: true)
    }

    @objc private func deletionConfirmation() {
        deletionAlert.present()
    }

    private func deleteVehicle() {
        print("Excluir")
        navigationController?.popViewController(animated: true)
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
