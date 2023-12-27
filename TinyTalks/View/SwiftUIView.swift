//
//  SwiftUIView.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 14/06/1445 AH.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .foregroundColor(Color("lavander")) // Use the Color initializer with the name of your color
        Image(systemName: "speaker.wave.2.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(Color("beigCard")
            )
    }

}

#Preview {
    SwiftUIView()
}
