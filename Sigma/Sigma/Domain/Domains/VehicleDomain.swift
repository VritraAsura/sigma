import Foundation

public final class VehicleDomain {
    // Properties

    private let coreData = CoreDataModel.shared

    // Functions

    func getVehicles() -> [VehicleEntity] {
        do {
            return try coreData.getEntities(VehicleEntity.self)
        } catch let error {
            print(error)
            return []
        }
    }

    func addOrUpdateVehicle(
        uri: URL?, imageData: Data, chassi: String, brand: String, model: String,
        manufactureYear: String, modelYear: String, color: String,
        plate: String, price: Decimal, isAvailable: Bool
    ) {
        do {
            let vehicle: VehicleEntity
            if let uri = uri  {
                vehicle = try coreData.getEntity(VehicleEntity.self, at: uri)
            } else {
                vehicle = try coreData.newEntity(VehicleEntity.self)
            }
            vehicle.imageData = imageData
            vehicle.chassi = chassi
            vehicle.brand = brand
            vehicle.model = model
            vehicle.manufactureYear = manufactureYear
            vehicle.modelYear = modelYear
            vehicle.color = color
            vehicle.plate = plate
            vehicle.price = NSDecimalNumber(decimal: price)
            vehicle.isAvailable = isAvailable
            try coreData.saveIfNeeded()
        } catch let error {
            print(error)
        }
    }

    func deleteVehicle(_ vehicle: VehicleEntity) {
        do {
            let uri = vehicle.objectID.uriRepresentation()
            try coreData.remove(itemAt: uri)
        } catch let error {
            print(error)
        }
    }
}
