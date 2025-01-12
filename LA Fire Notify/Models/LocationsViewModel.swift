import SwiftUI
import CoreLocation

class LocationsViewModel: ObservableObject {
    @Published var fires: [FireLocation] = [
        FireLocation(name: "Hurst Fire",
                    coordinate: CLLocationCoordinate2D(latitude: 34.3697, longitude: -118.4888),
                    acreage: 50,
                    containment: 60),
        FireLocation(name: "Kenneth Fire",
                    coordinate: CLLocationCoordinate2D(latitude: 34.1559, longitude: -118.6679),
                    acreage: 75,
                    containment: 45),
        FireLocation(name: "Palisades Fire",
                    coordinate: CLLocationCoordinate2D(latitude: 34.0766, longitude: -118.5267),
                    acreage: 1200,
                    containment: 30),
        FireLocation(name: "Eaton Fire",
                    coordinate: CLLocationCoordinate2D(latitude: 34.1907, longitude: -118.1231),
                    acreage: 85,
                    containment: 75)
    ]
    
    @Published var resources: [ResourceLocation] = [
        ResourceLocation(
            name: "Westwood Recreation Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.0561, longitude: -118.4443),
            type: .shelter,
            details: "Emergency Shelter\nAccepts small pets\n📞 (310) 473-3610"
        ),
        ResourceLocation(
            name: "Pacific Recreation Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.0766, longitude: -118.3512),
            type: .shelter,
            details: "Primary evacuation site for Palisades area\n📞 (323) 954-9544"
        ),
        ResourceLocation(
            name: "El Camino Real Charter High School",
            coordinate: CLLocationCoordinate2D(latitude: 34.1725, longitude: -118.6028),
            type: .shelter,
            details: "Emergency Shelter\nAccepts small animals\n📞 (818) 595-7500"
        ),
        ResourceLocation(
            name: "Pierce College Equestrian Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.1845, longitude: -118.5764),
            type: .petCenter,
            details: "Large Animal Evacuation\n🐎 Equestrian Center\n📞 (818) 719-6465"
        ),
        ResourceLocation(
            name: "Pasadena Convention Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.1435, longitude: -118.1441),
            type: .shelter,
            details: "Primary evacuation site for Altadena area\n📞 (626) 793-2122"
        ),
        ResourceLocation(
            name: "Ritchie Valens Recreation Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.2539, longitude: -118.4169),
            type: .shelter,
            details: "Primary evacuation site for Hurst Fire area\n📞 (818) 834-5172"
        ),
        ResourceLocation(
            name: "Red Cross Emergency Station",
            coordinate: CLLocationCoordinate2D(latitude: 34.0928, longitude: -118.3287),
            type: .support,
            details: "Emergency Services\nFood & Supplies\n📞 (800) 675-5799"
        ),
        ResourceLocation(
            name: "Emergency Medical Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
            type: .medical,
            details: "24/7 Emergency Care\n📞 (800) 555-0123"
        ),
        ResourceLocation(
            name: "LA Animal Services Center",
            coordinate: CLLocationCoordinate2D(latitude: 34.1482, longitude: -118.4430),
            type: .petCenter,
            details: "Pet Emergency Services\nSmall Animal Shelter\n📞 (888) 452-7381"
        )
    ]
    
    var allMapItems: [any MapItem] {
        (fires as [any MapItem]) + (resources as [any MapItem])
    }
}