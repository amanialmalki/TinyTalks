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
                    Rectangle()
                        .frame(width: 780,height: 820)
                        .foregroundColor(.clear)
                        .border(Color("lavander"), width: 4)
                        .cornerRadius(13)
                        .padding(.all)
                    NavigationLink(destination: Home().navigationBarBackButtonHidden(false))  {
                       // HStack {
                        label:do {
                            Image(systemName: "xmark").resizable()
                                .foregroundColor(.lavander)
                                .frame(width: 50, height: 50)
                                .padding(.leading,650)
                                .padding(.bottom,700)
  
                }
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
//sheetShowing: .constant(true)
