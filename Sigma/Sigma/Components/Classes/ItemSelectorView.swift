import UIKit

public protocol SelectableItemProtocol: UIControl {
    func setSelected(_ isSelected: Bool)
}

open class ItemSelectorView: UIView {
    // Views

    public let stackView = UIStackView()
    public var items: [SelectableItemProtocol] = [] {
        didSet {
            setupItems()
        }
    }
    public private(set) var selectedItem: SelectableItemProtocol?

    // Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }

    private func setupView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // Functions

    private func setupItems() {
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for item in items {
            stackView.addArrangedSubview(item)
            item.addTarget(self, action: #selector(didTapItem), for: .touchUpInside)
        }
    }

    // Actions

    @objc private func didTapItem(_ item: UIControl) {
        selectedItem?.setSelected(false)
        selectedItem = item as? SelectableItemProtocol
        selectedItem?.setSelected(true)
    }
}
