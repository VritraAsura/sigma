import UIKit

open class UIPaddingTextField: UITextField {
    // Properties

    open var string: String { text ?? "" }
    open var padding = UIEdgeInsets()

    // Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }

    // Override

    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
