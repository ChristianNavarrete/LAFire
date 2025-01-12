import MapKit
import CoreLocation
import SwiftUI

enum ResourceType {
    case fire
    case shelter
    case petCenter
    case medical
    case service
    case support
    
    var emoji: String {
        switch self {
        case .fire: return "🔥"
        case .shelter: return "🏠"
        case .petCenter: return "🐾"
        case .medical: return "🏥"
        case .service: return "🏢"
        case .support: return "💙"
        }
    }
    
    var tint: Color {
        switch self {
        case .fire: return .red
        case .shelter: return .blue
        case .petCenter: return .green
        case .medical: return .purple
        case .service: return .orange
        case .support: return .blue
        }
    }
}

struct ResourceLocation: Identifiable, MapItem {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let type: ResourceType
    let details: String?
}