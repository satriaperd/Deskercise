//
//  TimesUpView.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 07/04/23.
//

//
// Credit
//
// Paul Hudson help me a lot to create the screen! He's help me understand how to show data from other file.And LearnEDU help create the custom back button using presentationMode.

import SwiftUI

struct TimesUpView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var items: [Item]
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    VStack (spacing: 10) {
                        Text("⏰")
                            .font(.system(size: 40))
                        
                        Text("Time's Up!".uppercased())
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Text("It's stretch time! Follow Deskercise's lead and feel the tension melt away.")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: DetailedView(item: item)) {
                                ItemRow(item: item)
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    
                    
                    Spacer()
                    
                    HStack{
                        Button("Back") {
                            presentationMode.wrappedValue.dismiss()
                        }
                            .frame(maxWidth: .infinity, maxHeight: 44)
                            .foregroundColor(.onSecondaryDarkBlue)
                            .background(Color.secondaryDarkBlue)
                            .cornerRadius(16)
                    }
                    .padding()

                    
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TimesUpView_Previews: PreviewProvider {
    static var previews: some View {
        TimesUpView(items: items)
    }
}
