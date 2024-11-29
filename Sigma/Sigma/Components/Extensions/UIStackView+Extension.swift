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

    public func setPadding(margins: UIEdgeInsets) {
        layoutMargins = margins
        isLayoutMarginsRelativeArrangement = true
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
