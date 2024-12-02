import UIKit

extension UIStackView {
    @discardableResult
    public func addArrangedSubviews(_ arrengedSubviews: UIView...) -> Self {
        addArrangedSubviews(arrengedSubviews)
    }

    @discardableResult
    public func addArrangedSubviews(_ arrengedSubviews: [UIView]) -> Self {
        arrengedSubviews.forEach({ addArrangedSubview($0) })
        return self
    }

    public func setPadding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        let padding = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        setPadding(margins: padding)
    }

    public func setPadding(margins: UIEdgeInsets) {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
    }

    @discardableResult
    public func removeAllArrangedSubviews() -> [UIView] {
        arrangedSubviews.reduce([UIView](), { $0 + [dropArrangedSubview($1)] })
    }

    @discardableResult
    public func dropArrangedSubview(_ view: UIView) -> UIView {
        removeArrangedSubview(view)
        view.removeFromSuperview()
        return view
    }

    public convenience init(
        _ axis: NSLayoutConstraint.Axis,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        spacing: CGFloat = 0
    ) {
        self.init(frame: .zero)
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
