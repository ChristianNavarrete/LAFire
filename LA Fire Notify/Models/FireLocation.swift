import MapKit
import CoreLocation

protocol MapItem: Identifiable {
    var coordinate: CLLocationCoordinate2D { get }
}

struct FireLocation: Identifiable, MapItem {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    var acreage: Int
    var containment: Int
    
    // Formatted details string
    var details: String {
        return "\(acreage.formatted()) acres\n\(containment)% contained"
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        authorizationStatus = locationManager.authorizationStatus
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        if authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location.coordinate
        // Stop updating location after we get the initial position
        locationManager.stopUpdatingLocation()
    }
}