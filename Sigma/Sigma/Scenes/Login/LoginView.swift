import Stevia
import UIKit

final class LoginView: UICodeView {
    // Views

    let logoView = UIView()
    let logoImageView = UIImageView()

    let loginView = UIView()
    let loginTitleLabel = UILabel()

    let fieldsStack = UIStackView(.vertical)
    let usernameLabel = UILabel()
    let usernameTextField = UIPaddingTextField()
    let passwordLabel = UILabel()
    let passwordTextField = UIPaddingTextField()

    let loginButton = UIButton()

    // Lifecycle

    override func initSubviews() {
        subviews(
            logoView.subviews(
                logoImageView
            ),
            loginView.subviews(
                loginTitleLabel,
                fieldsStack.addArrangedSubviews(
                    usernameLabel,
                    usernameTextField,
                    passwordLabel,
                    passwordTextField
                ),
                loginButton
            )
        )
    }

    override func initLayout() {
        logoView.top(0).bottom(0).leading(0).width(40%)
        logoImageView.centerInContainer().Width == logoImageView.Height

        loginView.centerVertically().trailing(80).Leading == logoView.Trailing + 80

        loginTitleLabel.top(0).fillHorizontally()
        fieldsStack.centerVertically().fillHorizontally().Top == loginTitleLabel.Bottom + 60
        loginButton.fillHorizontally().bottom(0).height(60).Top == fieldsStack.Bottom + 60
    }

    override func initStyle() {
        style { s in
            s.backgroundColor = .secondarySystemBackground
        }
        logoView.style { s in
            s.backgroundColor = .systemOrange
        }

        loginTitleLabel.style { s in
            s.text = "Sigma"
            s.textColor = .label
            s.font = .boldSystemFont(ofSize: 40)
        }
        fieldsStack.style { s in
            s.spacing = 24
            s.setCustomSpacing(40, after: usernameTextField)
        }

        usernameLabel.style { s in
            s.text = "Usuário"
            s.textColor = .label
            s.font = .systemFont(ofSize: 24)
        }
        usernameTextField.style { s in
            s.font = .systemFont(ofSize: 24)
            s.padding = .init(top: 16, left: 16, bottom: 16, right: 16)
            s.placeholder = "Usuário"
            s.autocapitalizationType = .none
            s.autocorrectionType = .no
            s.spellCheckingType = .no
            s.borderStyle = .roundedRect
            s.textContentType = .username
        }
        passwordLabel.style { s in
            s.text = "Senha"
            s.textColor = .label
            s.font = .systemFont(ofSize: 24)
        }
        passwordTextField.style { s in
            s.font = .systemFont(ofSize: 24)
            s.padding = .init(top: 16, left: 16, bottom: 16, right: 16)
            s.placeholder = "Senha"
            s.autocapitalizationType = .none
            s.autocorrectionType = .no
            s.spellCheckingType = .no
            s.borderStyle = .roundedRect
            s.textContentType = .password
            s.isSecureTextEntry = true
        }

        loginButton.style { s in
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]
            let title = NSAttributedString(string: "Sign in", attributes: attributes)
            s.setAttributedTitle(title, for: .normal)
            s.backgroundColor = .systemOrange
            s.layer.cornerRadius = 8
            s.layer.masksToBounds = true
            s.setupColorAnimation()
        }
    }
}
