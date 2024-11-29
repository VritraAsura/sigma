import UIKit

open class UIDecimalField: UIPaddingTextField {
    // Types

    public enum PlaceholderType {
        case never
        case zero
        case `default`
    }

    // Properties

    public final var decimal: Decimal {
        get { decimalFromString / pow(10, fractionDigits) }
        set { text = numberFormatter.string(for: newValue) }
    }

    public var maximum: Decimal = .greatestFiniteMagnitude {
        didSet { sendActions(for: .editingChanged) }
    }
    public var numberStyle: NumberFormatter.Style = .decimal {
        didSet { sendActions(for: .editingChanged) }
    }
    public var fractionDigits: Int = 2  {
        didSet { sendActions(for: .editingChanged) }
    }
    public var locale: Locale = .current {
        didSet { sendActions(for: .editingChanged) }
    }
    public var placeholderType: PlaceholderType = .default {
        didSet { sendActions(for: .editingChanged) }
    }

    private let selectionButton = UIControl()
    private var numberFormatter = NumberFormatter()
    private var lastValue: String?
    private var stringFromDecimal: String {
        numberFormatter.string(for: decimal) ?? ""
    }
    private var decimalFromString: Decimal {
        Decimal(string: digits) ?? 0
    }
    private var digits: String {
        string.filter(\.isNumber)
    }
    private var maximumFraction: Decimal {
        maximum / pow(10, fractionDigits)
    }

    // Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    // Override

    open override func deleteBackward() {
        super.deleteBackward()
        sendActions(for: .editingChanged)
    }

    // Functions

    @objc public func editingChanged() {
        updateNumberFormatter()
        guard decimal <= maximumFraction else {
            text = lastValue
            return
        }
        if decimal == 0 {
            switch placeholderType {
            case .default:
                text = nil
            case .zero:
                text = nil
                placeholder = stringFromDecimal
            case .never:
                text = stringFromDecimal
            }
        } else {
            text = stringFromDecimal
        }
        lastValue = text
    }

    private func updateNumberFormatter() {
        numberFormatter.numberStyle = numberStyle
        numberFormatter.maximumFractionDigits = fractionDigits
        numberFormatter.minimumFractionDigits = fractionDigits
        numberFormatter.locale = locale
    }

    private func initView() {
        addSubview(selectionButton)
        selectionButton.translatesAutoresizingMaskIntoConstraints = false
        selectionButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        selectionButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        selectionButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        selectionButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        selectionButton.addTarget(self, action: #selector(touchSelection), for: .touchUpInside)

        keyboardType = .numberPad
        textAlignment = .right

        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        sendActions(for: .editingChanged)
    }

    @objc private func touchSelection() {
        becomeFirstResponder()
    }
}
