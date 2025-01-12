import SwiftUI

struct AnimatedMarkerView: View {
    let emoji: String
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Text(emoji)
            .font(.system(size: 30))
            .shadow(radius: 2)
            .scaleEffect(scale)
            .animation(
                Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true),
                value: scale
            )
            .onAppear {
                scale = 1.2
            }
    }
}