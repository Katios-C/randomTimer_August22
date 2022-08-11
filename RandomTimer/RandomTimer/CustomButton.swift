import SwiftUI

struct CustomButton: ButtonStyle {
    var text: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Text(text)
        }
        .padding()
        .background(Color(red: 53.0/255.0, green: 170.0/255.0, blue: 255.0/255.0))
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}
