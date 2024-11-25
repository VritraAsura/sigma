import UIKit

open class UICodeViewController<View: UIView>: UIViewController {

    public private(set) lazy var rootView: View = View()

    open override func loadView() {
        self.view = rootView
    }

    public override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
}
