import UIKit

extension UIContentScrollView {
    @discardableResult
    public func contentSubviews(_ subViews: UIView...) -> Self {
        contentSubviews(subViews)
    }

    @discardableResult
    public func contentSubviews(_ subViews: [UIView]) -> Self {
        subViews.forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
}

open class UIContentScrollView<V: UIView>: UIView {

    // Properties

    open var axis: NSLayoutConstraint.Axis {
        didSet { layoutScrollAxis() }
    }

    private var axisConstraints: [NSLayoutConstraint] = []

    // Views

    public let scrollView = UIScrollView()
    public let contentView = V()

    // Lifecycle

    public init(_ axis: NSLayoutConstraint.Axis) {
        self.axis = axis
        super.init(frame: .zero)
        initView()
    }

    public override init(frame: CGRect = .zero) {
        self.axis = .vertical
        super.init(frame: frame)
        initView()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }

    // Layout

    private func initView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        layoutScrollAxis()
    }

    private func layoutScrollAxis() {
        axisConstraints.forEach({ $0.isActive = false })
        axisConstraints.removeAll()
        if axis == .vertical {
            axisConstraints.append(contentView.leadingAnchor.constraint(equalTo: leadingAnchor))
            axisConstraints.append(contentView.trailingAnchor.constraint(equalTo: trailingAnchor))
        } else {
            axisConstraints.append(contentView.topAnchor.constraint(equalTo: topAnchor))
            axisConstraints.append(contentView.bottomAnchor.constraint(equalTo: bottomAnchor))
        }
        axisConstraints.forEach({ $0.isActive = true })
    }
}
