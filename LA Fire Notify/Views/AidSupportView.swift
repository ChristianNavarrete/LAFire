import SwiftUI

struct AidSupportView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("🆓 Free Services")) {
                    Link("🏋️‍♀️ Planet Fitness - Free Facility Access",
                         destination: URL(string: "https://www.planetfitness.com/gyms/")!)
                    
                    VStack(alignment: .leading) {
                        Text("📱 AT&T - Unlimited Service")
                        Text("Through Feb. 6")
                            .font(.caption)
                        Link("Check eligible ZIP codes",
                             destination: URL(string: "http://go.att.com/california-fires")!)
                            .font(.caption)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("📱 T-Mobile - Unlimited Service")
                        Text("Through Feb. 15")
                            .font(.caption)
                        Link("More Info",
                             destination: URL(string: "https://www.t-mobile.com/news/network/t-mobile-stands-prepared-as-wildfires-impact-southern-california")!)
                            .font(.caption)
                    }
                }
                
                Section(header: Text("🚗 Transportation")) {
                    VStack(alignment: .leading) {
                        Text("🚕 Lyft")
                        Text("Use code: CAFIRERELIEF25")
                            .font(.caption)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("🚖 Uber")
                        Text("Use code: WILDFIRE25")
                            .font(.caption)
                    }
                }
                
                Section(header: Text("📦 Storage & Moving")) {
                    Link("🚛 U-Haul - 30 Days Free Storage",
                         destination: URL(string: "https://www.documentcloud.org/documents/25483004-u-haul-california-wildfire-assistance/")!)
                }
                
                Section(header: Text("💪 Support Services")) {
                    Link("⚖️ Report Price Gouging",
                         destination: URL(string: "http://oag.ca.gov/report")!)
                    
                    VStack(alignment: .leading) {
                        Text("🍲 OBKLA (Our Big Kitchen LA)")
                        Text("Email: info@obkla.org for meals")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("🆘 Aid & Support")
        }
    }
}