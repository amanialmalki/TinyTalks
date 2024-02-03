//
//  ActivityView.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 22/07/1445 AH.
//

import Foundation
import SwiftUI
extension Home {
    //Activity View
    @ViewBuilder
    func ActivityView()-> some View {
                VStack{
                Text("Activity")
                        .fontWeight(.bold)
                        .font(.system(size: 42))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing])
                        .accessibilityAddTraits(.isHeader) // to say hearer after the title
                        .accessibilityHint("cards consist of an image and a word") // to read it's cards
            ScrollView(.horizontal, showsIndicators: false) {
                    CardsView(activity)
                }
                    .dropDestination(for: String.self) { items, location in
                        //Appending to the last of Current List, if the item is not present on that list
                        withAnimation(.snappy) {
                            appendCard(.Activity)
                        }
                        return true
                    } isTargeted: { _ in
                        
                    }
            }
    }
}
    
