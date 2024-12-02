import Stevia
import UIKit

final class VehicleItemCell: UICodeTableViewCell {
    // Views

    let itemView = VehicleItemView()

    // Lifecycle

    override func initSubviews() {
        contentView.subviews(itemView)
        itemView.fillContainer()
    }

    // Functions

    func update(model: VehicleEntity) {
        itemView.update(model: model)
    }
}

final class VehicleItemView: UICodeView {
    // Views

    let vehicleImageView = UIImageView()

    let infosStack = UIStackView(.vertical)
    let nameLabel = UILabel()
    let yearLabel = UILabel()
    let plateLabel = UILabel()
    let colorLabel = UILabel()
    let priceLabel = UILabel()
    let chassiLabel = UILabel()

    // Lifecycle

    override func initSubviews() {
        subviews(
            vehicleImageView,
            infosStack.addArrangedSubviews(
                nameLabel,
                yearLabel,
                plateLabel,
                colorLabel,
                priceLabel,
                chassiLabel
            )
        )
    }

    override func initLayout() {
        vehicleImageView.width(40%).aspectRatio(16.0/9.0).centerVertically().top(>=32).bottom(>=32).leading(32)
        vehicleImageView.Trailing == infosStack.Leading - 32
        infosStack.centerVertically().top(>=32).bottom(>=32).trailing(32)
    }

    override func initStyle() {
        style { s in
            s.backgroundColor = .clear
        }
        vehicleImageView.style { s in
            s.clipsToBounds = true
            s.contentMode = .scaleAspectFill
            s.backgroundColor = .systemGray
        }
        nameLabel.style { s in
            s.font = .systemFont(ofSize: 24)
        }
        infosStack.style { s in
            s.spacing = 8
        }
    }

    // Functions

    func update(model: VehicleEntity) {
        vehicleImageView.image = UIImage(data: model.imageData)
        nameLabel.text = "\(model.brand) \(model.model)"
        yearLabel.text = "Ano: \(model.manufactureYear) \(model.modelYear)"
        plateLabel.text = "Placa: \(model.plate)"
        colorLabel.text = "Cor: \(model.color)"
        priceLabel.text = "Preço: \(model.price.decimalValue.brlFormatted)"
        chassiLabel.text = "Chassi: \(model.chassi)"
    }
}
