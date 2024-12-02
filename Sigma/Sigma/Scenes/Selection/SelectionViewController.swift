import Stevia
import UIKit

final class SelectionViewController: UICodeViewController<SelectionView> {

    enum SelectionType {
        case client, seller, manufacturer, vehicle
    }

    var type: SelectionType = .client
    var selectionList: [NSManagedObject] = []
    var filteredList: [NSManagedObject] = []

    let domain = CoreDataDomain()

    var onSelection: ((SelectionType, NSManagedObject) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = "Selecionar Entidade"
        rootView.searchBar.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self

        switch type {
        case .client:
            let list: [ClientEntity] = domain.getEntities()
            selectionList = list
        case .seller:
            let list: [SellerEntity] = domain.getEntities()
            selectionList = list
        case .manufacturer:
            let list: [ManufacturerEntity] = domain.getEntities()
            selectionList = list
        case .vehicle:
            let list: [VehicleEntity] = domain.getEntities()
            selectionList = list
        }
        filteredList = selectionList
    }
}

extension SelectionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = filteredList[indexPath.row]
        switch type {
        case .client, .seller, .manufacturer:
            let cell = tableView.dequeueReusableCell(PartnerItemCell.self)
            cell.update(model: model)
            return cell
        case .vehicle:
            let cell = tableView.dequeueReusableCell(VehicleItemCell.self)
            cell.update(model: model as! VehicleEntity)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = filteredList[indexPath.row]
        onSelection?(type, model)
        navigationController?.popViewController(animated: true)
    }
}

extension SelectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredList = selectionList
        } else {
            switch type {
            case .client:
                filteredList = selectionList.filter {
                    ($0 as? ClientEntity)?.name.lowercased().contains(searchText.lowercased()) ?? false
                }
            case .seller:
                filteredList = selectionList.filter {
                    ($0 as? SellerEntity)?.name.lowercased().contains(searchText.lowercased()) ?? false
                }
            case .manufacturer:
                filteredList = selectionList.filter {
                    ($0 as? ManufacturerEntity)?.name.lowercased().contains(searchText.lowercased()) ?? false
                }
            case .vehicle:
                filteredList = selectionList.filter { s in
                    let brand = (s as? VehicleEntity)?.brand ?? ""
                    let model = (s as? VehicleEntity)?.model ?? ""
                    return (brand + model).contains(searchText.lowercased())
                }
            }
        }
        rootView.tableView.reloadData()
    }
}
