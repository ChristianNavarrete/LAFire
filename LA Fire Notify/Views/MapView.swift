import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var locationsViewModel = LocationsViewModel()
    @Binding var selectedTab: Int
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region,
                    showsUserLocation: true,
                    annotationItems: locationsViewModel.fires) { fire in
                    MapAnnotation(coordinate: fire.coordinate) {
                        VStack(spacing: 0) {
                            AnimatedMarkerView(emoji: "🔥")
                            VStack(spacing: 2) {
                                Text(fire.name)
                                    .font(.caption2)
                                    .bold()
                                Text(fire.details)
                                    .font(.caption2)
                                    .lineLimit(2)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                            .background(Color.red.opacity(0.9))
                            .cornerRadius(4)
                            .shadow(radius: 2)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: centerOnUser) {
                            Image(systemName: "location.fill")
                                .font(.system(size: 20))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("LA Fire Map")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func centerOnUser() {
        if let userLocation = locationManager.userLocation {
            withAnimation {
                region = MKCoordinateRegion(
                    center: userLocation,
                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                )
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(selectedTab: .constant(0))
    }
}