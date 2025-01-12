import SwiftUI

@main
struct LA_Fire_NotifyApp: App {
    @State private var showWelcome = true
    @State private var isShowingSplash = true
    
    init() {
        // Force light mode
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isShowingSplash {
                    SplashScreen()
                        .transition(.opacity)
                } else {
                    MainTabView()
                        .preferredColorScheme(.light)
                    
                    if showWelcome {
                        WelcomeModal(isPresented: $showWelcome)
                            .transition(.opacity)
                    }
                }
            }
            .onAppear {
                // Show splash screen for 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        isShowingSplash = false
                    }
                }
            }
        }
    }
}