import Stevia
import UIKit

final class LoginViewController: UICodeViewController<LoginView> {
    // Properties

    let loginDomain = LoginDomain()

    // Lifecycle

    override func viewDidLoad() {
        rootView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }

    override func viewDidDisappear(_ animated: Bool) {
        rootView.usernameTextField.text = ""
        rootView.passwordTextField.text = ""
    }

    // Actions

    @objc private func didTapLogin() {
        let username = rootView.usernameTextField.string
        let password = rootView.passwordTextField.string.sha256Hashed

        let isValid = loginDomain.doLogin(username: username, password: password)
        print("is valid user: \(isValid)")

        let home = HomeSplitViewController()
        self.view.window?.swapRootViewController(home, animationType: .push)
    }
}
