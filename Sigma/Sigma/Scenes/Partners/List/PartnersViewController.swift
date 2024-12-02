import Stevia
import UIKit

final class PartnersViewController: UICodeViewController<PartnersView> {

    enum PartnerType: Int {
        case client, seller, manufacturer

        var title: String {
            switch self {
            case .client: return "Cliente"
            case .seller: return "Vendedor"
            case .manufacturer: return "Montadora"
            }
        }
    }

    let domain = CoreDataDomain()

    var clients: [ClientEntity] = []
    var sellers: [SellerEntity] = []
    var manufacturers: [ManufacturerEntity] = []

    var selectedPartnerType: PartnerType = .client
    var selectedList: [NSManagedObject] {
        switch selectedPartnerType {
        case .client: return clients
        case .seller: return sellers
        case .manufacturer: return manufacturers
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        rootView.tableView.deselectSelectedRow(animated: true)

        clients = domain.getEntities()
        sellers = domain.getEntities()
        manufacturers = domain.getEntities()

        rootView.tableView.reloadData()
    }

    private func setupView() {
        title = "Parceiros"
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Adicionar Cliente", style: .done,
            target: self, action: #selector(newOperationAction)
        )
        rootView.segmentedControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
    }

    @objc private func newOperationAction() {
        let controller = PartnerRegisterViewController()
        controller.selectedPartnerType = selectedPartnerType
        navigationController?.pushViewController(controller, animated: true)
    }

    @objc private func didChangeSegment() {
        let index = rootView.segmentedControl.selectedSegmentIndex
        selectedPartnerType = PartnerType(rawValue: index) ?? .client
        navigationItem.rightBarButtonItem?.title = "Adicionar " + selectedPartnerType.title
        rootView.tableView.reloadData()
    }
}

extension PartnersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PartnerItemCell.self)
        let partner = selectedList[indexPath.row]
        cell.update(model: partner)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PartnerRegisterViewController()
        controller.selectedPartnerType = selectedPartnerType
        controller.partner = selectedList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
