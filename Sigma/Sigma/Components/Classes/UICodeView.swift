import UIKit

open class UICodeView: UIView {
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
}
