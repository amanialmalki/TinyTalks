//
//  NewListView.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 22/07/1445 AH.
//

import Foundation
import SwiftUI
extension Home {
    //New list View
    @ViewBuilder
    func NewListView()-> some View {
        let rectangleHeight: CGFloat = 300
        let rectangleWidth: CGFloat = UIScreen.main.bounds.width - 20 // 10 points of padding on each side
        VStack{
            Text("Create Your Sentence")
                .fontWeight(.bold)
                .font(.system(size: 42))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing])
                .accessibilityAddTraits(.isHeader)
            ZStack {
                // Background rectangle
                Rectangle()
                    .frame(width: rectangleWidth, height: rectangleHeight)
                    .foregroundColor(Color.darkBlue) // Use the Color initializer with the name of your color
                    .cornerRadius(13)
                    .padding(.all, 10)
                
                // ScrollView for the cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        CardsView(newList)
                            .padding(.all)
                    }
                    .padding(.horizontal, 10) // This padding should match the outer padding
                }
                .frame(width: rectangleWidth, height: rectangleHeight)
                .clipped()
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.clear)
                    .opacity(0.4)
                    .cornerRadius(13)
                    .padding(.trailing, 460)
            }
                
                // MARK: - the sound Button START
                Button {
                    // speakLabelsOfNewListCards()
                    let labelsToPlay = newList.map { $0.Label }
                    // Set the current language code from the device's locale
                    audioPlayerViewModel.currentLanguageCode = Locale.current.language.languageCode?.identifier ?? "en"
                    audioPlayerViewModel.queueAudioFiles(with: labelsToPlay)
                    print("sound played")
                }
            label:{
                ZStack {
                               Circle()
                                   .frame(width: 80, height: 80)
                                   .foregroundColor(Color("lavander")) // Use the Color initializer with the name of your color
                               Image(systemName: "speaker.wave.2.fill")
                                   .resizable()
                                   .frame(width: 44, height: 44)
                                   .foregroundColor(Color("beigCard")) // Use the Color initializer with the name of your color
                           }
                       }
                       .padding(.top, -60) // Adjust this padding as needed
                       .accessibilityHint("Play the sound of the sentence")
                // MARK: - the sound Button END
            }
            // Button to show popUpView as a sheet
            .toolbar{
                Button(action: {
                    isPresentingPopUpSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .foregroundColor(.lavander)
                            .frame(width: 40, height: 40)
                            .padding(.leading)
                    }
                    .accessibilityHint("Button for description how to use the app")
                }
                .sheet(isPresented: $isPresentingPopUpSheet) {
                    popUpView()
                }
            }
            // }/*.navigationTitle("New List")*/
            .dropDestination(for: String.self) { items, location in
                //Appending to the last of Current List, if the item is not present on that list
                withAnimation(.snappy) {
                }
                return true
            } isTargeted: { _ in
                
            }
            
        }
}
