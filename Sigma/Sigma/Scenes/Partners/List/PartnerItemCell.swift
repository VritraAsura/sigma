import Stevia
import UIKit

final class PartnerItemCell: UICodeTableViewCell {
    // Views

    let itemView = PartnerItemView()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(itemView)
        itemView.fillContainer()
    }

    // Functions

    func update(model: NSManagedObject) {
        itemView.update(model: model)
    }
}

final class PartnerItemView: UICodeView {
    // Views

    let infosStack = UIStackView(.vertical)
    let nameLabel = UILabel()
    let codeLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        subviews(
            infosStack.addArrangedSubviews(
                nameLabel,
                codeLabel
            )
        )
    }

    override func initLayout() {
        infosStack.fillContainer(padding: 32)
    }

    override func initStyle() {
        nameLabel.style { s in
            s.font = .systemFont(ofSize: 24)
        }
        codeLabel.style { s in
            s.font = .systemFont(ofSize: 16)
        }
    }

    // Functions

    func update(model: NSManagedObject) {
        if let model = model as? ClientEntity {
            nameLabel.text = model.name
            codeLabel.text = model.cpf
        } else if let model = model as? SellerEntity {
            nameLabel.text = model.name
            codeLabel.text = model.code
        } else if let model = model as? ManufacturerEntity {
            nameLabel.text = model.name
            codeLabel.text = model.cnpj
        }
    }
}
