import SwiftUI

struct PetResourcesView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("🏥 Animal Care Centers")) {
                    Link("🐾 Castaic Animal Care Center",
                         destination: URL(string: "https://animalcare.lacounty.gov/castaic-animal-care-center/")!)
                    Link("🐎 Los Angeles Equestrian Center",
                         destination: URL(string: "https://laec.info")!)
                    VStack(alignment: .leading) {
                        Text("🏡 Agoura Animal Care Center")
                        Text("📍 29525 Agoura Rd, Agoura Hills")
                            .font(.caption)
                        Text("🐱 Small animals accepted")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    VStack(alignment: .leading) {
                        Text("🏡 Baldwin Park Animal Care Center")
                        Text("📍 4275 Elton St.")
                            .font(.caption)
                        Text("🐱 Small animals accepted")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
                
                Section(header: Text("👨‍⚕️ Emergency Veterinary Services")) {
                    Link("🏥 ACCESS LA - 24/7 Emergency",
                         destination: URL(string: "https://accessla.org")!)
                    Link("🏥 VCA Animal Hospitals",
                         destination: URL(string: "https://vcahospitals.com/")!)
                }
                
                Section(header: Text("🦮 Animal Rescue Organizations")) {
                    Link("🐾 Lange Foundation",
                         destination: URL(string: "https://langefoundation.org/")!)
                    Link("🐎 Fleet of Angels",
                         destination: URL(string: "https://www.fleetofangels.org/")!)
                }
            }
            .navigationTitle("Pet Resources")
        }
    }
}
