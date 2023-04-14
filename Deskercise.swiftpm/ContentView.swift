import SwiftUI


// Creadit
/*
I made this splash screen with the help of a YouTube video titled "SplashScreen for iOS in SwiftUI Tutorial 2022 (Xcode)" from the indently YouTube channel.
 */

struct ContentView: View {
    @State var isActive: Bool = false
    @State private var size = 0.7
    @State private var opacity: Double = 0.0
    @State private var ornamentAnimation: Bool = false
    @State private var offsetYOrnament1: Double = -500
    @State private var offsetYOrnament2: Double = 480
    
    
    var body: some View {
        
        if isActive {
            HomepageView()
        } else {
            ZStack {
                
                Image("ornament-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 320)
                    .offset(x: 120, y: offsetYOrnament1)
                    .onAppear{
                        ornamentAnimation = true
                        withAnimation(.easeInOut(duration: 1)) {
                            if ornamentAnimation {
                                offsetYOrnament1 = -400
                            }
                        }
                    }
                    .ignoresSafeArea(.all)
                
                Image("ornament-2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 320)
                    .offset(x: -120, y: offsetYOrnament2)
                    .onAppear{
                        ornamentAnimation = true
                        withAnimation(.easeInOut(duration: 1)) {
                            if ornamentAnimation {
                                offsetYOrnament2 = 320
                            }
                        }
                    }
                    .ignoresSafeArea(.all)
                
                
                VStack(alignment: .leading) {
                    VStack (alignment: .leading){
                        Image(systemName: "figure.cooldown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(Color.orange)
                            .frame(width: 40, height: 40)
                        
                        Text("deskercise".uppercased())
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                        
                        Text("Stay active. Stay productive")
                            .foregroundColor(Color.gray)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeOut(duration: 1.2)) {
                            self.size = 1.0
                            self.opacity = 1.0
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeInOut) {
                            self.isActive = true
                        }
                    }
            }
            }
        
        }
    }
}

