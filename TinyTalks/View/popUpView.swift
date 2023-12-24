//
//  popUpView.swift
//  TinyTalks
//
//  Created by Samaa on 19/12/2023.
//

import SwiftUI

struct popUpView: View {

    var body: some View {
        ZStack{
            Color("Back")
                .ignoresSafeArea(.all)
            
            NavigationStack{
                ZStack{
                    Color("Back")
                        .ignoresSafeArea(.all)
                    VStack{
                        Image("Card _description")
                            .resizable()
                            .frame(width:600, height: 400)
                            .environment(\.locale, .current)
                        Text("Drag & Drop and let it speak out loud ")
                            .fontWeight(.regular)
                            .font(.largeTitle)
                            .accessibilityLabel("Drag & Drop and let it speak out loud")
                    }

                    
                }
                   
                }
       
            .background(Color("Back"))
            .ignoresSafeArea(.all)
        }
        
    }
    }

#Preview {
    popUpView()
}
