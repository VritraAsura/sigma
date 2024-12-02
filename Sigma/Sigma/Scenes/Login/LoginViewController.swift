import Stevia
import UIKit

final class LoginViewController: UICodeViewController<LoginView> {
    // Properties

    let domain = CoreDataDomain()
    var user: UserEntity?

    // Lifecycle

    override func viewDidLoad() {
        rootView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        rootView.usernameTextField.text = "admin"
        rootView.passwordTextField.text = "admin"
        didTapLogin()
    }

    override func viewDidDisappear(_ animated: Bool) {
        rootView.usernameTextField.text = ""
        rootView.passwordTextField.text = ""
    }

    // Actions

    @objc private func didTapLogin() {
        let username = rootView.usernameTextField.string
        let password = rootView.passwordTextField.string.sha256Hashed
        
        let predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        user = domain.getEntities(predicate: predicate).first

        if user != nil {
            let home = HomeSplitViewController()
            self.view.window?.swapRootViewController(home, animationType: .push)
        } else {
            let alert = UIOptionAlert(
                title: "Falha no login",
                message: "Nome de usuário ou senha inválidos",
                view: self
            )
            alert.addAction(style: .cancel, title: "Ok")
            alert.present()
        }
    }
}
