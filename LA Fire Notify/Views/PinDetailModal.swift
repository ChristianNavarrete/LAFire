import SwiftUI

struct PinDetailModal: View {
    let resource: ResourceLocation
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
                HStack {
                    Text(resource.type.emoji)
                        .font(.title2)
                    Text(resource.name)
                        .font(.headline)
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                
                // Details
                if let details = resource.details {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(details.components(separatedBy: "\n"), id: \.self) { line in
                                if line.contains("📞") {
                                    // Make phone numbers tappable
                                    let number = line.components(separatedBy: "📞 ")[1]
                                    Button(action: {
                                        if let url = URL(string: "tel://\(number.filter { "0123456789".contains($0) })") {
                                            UIApplication.shared.open(url)
                                        }
                                    }) {
                                        Text(line)
                                            .foregroundColor(.blue)
                                    }
                                } else {
                                    Text(line)
                                }
                            }
                        }
                    }
                }
                
                // Action buttons based on resource type
                if resource.type == .shelter {
                    Button(action: {
                        // Open in Maps
                        let address = resource.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        if let url = URL(string: "maps://?q=\(address)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Get Directions", systemImage: "map.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
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