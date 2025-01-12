import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            // Add .resizable() before frame to ensure proper sizing
            if let uiImage = UIImage(named: "icon") {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            } else {
                // Fallback text to help debug if image isn't loading
                Text("Loading...")
            }
        }
    }
}

#Preview {
    SplashScreen()
}
