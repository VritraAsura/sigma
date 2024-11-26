import Stevia
import UIKit

final class HomeItemButton: UICodeControl, SelectableItemProtocol {

    let iconView = UIImageView()
    let titleLabel = UILabel()

    override func initSubviews() {
        subviews(
            iconView,
            titleLabel
        )
    }

    override func initLayout() {
        iconView.top(24).bottom(24).leading(24).Trailing ==
        titleLabel.top(24).bottom(24).trailing(24).Leading - 24
        iconView.width(32).aspectRatio(1)
    }

    override func initStyle() {
        style { s in
            s.layer.cornerRadius = 16
            s.layer.borderWidth = 2
            s.layer.borderColor = UIColor.black.cgColor
        }
        iconView.style { s in
            s.backgroundColor = .blue
        }
        titleLabel.style { s in
            s.text = "Venda"
            s.textColor = .label
            s.font = .boldSystemFont(ofSize: 32)
        }
    }

    public func setSelected(_ isSelected: Bool) {
        if isSelected {
            backgroundColor = .black
        } else {
            backgroundColor = .clear
        }
    }
}
