import Stevia
import UIKit

final class OperationItemCell: UICodeTableViewCell {
    // Views

    let infosStack = UIStackView(.vertical)
    let typeLabel = UILabel()
    let clientLabel = UILabel()
    let sellerLabel = UILabel()
    let vehicleLabel = UILabel()
    let priceLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(
            infosStack.addArrangedSubviews(
                typeLabel,
                clientLabel,
                sellerLabel,
                vehicleLabel,
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
        typeLabel.style { s in
            s.font = .boldSystemFont(ofSize: 24)
        }
        clientLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        sellerLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        vehicleLabel.style { s in
            s.font = .systemFont(ofSize: 18)
        }
        priceLabel.style { s in
            s.font = .boldSystemFont(ofSize: 16)
        }
    }

    // Functions

    func update(model: OperationEntity) {
        switch model.type {
        case 0:
            typeLabel.text = "Venda"
        default:
            typeLabel.text = "Compra"
        }
        clientLabel.text = "Cliente: " + model.client.name
        sellerLabel.text = "Vendedor: " + model.seller.name
        vehicleLabel.text = "Veículo: " + model.vehicle.brand + " " + model.vehicle.model
        priceLabel.text = model.totalPrice.decimalValue.brlFormatted
    }
}
