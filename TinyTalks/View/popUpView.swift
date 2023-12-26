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
                            .frame(width:550, height: 300)
                            .cornerRadius(13)
                            //.environment(\.locale, .current)
//                    ZStack {
//                        // Background rectangle
//                        Rectangle()
//                            .frame(width: 400, height: 400)
//                            .foregroundColor(Color.darkBlue) // Use the Color initializer with the name of your color
//                            .cornerRadius(13)
//                            .padding(.all, 10)
//
//                            .padding(.horizontal, 10) // This padding should match the outer padding
                        }
                    Text("Drag & Drop and let it speak out loud ")
                        .fontWeight(.bold)
                        .font(.title)
                        .accessibilityLabel("Drag & Drop and let it speak out loud")
                        .offset(y:200)
                    }
                       
                    //}

                    
                }
                   
                }
       
            .background(Color("Back"))
            .ignoresSafeArea(.all)
        }
        
    }


#Preview {
    popUpView()
}
