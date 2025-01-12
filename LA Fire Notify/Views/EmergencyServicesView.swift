import SwiftUI

// Define the EvacuationCenter model
struct EvacuationCenter: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let details: String?
}

struct EmergencyServicesView: View {
    let evacuationCenters = [
        EvacuationCenter(name: "Westwood Recreation Center",
                        address: "1350 S. Sepulveda Blvd., Westwood",
                        details: "Accepts small animals"),
        EvacuationCenter(name: "Pacific Recreation Center",
                        address: "7600 Beverly, L.A.",
                        details: "Primary evacuation site for Palisades area"),
        EvacuationCenter(name: "El Camino Real Charter High School",
                        address: "5440 Valley Circle Blvd., Woodland Hills",
                        details: "Accepts small animals"),
        EvacuationCenter(name: "Pierce College Equestrian Center",
                        address: "7100 El Rancho Dr., Woodland Hills",
                        details: "Large animals accepted"),
        EvacuationCenter(name: "Pasadena Convention Center",
                        address: "300 E Green St., Pasadena",
                        details: "Primary evacuation site for Altadena area"),
        EvacuationCenter(name: "Ritchie Valens Recreation Center",
                        address: "10736 Laurel Canyon Blvd., Pacoima",
                        details: "Primary evacuation site for Hurst Fire area")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Evacuation Centers")) {
                    ForEach(evacuationCenters) { center in
                        VStack(alignment: .leading) {
                            Text(center.name)
                                .font(.headline)
                            Text(center.address)
                                .font(.subheadline)
                            if let details = center.details {
                                Text(details)
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                Section(header: Text("Emergency Contacts")) {
                    Link("FEMA Claims", destination: URL(string: "https://www.disasterassistance.gov")!)
                    Link("Red Cross Family Reunification - (800) 675-5799",
                         destination: URL(string: "https://www.redcross.org/get-help/disaster-relief-and-recovery-services/contact-and-locate-loved-ones/california-wildfires-reunification.html")!)
                    
                    VStack(alignment: .leading) {
                        Text("Mental Health Crisis")
                        Text("988 Suicide and Crisis Lifeline")
                            .font(.caption)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Disaster Distress Helpline")
                        Text("(800) 985-5990")
                            .font(.caption)
                    }
                }
                
                Section(header: Text("Shelter Programs")) {
                    Link("211 LA - Free Temporary Shelter",
                         destination: URL(string: "https://211la.org")!)
                    Link("YMCA Metropolitan LA",
                         destination: URL(string: "https://www.ymcala.org/community-response#close")!)
                    Link("Airbnb.org Emergency Housing",
                         destination: URL(string: "https://www.airbnb.com/e/airbnb-org?c=.pi130.pkairbnb-org")!)
                }
            }
            .navigationTitle("Emergency Services")
        }
    }
}

#Preview {
    EmergencyServicesView()
}