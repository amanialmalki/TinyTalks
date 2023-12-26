//
//  Walkthrough.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 13/06/1445 AH.
//

import SwiftUI

struct Walkthrough: View {
    @AppStorage("currentPage") var currentPage = 1

    var body: some View {
        ZStack{
            if currentPage == 1 {
                ScreenView(baseImageName: "drag", title: "Step 1", detail: "Hold on th card to drag it", bgColor: Color("Back"))
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(baseImageName: "drop", title: "Step 2", detail: "Drag the card inside the box", bgColor: Color("Back"))
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(baseImageName: "speak", title: "Step 3", detail: "Press to let it speak!!", bgColor: Color("Back"))
                    .transition(.scale)
            }
     
        }
        .overlay(
            //button
            Button(action: {
                //changing views
                withAnimation(.easeInOut){
                    //checking
                    if currentPage < totalPages{
                        currentPage += 1
                    }
                    else{
                        //for app test
                        currentPage = 4
                    }
                }
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color("lavander"))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                //circular slider
                    .overlay(
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04),lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0 , to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color("lavander"), lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                            .padding(-15)
                        )

            })
            .padding(.bottom,60)
            ,alignment: .bottom
            )
    }
}

#Preview {
    Walkthrough()
}

struct ScreenView: View {
  //  var image: String
    var baseImageName: String
    var title: String
    var detail: String
    var bgColor: Color
     @AppStorage("currentPage") var currentPage = 1
    var imageNameWithLocale: String {
         ScreenView.localizedImageName(for: baseImageName)
     }
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        VStack(spacing: 20){
            HStack{

                if currentPage == 1{
                    Text("Hello!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .kerning(1.4)
                        .foregroundColor(Color.black)
                        .padding(.all)
                }
                else{
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: layoutDirection == .rightToLeft ? "chevron.right" : "chevron.left")
                            .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Color("lavander").opacity(0.4))
                                    .cornerRadius(10)
                    }).padding(.all)
                }
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut){
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("lavander"))
                       // .kerning(1.2)
                })
            }
            .foregroundColor(.black)
            .padding()
            Spacer(minLength: 100)
            
            Image(imageNameWithLocale)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            //Text(title)
            Text(NSLocalizedString(title, comment: ""))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            
         //   Text (detail)
            Text(NSLocalizedString(detail, comment: ""))
                .fontWeight(.semibold)
               //.kerning(1.3)
                .multilineTextAlignment(.center)
            Spacer(minLength: 200)
        }
        .background(bgColor.ignoresSafeArea(.all))
        
        
    }
    // Helper function to determine the correct image name based on the current locale
        static func localizedImageName(for baseName: String) -> String {
            let locale = Locale.current
            let identifier: String
            if #available(iOS 16.0, *) {
                identifier = locale.language.languageCode!.identifier
            } else {
                identifier = locale.languageCode ?? "en"
            }
            let suffix = (identifier == "ar") ? "_ar" : "_en"
            return baseName + suffix
        }
 
}

//total pages
var totalPages = 3
