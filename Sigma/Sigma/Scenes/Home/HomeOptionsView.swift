import Stevia
import UIKit

final class HomeOptionsView: UICodeView {
    // Views

    let selectorView = ItemSelectorView()
    let profileItem = HomeItemButton()
    let salesItem = HomeItemButton()
    let partnersItem = HomeItemButton()

    // Lifecycle

    override func initSubviews() {
        subviews(
            selectorView
        )
        selectorView.items = [
            profileItem,
            salesItem,
            partnersItem
        ]
    }

    override func initLayout() {
        selectorView.fillHorizontally(padding: 24).Top == safeAreaLayoutGuide.Top + 24
    }

    override func initStyle() {
        style { s in
            s.backgroundColor = .systemOrange
        }
        selectorView.stackView.style { s in
            s.axis = .vertical
            s.spacing = 24
        }
        profileItem.style { s in
            s.titleLabel.text = "Perfil"
        }
        salesItem.style { s in
            s.titleLabel.text = "Vendas"
        }
        partnersItem.style { s in
            s.titleLabel.text = "Parceiros"
        }
    }
}
