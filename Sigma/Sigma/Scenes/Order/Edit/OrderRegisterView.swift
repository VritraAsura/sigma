import Stevia
import UIKit

final class OrderRegisterView: UICodeView {
    // Views

    let contentScroll = UIContentScrollView(.vertical)
    let fieldsStack = UIStackView(.vertical)

    let modelTextField = UIPaddingTextField()
    let colorTextField = UIPaddingTextField()
    let accessoriesTextField = UIPaddingTextField()
    let yearTextField = UIDecimalField()
    let priceTextField = UIDecimalField()

    let clientView = PartnerItemView()
    let sellerView = PartnerItemView()
    let manufacturerView = PartnerItemView()

    // Lifecycle

    override func initSubviews() {
        subviews(
            contentScroll.contentSubviews(
                fieldsStack.addArrangedSubviews(
                    clientView, sellerView, manufacturerView,
                    makeField(title: "Modelo", placeholder: "Model", textField: modelTextField),
                    makeField(title: "Ano", placeholder: "2024", textField: yearTextField),
                    makeField(title: "Cor", placeholder: "Cinza", textField: colorTextField),
                    makeField(title: "Acessórios", placeholder: "Multimídia", textField: accessoriesTextField),
                    makeField(title: "Preço", placeholder: "R$ 100.000,00", textField: priceTextField)
                )
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
        manufacturerView.style { s in
            s.nameLabel.text = "Selecionar Montadota"
            s.backgroundColor = .tertiarySystemBackground
        }
        yearTextField.style { s in
            s.numberStyle = .none
            s.fractionDigits = 0
        }
        priceTextField.style { s in
            s.numberStyle = .currency
        }
    }

    // Functions

    func loadOrder(_ order: OrderEntity?) {
        guard let order = order else { return }
        modelTextField.text = order.model
        yearTextField.text = order.year
        colorTextField.text = order.color
        accessoriesTextField.text = order.accessories
        priceTextField.decimal = order.price.decimalValue
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
