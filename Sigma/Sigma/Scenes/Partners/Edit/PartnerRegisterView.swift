import Stevia
import UIKit

final class PartnerRegisterView: UICodeView {
    // Views

    let contentScroll = UIContentScrollView(.vertical)
    let fieldsStack = UIStackView(.vertical)

    let brandTextField = UIPaddingTextField()
    let emailTextField = UIPaddingTextField()

    let codeTextField = UIPaddingTextField()
    let nameTextField = UIPaddingTextField()
    let incomeTextField = UIDecimalField()

    let neighborhoodTextField = UIPaddingTextField()
    let cityTextField = UIPaddingTextField()
    let stateTextField = UIPaddingTextField()

    let homePhoneTextField = UIPaddingTextField()
    let cellphoneTextField = UIPaddingTextField()

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
//        homePhoneTextField.style { s in
//            s.numberStyle = .none
//            s.fractionDigits = 0
//        }
//        cellphoneTextField.style { s in
//            s.numberStyle = .none
//            s.fractionDigits = 0
//        }
        incomeTextField.style { s in
            s.numberStyle = .currency
        }
    }

    // Functions

    func loadClient(_ client: ClientEntity?) {
        fieldsStack.removeAllArrangedSubviews()
        fieldsStack.addArrangedSubviews(
            makeField(title: "CPF", placeholder: "111.222.333-44", textField: codeTextField),
            makeField(title: "Nome", placeholder: "Nome Completo", textField: nameTextField),
            makeField(title: "Salário", placeholder: "R$ 7.500,00", textField: incomeTextField),
            makeField(title: "Bairro", placeholder: "Bairro", textField: neighborhoodTextField),
            makeField(title: "Cidade", placeholder: "Manaus", textField: cityTextField),
            makeField(title: "Estado", placeholder: "AM", textField: stateTextField),
            makeField(title: "Telefone residencial", placeholder: "(31) 3131-3131", textField: homePhoneTextField),
            makeField(title: "Telefone celular", placeholder: "(92) 9292-9292", textField: cellphoneTextField)
        )
        guard let client = client else { return }
        codeTextField.text = client.cpf
        nameTextField.text = client.name
        incomeTextField.decimal = client.income.decimalValue
        neighborhoodTextField.text = client.neighborhood
        cityTextField.text = client.city
        stateTextField.text = client.state
        homePhoneTextField.text = client.homePhone
        cellphoneTextField.text = client.cellphone
    }

    func loadSeller(_ seller: SellerEntity?) {
        fieldsStack.removeAllArrangedSubviews()
        fieldsStack.addArrangedSubviews(
            makeField(title: "Código", placeholder: "111.222.333-44", textField: codeTextField),
            makeField(title: "Nome", placeholder: "Nome Completo", textField: nameTextField)
        )
        guard let seller = seller else { return }
        codeTextField.text = seller.code
        nameTextField.text = seller.name
    }

    func loadManufacturer(_ manufacturer: ManufacturerEntity?) {
        fieldsStack.removeAllArrangedSubviews()
        fieldsStack.addArrangedSubviews(
            makeField(title: "CNPJ", placeholder: "11.222.333/0001-44", textField: codeTextField),
            makeField(title: "Razão social", placeholder: "Nome Fantasia", textField: nameTextField),
            makeField(title: "Marca", placeholder: "Marca", textField: brandTextField),
            makeField(title: "Email", placeholder: "contato@marca.com", textField: emailTextField),
            makeField(title: "Telefone comercial", placeholder: "(31) 3131-3131", textField: homePhoneTextField),
            makeField(title: "Telefone celular", placeholder: "(92) 9292-9292", textField: cellphoneTextField)
        )
        guard let manufacturer = manufacturer else { return }
        codeTextField.text = manufacturer.cnpj
        nameTextField.text = manufacturer.name
        brandTextField.text = manufacturer.brand
        emailTextField.text = manufacturer.email
        homePhoneTextField.text = manufacturer.comertialPhone
        cellphoneTextField.text = manufacturer.cellphone
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
