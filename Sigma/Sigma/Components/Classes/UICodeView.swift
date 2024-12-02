import UIKit

open class UICodeView: UIView {
    var action: (() -> Void)? = nil

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        initLayout()
        initStyle()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }

    open func initSubviews() {}
    open func initLayout() {}
    open func initStyle() {}

    open func setAction(_ action: (() -> Void)?) {
        self.action = action
        let tap = UITapGestureRecognizer(target: self, action: #selector(fireAction))
        addGestureRecognizer(tap)
    }

    @objc private func fireAction() {
        self.action?()
    }
}
