//
//  DetailedView.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 08/04/23.
//

//
// Credit
// I made this splash screen with the help of a YouTube video titled "SwiftUI Starter Project " from the Paul Hudson YouTube channel.


import SwiftUI

struct DetailedView: View {
    
    var item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack (alignment: .leading, spacing: 12) {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                VStack (alignment: .leading, spacing: 10) {
                    ForEach(item.numberedDescriptions, id: \.self) {description in
                        Text(description)
                            .opacity(0.87)
                    }
                }
            }
            .padding()
            
            Spacer()
            
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(item: Item.example)
    }
}
