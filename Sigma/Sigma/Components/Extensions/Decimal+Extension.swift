import Foundation

extension Decimal {
    public var brlFormatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = .current
        return numberFormatter.string(for: self) ?? ""
    }
}
