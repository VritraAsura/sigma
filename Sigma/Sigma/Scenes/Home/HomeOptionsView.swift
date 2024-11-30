import Stevia
import UIKit

final class HomeOptionsView: UICodeView {
    // Views

    let selectorView = ItemSelectorView()
    let profileItem = HomeItemButton()
    let vehiclesItem = HomeItemButton()
    let operationsItem = HomeItemButton()
    let requestsItem = HomeItemButton()
    let partnersItem = HomeItemButton()
    let logsItem = HomeItemButton()

    // Lifecycle

    override func initSubviews() {
        subviews(
            selectorView
        )
        selectorView.items = [
            vehiclesItem,
            operationsItem,
            requestsItem,
            partnersItem,
            logsItem
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
        vehiclesItem.style { s in
            s.titleLabel.text = "Veículos"
        }
        operationsItem.style { s in
            s.titleLabel.text = "Operações"
        }
        requestsItem.style { s in
            s.titleLabel.text = "Pedidos"
        }
        partnersItem.style { s in
            s.titleLabel.text = "Parceiros"
        }
        logsItem.style { s in
            s.titleLabel.text = "Relatório"
        }
    }
}
