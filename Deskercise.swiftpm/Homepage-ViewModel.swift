//
//  Homepage-ViewModel.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 07/04/23.
//

//
// Credit
/*
 I created this with the help of a video titled "Build a SwiftUI Custom Countdown Timer app for iOS 15 (2022)" to understand the concept and logic behind the Timer feature. And I also used ChatGPT to provide examples in its application in programming.
 */

import Foundation

extension TimerView {
    
    final class ViewModel: ObservableObject {
        @Published var isActive: Bool = false
        @Published var changeScreen: Bool = false
        @Published var time: String = "40:00"
        @Published var minutes: Float = 40.0 {
            didSet {
                self.time = "\(Int(minutes)):00"
            }
        }
        
        private var initialTime = 0
        private var endOfDate = Date()
        
        func start(minutes: Float) {
            self.initialTime = Int(minutes)
            self.endOfDate = Date()
            self.isActive = true
            self.endOfDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endOfDate)!
        }
        
        func pause() {
            isActive = false
        }
        
        func unpause() {
            isActive = true
        }
        
        func reset() {
            self.minutes = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func updateCountdown() {
            guard isActive else { return }
            
            let now = Date()
            let diff = endOfDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00"
                self.changeScreen = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
        }
        
    }
    
}
