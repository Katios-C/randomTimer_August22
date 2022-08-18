//import SwiftUI
//
//struct SplashScreen: View {
//  static var shouldAnimate = true
//  let fuberBlue = Color("Fuber blue")
//  let uLineWidth: CGFloat = 5
//  let uZoomFactor: CGFloat = 1.4
//  let lineWidth:  CGFloat = 4
//  let lineHeight: CGFloat = 28
//  let uSquareLength: CGFloat = 12
//  
//  @State var percent = 0.0
//  @State var uScale: CGFloat = 1
//  @State var squareColor = Color.white
//  @State var squareScale: CGFloat = 1
//  @State var lineScale: CGFloat = 1
//  @State var textAlpha = 0.0
//  @State var textScale: CGFloat = 1
//  @State var coverCircleScale: CGFloat = 1
//  @State var coverCircleAlpha = 0.0
//  
//  var body: some View {
//    ZStack {
//      Image("Chimes")
//        .resizable(resizingMode: .tile)
//        .opacity(textAlpha)
//        .scaleEffect(textScale)
//      
//      Circle()
//        .fill(fuberBlue)
//        .frame(width: 1, height: 1,
//               alignment: .center)
//        .scaleEffect(coverCircleScale)
//        .opacity(coverCircleAlpha)
//      
//      Text("F           BER")
//        .font(.largeTitle)
//        .foregroundColor(.white)
//        .opacity(textAlpha)
//        .offset(x: 20, y: 0)
//        .scaleEffect(textScale)
//      
//      FuberU(percent: percent)
//        .stroke(Color.white, lineWidth: uLineWidth)
//        .rotationEffect(.degrees(-90))
//        .aspectRatio(1, contentMode: .fit)
//        .padding(20)
//        .onAppear() {
//          self.handleAnimations()
//      }
//      .scaleEffect(uScale * uZoomFactor)
//      .frame(width: 45, height: 45,
//             alignment: .center)
//      
//      Rectangle()
//        .fill(squareColor)
//        .scaleEffect(squareScale * uZoomFactor)
//        .frame(width: uSquareLength, height: uSquareLength,
//               alignment: .center)
//        .onAppear() {
//          self.squareColor = self.fuberBlue
//      }
//      
//      Rectangle()
//        .fill(fuberBlue)
//        .scaleEffect(lineScale, anchor: .bottom)
//        .frame(width: lineWidth, height: lineHeight,
//               alignment: .center)
//        .offset(x: 0, y: -22)
//      
//      Spacer()
//    }
//    .background(fuberBlue)
//    .edgesIgnoringSafeArea(.all)
//  }
//}


import SwiftUI

struct SplashView: View {
    @StateObject private var randomTimerEngine = EngineViewModel()
    
    // 1.
    @State var isActive = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
              ContentView()
            } else {
                // 4.
                VStack{
                    Color.cyan
                        .padding()
                        
                Text("Awesome Splash Screen!")
                    .font(Font.largeTitle)
                Image("1")
                    .resizable()
                    .scaledToFit()
                }
            }
        }
        // 5.
        .onAppear {
            randomTimerEngine.getListOfNotificatio()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}
