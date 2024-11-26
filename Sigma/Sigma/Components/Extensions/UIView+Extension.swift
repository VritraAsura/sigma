import UIKit

extension UIView {
    @discardableResult
    public func aspectRatio(_ ratio: CGFloat = 1) -> Self {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: ratio).isActive = true
        return self
    }
}
