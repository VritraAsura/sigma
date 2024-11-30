import Stevia
import UIKit

final class OperationItemCell: UICodeTableViewCell {
    // Views

    let infosStack = UIStackView(.vertical)
    let typeLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(
            infosStack.addArrangedSubviews(
                typeLabel
            )
        )
    }

    override func initLayout() {
        infosStack.fillContainer(padding: 32)
    }

    override func initStyle() {
        typeLabel.style { s in
            s.font = .systemFont(ofSize: 24)
        }
    }

    // Functions

    func update(model: OperationModel) {
        switch model {
        case .purchase:
            typeLabel.text = "Compra"
        case .sales:
            typeLabel.text = "Venda"
        }
    }
}
