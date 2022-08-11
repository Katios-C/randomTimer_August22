

import SwiftUI
import iOSDevPackage

struct ContentView: View {
    @StateObject private var randomTimerEngine = EngineViewModel()
    @EnvironmentObject private var navigation: NavigationControllerViewModel
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
              VStack{
                VStack {
                    Text(hoursTimerIsActiveString)
                        .padding()
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Text("\(randomTimerEngine.hoursAmount)")
                        .font(.title)
                    
                    
                    Stepper("", value: $randomTimerEngine.hoursAmount, in: 0...24)
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.red)
                }
                
                VStack {
                    Text(howMuchAlertsWantGetString)
                        .padding()
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Text("\(randomTimerEngine.alertsAmount)")
                        .font(.title)
                    
                    
                    Stepper("", value: $randomTimerEngine.alertsAmount, in: 0...100)
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.red)
                }
            }
            
            TextField(inputTextString, text: $randomTimerEngine.text)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("") {
                if randomTimerEngine.hoursAmount > 0 && randomTimerEngine.alertsAmount > 0 {
                    randomTimerEngine.startNotification()
                    navigation.push(SummoryView(randomTimerEngine: randomTimerEngine))
                } else {
                    showingAlert = true
                    print(stringCanNotBeEmpty)
                }
            }
            .alert(stringCanNotBeEmpty, isPresented: $showingAlert) {
                       Button("OK", role: .cancel) { }
                   }
            .buttonStyle(CustomButton(text:"Старт"))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

