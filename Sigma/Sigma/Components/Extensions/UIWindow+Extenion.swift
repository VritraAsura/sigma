import UIKit

public enum SwapRootVCAnimationType {
    case push
    case pop
}

extension UIWindow {
    public func swapRootViewController(
        _ newViewController: UIViewController,
        animationType: SwapRootVCAnimationType,
        duration: TimeInterval = .pi / 10.0,
        completion: (() -> Void)? = nil
    ) {
        guard let currentViewController = rootViewController else {
            rootViewController = newViewController
            makeKeyAndVisible()
            return
        }

        let width = currentViewController.view.frame.size.width
        let currentTransform = currentViewController.view.transform
        let startTransform: CGAffineTransform
        let finalTransform: CGAffineTransform
        let newVCAnimated: Bool

        switch animationType {
        case .push:
            startTransform = currentTransform.translatedBy(x: width, y: 0)
            finalTransform = currentTransform.translatedBy(x: -width/4, y: 0)
            newVCAnimated = true
        case .pop:
            startTransform = currentTransform.translatedBy(x: -width/4, y: 0)
            finalTransform = currentTransform.translatedBy(x: width, y: 0)
            newVCAnimated = false
        }

        do { // Start configuration
            rootViewController = newViewController
            makeKeyAndVisible()

            addSubview(currentViewController.view)
            newViewController.view.transform = startTransform
            currentViewController.view.transform = currentTransform
            if newVCAnimated {
                sendSubviewToBack(currentViewController.view)
            }
        }
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            newViewController.view.transform = currentTransform
            currentViewController.view.transform = finalTransform
        }, completion: { _ in
            currentViewController.view.removeFromSuperview()
            completion?()
        })
    }
}

