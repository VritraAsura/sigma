import Stevia
import UIKit

final class OrderItemCell: UICodeTableViewCell {
    // Views

    let infosStack = UIStackView(.vertical)

    let modelLabel = UILabel()
    let colorLabel = UILabel()
    let accessoriesLabel = UILabel()

    let clientLabel = UILabel()
    let sellerLabel = UILabel()

    let priceLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(
            infosStack.addArrangedSubviews(
                modelLabel,
                colorLabel,
                accessoriesLabel,
                clientLabel,
                sellerLabel,
                priceLabel
            )
        )
    }

    override func initLayout() {
        infosStack.fillContainer(padding: 32)
    }

    override func initStyle() {
        infosStack.style { s in
            s.spacing = 8
        }
        modelLabel.style { s in
            s.font = .boldSystemFont(ofSize: 24)
        }
        colorLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        accessoriesLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        clientLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        sellerLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        priceLabel.style { s in
            s.font = .boldSystemFont(ofSize: 16)
        }
    }

    // Functions

    func update(model: OrderEntity) {
        modelLabel.text = "Veículo: " + model.manufacturer.brand + " " + model.model
        colorLabel.text = "Cor: " + model.color
        accessoriesLabel.text = "Acessórios: " + model.accessories
        clientLabel.text = "Cliente: " + model.client.name
        sellerLabel.text = "Vendedor: " + model.seller.name
        priceLabel.text = model.price.decimalValue.brlFormatted
    }
}
