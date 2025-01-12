import SwiftUI

struct WelcomeModal: View {
    @Binding var isPresented: Bool
    @State private var opacity = 0.0
    @State private var scale = 0.8
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Text("❤️ Our Hearts Are With LA")
                        .font(.title2)
                        .bold()
                    
                    Text("Stay Safe, Stay Connected")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
                // Main Message
                VStack(spacing: 16) {
                    Text("During this challenging time, we've gathered all essential resources in one place to help our LA community.")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("Find nearby:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 12) {
                        TagView(emoji: "🐾", text: "Pet Care")
                        TagView(emoji: "💙", text: "Support")
                        TagView(emoji: "🏢", text: "Services")
                    }
                    
                    HStack(spacing: 12) {
                        TagView(emoji: "🏥", text: "Medical")
                        TagView(emoji: "🏠", text: "Shelters")
                    }
                    
                    Text("We've consolidated information from multiple sources to provide quick access to:")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        BulletPoint(text: "Emergency contact numbers")
                        BulletPoint(text: "Free services & facilities")
                        BulletPoint(text: "Evacuation centers")
                        BulletPoint(text: "Support organizations")
                    }
                }
                .padding(.vertical)
                
                // Button
                Button(action: {
                    dismiss()
                }) {
                    Text("Got it")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(24)
            .opacity(opacity)
            .scaleEffect(scale)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.2)) {
                opacity = 1.0
                scale = 1.0
            }
        }
    }
    
    private func dismiss() {
        withAnimation(.easeIn(duration: 0.2)) {
            opacity = 0.0
            scale = 0.8
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
        }
    }
}

struct TagView: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(emoji)
            Text(text)
                .font(.caption)
                .bold()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }
}

struct BulletPoint: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundColor(.blue)
            Text(text)
                .font(.subheadline)
        }
    }
}