import UIKit

extension UIViewController {
    func showDeleteAlert(_ deletion: @escaping (UIAlertAction) -> Void) {
        let alert = UIOptionAlert(
            title: "Confirmar Exclusão",
            message: "Você deseja excluir esta Entidade",
            view: self
        )
        alert.addAction(style: .cancel, title: "Cancelar")
        alert.addAction(style: .destructive, title: "Excluir", handler: deletion)
        alert.present()
    }
}
