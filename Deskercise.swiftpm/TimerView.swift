//
//  TimerView.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 09/04/23.
//

// Credit
//
// Thanks to Indently's video for help me create this Timer view. I almost give up because I don't understand how to navigate the screen automaticly when the time is 0. But, Yeah this is it. Takes a couple night for me to solve this problem 🥲

import SwiftUI



struct TimerView: View {
    @StateObject var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        
        VStack {
            Text("\(vm.time)")
                .font(.system(size: 72, weight: .bold))
                .padding()
                .frame(width: width)
                .background(.thinMaterial)
                .cornerRadius(16)
            
            Slider(value: $vm.minutes, in: 1...60, step: 1)
                .padding()
                .frame(maxWidth: width)
                .disabled(vm.isActive)
                .animation(.easeInOut, value: vm.minutes)
            
            Spacer()
            
            HStack(spacing: 16) {
                
                // Reset Button start
                withAnimation(.linear(duration: 1.0)) {
                    Button("Reset") {
                        vm.reset()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .foregroundColor(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.red, lineWidth: 2)
                    )
                    .cornerRadius(16)
                }
                
                
                withAnimation(.linear) {
                    Button(!vm.isActive ? "Start" : "Pause") {
                        if !vm.isActive {
                            vm.start(minutes: vm.minutes)
                        } else {
                            vm.isActive = false
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 48)
                    .background(!vm.isActive ? Color.primaryOrange : Color.gray.opacity(0.4))
                    .foregroundColor(!vm.isActive ? Color.onPrimaryOrange : Color.white)
                    .cornerRadius(16)
                    .disabled(vm.changeScreen)
                }
                
                
                NavigationLink(destination: TimesUpView(items: items), isActive: $vm.changeScreen) {EmptyView()}
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

struct ButtonStart {
    var body: some View {
        VStack{
            
        }
    }
}
