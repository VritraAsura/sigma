import UIKit

open class UICodeTableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
        initLayout()
        initStyle()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }

    open func initSubviews() {}
    open func initLayout() {}
    open func initStyle() {}
}
