import Stevia
import UIKit

final class OperationRegisterView: UICodeView {
    // Views

    let contentScroll = UIContentScrollView(.vertical)
    let fieldsStack = UIStackView(.vertical)

    let clientView = PartnerItemView()
    let sellerView = PartnerItemView()
    let vehicleView = VehicleItemView()

    let entryTextField = UIDecimalField()
    let financeTextField = UIDecimalField()
    let totalTextField = UIDecimalField()

    // Lifecycle

    override func initSubviews() {
        subviews(
            contentScroll.contentSubviews(
                fieldsStack
            )
        )
    }

    override func initLayout() {
        contentScroll.fillContainer()
        fieldsStack.centerHorizontally().top(24).bottom(24).width(800)
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
        clientView.style { s in
            s.nameLabel.text = "Selecionar Cliente"
            s.backgroundColor = .tertiarySystemBackground
        }
        sellerView.style { s in
            s.nameLabel.text = "Selecionar Vendedor"
            s.backgroundColor = .tertiarySystemBackground
        }
        vehicleView.style { s in
            s.nameLabel.text = "Selecionar Veículo"
            s.backgroundColor = .tertiarySystemBackground
        }
        entryTextField.style { s in
            s.numberStyle = .currency
        }
        financeTextField.style { s in
            s.numberStyle = .currency
        }
        totalTextField.style { s in
            s.numberStyle = .currency
        }
    }

    // Functions

    func loadSaleOperation(_ operation: OperationEntity?) {
        fieldsStack.removeAllArrangedSubviews()
        fieldsStack.addArrangedSubviews(
            clientView, sellerView, vehicleView,
            makeField(title: "Valor de entrada", placeholder: "R$ 20.000,00", textField: entryTextField),
            makeField(title: "Valor do financiamento", placeholder: "R$ 80.000,00", textField: financeTextField),
            makeField(title: "Total", placeholder: "R$ 100.000,00", textField: totalTextField)
        )
        guard let operation = operation else { return }
        clientView.update(model: operation.client)
        sellerView.update(model: operation.seller)
        vehicleView.update(model: operation.vehicle)
        if let entry = operation.entryAmount?.decimalValue, entry != 0 {
            entryTextField.decimal = entry
        }
        if let financed = operation.financedAmount?.decimalValue, financed != 0 {
            financeTextField.decimal = financed
        }
        totalTextField.decimal = operation.totalPrice.decimalValue
    }

    func loadPurchaseOperation(_ operation: OperationEntity?) {
        fieldsStack.removeAllArrangedSubviews()
        fieldsStack.addArrangedSubviews(
            clientView, sellerView, vehicleView,
            makeField(title: "Total", placeholder: "R$ 100.000,00", textField: totalTextField)
        )
        guard let operation = operation else { return }
        clientView.update(model: operation.client)
        sellerView.update(model: operation.seller)
        vehicleView.update(model: operation.vehicle)
        totalTextField.decimal = operation.totalPrice.decimalValue
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
