import Stevia
import UIKit

final class OrderItemCell: UICodeTableViewCell {
    // Views

    let infosStack = UIStackView(.vertical)
    let modelLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(
            infosStack.addArrangedSubviews(
                modelLabel
            )
        )
    }

    override func initLayout() {
        infosStack.fillContainer(padding: 32)
    }

    override func initStyle() {
        modelLabel.style { s in
            s.font = .systemFont(ofSize: 24)
        }
    }

    // Functions

    func update(model: OrderModel) {
        modelLabel.text = model.model
    }
}
