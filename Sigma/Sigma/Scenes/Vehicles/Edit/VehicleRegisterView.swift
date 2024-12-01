import Stevia
import UIKit

final class VehicleRegisterView: UICodeView {
    // Views

    let contentScroll = UIContentScrollView(.vertical)
    let fieldsStack = UIStackView(.vertical)
    
    let vehicleImageView = UIImageView()
    let brandTextField = UIPaddingTextField()
    let modelTextField = UIPaddingTextField()
    let manufactureYearTextField = UIDecimalField()
    let modelYearTextField = UIDecimalField()
    let colorTextField = UIPaddingTextField()
    let priceTextField = UIDecimalField()
    let plateTextField = UIPaddingTextField()
    let chassiTextField = UIPaddingTextField()

    // Lifecycle

    override func initSubviews() {
        subviews(
            contentScroll.contentSubviews(
                fieldsStack.addArrangedSubviews(
                    vehicleImageView,
                    makeField(title: "Marca", placeholder: "Brand", textField: brandTextField),
                    makeField(title: "Modelo", placeholder: "Model", textField: modelTextField),
                    makeField(title: "Ano de fabricação", placeholder: "2024", textField: manufactureYearTextField),
                    makeField(title: "Ano do modelo", placeholder: "2025", textField: modelYearTextField),
                    makeField(title: "Cor do veículo", placeholder: "Cinza", textField: colorTextField),
                    makeField(title: "Preço", placeholder: "R$ 100.000,00", textField: priceTextField),
                    makeField(title: "Placa", placeholder: "AAA-1A11", textField: plateTextField),
                    makeField(title: "Chassi", placeholder: "AAAAAAAA11111111", textField: chassiTextField)
                )
            )
        )
    }

    override func initLayout() {
        contentScroll.fillContainer()
        fieldsStack.centerHorizontally().top(24).bottom(24).width(800)
        vehicleImageView.aspectRatio(16.0/9.0)
    }

    override func initStyle() {
        self.style { s in
            s.backgroundColor = .secondarySystemBackground
        }
        contentScroll.scrollView.style { s in
            s.alwaysBounceVertical = false
            s.bounces = false
        }
        fieldsStack.style { s in
            s.axis = .vertical
            s.spacing = 24
        }
        vehicleImageView.style { s in
            s.clipsToBounds = true
            s.contentMode = .scaleAspectFill
            s.backgroundColor = .systemGray
        }
        manufactureYearTextField.style { s in
            s.numberStyle = .none
            s.fractionDigits = 0
        }
        modelYearTextField.style { s in
            s.numberStyle = .none
            s.fractionDigits = 0
        }
        priceTextField.style { s in
            s.numberStyle = .currency
        }
    }

    // Functions

    func loadVehicle(_ vehicle: VehicleEntity) {
        vehicleImageView.image = UIImage(data: vehicle.imageData)
        brandTextField.text = vehicle.brand
        modelTextField.text = vehicle.model
        manufactureYearTextField.text = vehicle.manufactureYear
        modelYearTextField.text = vehicle.modelYear
        colorTextField.text = vehicle.color
        priceTextField.decimal = vehicle.price.decimalValue
        plateTextField.text = vehicle.plate
        chassiTextField.text = vehicle.chassi
    }

    // Supporting

    private func makeField(title: String, placeholder: String, textField: UIPaddingTextField) -> UIStackView {
        let label = UILabel().style { s in
            s.text = title
            s.font = .systemFont(ofSize: 24)
        }
        textField.style { s in
            s.borderStyle = .roundedRect
            s.font = .systemFont(ofSize: 24)
            s.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            s.textAlignment = .natural
            s.placeholder = placeholder
        }
        let stackView = UIStackView(.vertical).style { s in
            s.spacing = 8
            s.addArrangedSubviews(label, textField)
        }
        return stackView
    }
}
