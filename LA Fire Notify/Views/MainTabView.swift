import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    init() {
        // Custom tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        appearance.shadowColor = UIColor.black.withAlphaComponent(0.3)
        
        // Use this appearance for both normal and scrolling
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        // Force light mode colors
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().tintColor = .systemBlue
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MapView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
                .tag(0)
            
            EmergencyServicesView()
                .tabItem {
                    Label("Emergency", systemImage: "cross.case.fill")
                }
                .tag(1)
            
            AidSupportView()
                .tabItem {
                    Label("Aid", systemImage: "hand.raised.fill")
                }
                .tag(2)
            
            PetResourcesView()
                .tabItem {
                    Label("Pets", systemImage: "pawprint.fill")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

struct CustomTabItem: View {
    let imageName: String
    let title: String
    let isMap: Bool
    
    var body: some View {
        if isMap {
            Label(title, systemImage: imageName)
        } else {
            // Non-map tabs get white circular background
            Label(title, systemImage: imageName)
                .padding(6)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.9))
                        .shadow(radius: 2)
                )
        }
    }
}