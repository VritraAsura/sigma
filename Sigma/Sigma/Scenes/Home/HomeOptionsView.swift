import Stevia
import UIKit

final class HomeOptionsView: UICodeView {
    // Views

    let optionsStack = UIStackView(.vertical)

    // Lifecycle

    override func initSubviews() {

    }

    override func initLayout() {
        self.width(>=360)
    }

    override func initStyle() {
        style { s in
            s.backgroundColor = .systemOrange
        }
    }
}
