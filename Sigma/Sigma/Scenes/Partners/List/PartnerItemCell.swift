import Stevia
import UIKit

final class PartnerItemCell: UICodeTableViewCell {
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

    func update(model: PartnerModel) {
        switch model {
        case .client:
            typeLabel.text = "Cliente"
        case .seller:
            typeLabel.text = "Vendedor"
        case .manufacturer:
            typeLabel.text = "Montadora"
        }
    }
}
