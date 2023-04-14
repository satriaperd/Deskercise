//
//  HomepageView.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 07/04/23.
//

//
//Credit
// I made this with my own knowledge of layouting in Flutter and React Native and also helping for tech youtuber to help me with the logic. Shout out to Swiftui Thinking, Paul Hudson, Indently, Kavsoft, Rebeloper, and many more for helping me create my first SwiftUI Program 🫡

import Foundation
import SwiftUI

let defaultTimerRemaining: CGFloat = 30
let lineWith: CGFloat = 20
let radius: CGFloat = 120


struct HomepageView: View {
    
    @StateObject private var vm = TimerView.ViewModel()
    
    @State private var isActive: Bool = false
    @State private var timeRemaining: CGFloat = defaultTimerRemaining
    @State private var startLabel: String = "Start"
    @State private var isAnimated: Bool = false
    @State private var offsetX: Double = 120
    @State private var offsetY: Double = -500
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack {
                
                Image("ornament-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 320)
                    .onAppear{
                        isAnimated = true
                        
                        withAnimation(.easeInOut(duration: 1)) {
                            if isAnimated {
                                offsetY = -400
                            }
                        }
                    }
                    .offset(x: 120, y: offsetY)
                    .ignoresSafeArea(.all)

                
                VStack(spacing: 24) {
                    
                    VStack (spacing: 4) {
                        Text("Deskercise".uppercased())
                            .font(.headline)
                            .fontWeight(.heavy)
                        
                        Text("Stay active. Stay productive".capitalized)
                            .font(.caption)
                            .opacity(0.6)
                    }
                    .padding()

                    Rectangle()
                        .fill(Color.clear)
                        .frame(maxHeight: 22)
                    
                    VStack (spacing: 10) {
                        Text("👨🏻‍💻")
                            .font(.system(size: 48))
                        
                        VStack (spacing: 4) {
                            Text("Time to get in the zone!".capitalized)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Let's set your focus time before next strech.")
                                .foregroundColor(.black.opacity(0.6))
                        }

                    }
                    VStack {
                        TimerView()
                    }
                    .padding()
                }
            }
        }
        .navigationViewStyle(.stack)
        
        .onAppear(){
            isAnimated = true
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
