import Stevia
import UIKit

final class PartnersViewController: UICodeViewController<PartnersView> {

    var partners: [PartnerModel] = [
        .client(.mock),
        .seller(.mock),
        .manufacturer(.mock),
        .client(.mock),
        .seller(.mock),
        .manufacturer(.mock),
        .client(.mock),
        .seller(.mock),
        .manufacturer(.mock)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.deselectSelectedRow(animated: true)
    }

    private func setupView() {
        title = "Veículos disponíveis"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Adicionar", style: .done,
            target: self, action: #selector(newOperationAction)
        )
    }

    @objc private func newOperationAction() {
        let controller = PartnerRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension PartnersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partners.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PartnerItemCell.self)
        let partner = partners[indexPath.row]
        cell.update(model: partner)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PartnerRegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
