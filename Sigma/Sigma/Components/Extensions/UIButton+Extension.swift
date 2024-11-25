import UIKit

extension UIButton {
    public func setupScaleAnimation() {
        addTarget(self, action: #selector(animateScaleDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateScaleUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    public func setupColorAnimation() {
        addTarget(self, action: #selector(animateColorDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateColorUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    // MARK: - Animações de Escala

    @objc private func animateScaleDown(sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: [.curveEaseOut],
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
    }

    @objc private func animateScaleUp(sender: UIButton) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut],
                       animations: {
            sender.transform = .identity
        })
    }

    // MARK: - Animações de Cor e Luminosidade

    @objc private func animateColorDown(sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.8)
            sender.alpha = 0.9
        })
    }

    @objc private func animateColorUp(sender: UIButton) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
            sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(1.0)
            sender.alpha = 1.0
        })
    }
}
