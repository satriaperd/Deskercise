//
//  ItemRow.swift
//  Deskercise 2
//
//  Created by Satria Perdana on 09/04/23.
//


//
// Credit
//
// This screen I made with helping from Paul Hudson's Video to help me understanding about passing the data


import SwiftUI

struct ItemRow: View {
    var item: Item
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.secondaryDarkBlue)
            Text("\(item.number)")
                .fontWeight(.bold)
        }
        .foregroundColor(Color.onSecondaryDarkBlue)
        .frame(maxWidth: 32, maxHeight: 32)
        Text(item.title)
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item.example)
    }
}
