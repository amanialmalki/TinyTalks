//
//  CardsView.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 22/07/1445 AH.
//

import Foundation
import SwiftUI
extension Home {
    //Tasks View
    @ViewBuilder
    func CardsView(_ cards:[CardContent])-> some View{
        HStack(spacing: 12, content: {
            ForEach(cards) { card in
                GeometryReader {
                    //Task Row
                    CardRow(card, $0.size)
                }.frame(width: 200, height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 13)
                            .fill(card.Label.isEmpty ? Color.clear : Color("beigCard"))
                    )
                    .draggable(card.id.uuidString){
                        VStack{
                                Image(card.Image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150) // Set the frame size for the image
                                    .padding(.top)
                                    .accessibilityHidden(true) // to not repeate the word we add it above to come
                                Spacer()
                            //}
                            Text(NSLocalizedString(card.Label, comment: ""))
                                .accessibilityHidden(true) // to not repeate the word we add it above to come
                                .font(.system(size: 34))
                                .padding(.bottom)
                                .contentShape(.dragPreview, .rect(cornerRadius: 10))
                                .onAppear(perform: {
                                    currentlyDragging = card
                                })
                        }}
                    .dropDestination(for:String.self){items , location in
                        currentlyDragging = nil
                        return false
                    } isTargeted: { status in
                        if let currentlyDragging, status, currentlyDragging.id != card.id{
                            withAnimation(.snappy){
                                //implement cross list interaction
                                appendCard(card.status)
                                switch card.status {
                                case.CommonUsed:
                                    replaceItem(cards: &commonUsed , droppingCard: card, status: .CommonUsed)
                                case.Activity:
                                    replaceItem(cards: &activity , droppingCard: card, status: .Activity)
                                case.Food:
                                    replaceItem(cards: &food, droppingCard: card, status: .Food)
                                case.NewList:
                                    replaceItem(cards: &newList, droppingCard: card, status: .NewList)
                                case .ConjunctionWords:
                                    replaceItem(cards: &ConjunctionWords, droppingCard: card, status: .ConjunctionWords)
                                }
                            }
                        }
                    }
                
            }
        }).frame(maxWidth:.infinity)
            .padding([.leading, .trailing])
    }
    //Card Row
    @ViewBuilder
    func CardRow(_ card: CardContent, _ size: CGSize) -> some View {
        VStack {
            Spacer() // Pushes content to center vertically
            HStack {
                Spacer() // Pushes content to center horizontally
                VStack {
                    Image(card.Image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100) // Set the frame size for the image
                        .accessibilityLabel(card.imageLabel) // to read the label of image
                        .accessibilityAddTraits(.isImage) // to make reader say image
                        .accessibilityHint(card.Label) // ton read the word after the image
                    if card.constantProperty == "ConjunctionWordsConstant" {
                        Text(NSLocalizedString(card.Label, comment: ""))
                            .accessibilityHidden(true)
                            .font(.system(size: 40))
                            .offset(y: -50)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil) // Allow unlimited number of lines
                            .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion
                        
                    } else {
                        Text(NSLocalizedString(card.Label, comment: ""))
                            .accessibilityHidden(true)
                            .font(.system(size: 34))
                            .padding(.bottom)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil) // Allow unlimited number of lines
                            .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion
                    }
                }
                Spacer()
            }
            Spacer() // Pushes content to center horizontally
            
            Spacer() // Pushes content to center vertically
        }
        .frame(width: size.width, height: size.height) // Set the frame size of the VStack
        .frame(maxHeight: .infinity)
        .contentShape(.dragPreview, .rect(cornerRadius: 10))
    }
    //Drag and drop from one list to another
    func appendCard(_ status: Status) {
        if let currentlyDragging {
            switch status {
            case .CommonUsed, .Activity, .Food,.ConjunctionWords:
                if currentlyDragging.status == .NewList {
                    if currentlyDragging.constantProperty == "CommonUsedConstant" {
                        let updatedCard = currentlyDragging
                        commonUsed.append(updatedCard)
                        newList.removeAll(where: {$0.id == currentlyDragging.id})
                    }
                    else if currentlyDragging.constantProperty == "ActivityConstant" {
                        let updatedCard = currentlyDragging
                        activity.append(updatedCard)
                        newList.removeAll(where: {$0.id == currentlyDragging.id})
                    }
                    else if currentlyDragging.constantProperty == "FoodConstant" {
                        let updatedCard = currentlyDragging
                        food.append(updatedCard)
                        newList.removeAll(where: {$0.id == currentlyDragging.id})
                    }
                    else if currentlyDragging.constantProperty == "ConjunctionWordsConstant" {
                        let updatedCard = currentlyDragging
                        ConjunctionWords.append(updatedCard)
                        newList.removeAll(where: {$0.id == currentlyDragging.id})
                    }
                }
            case.NewList:
                //safe check and inserting into list
           if !newList.contains(where: {$0.id == currentlyDragging.id}) {
               //Update it's status
               var updatedCard = currentlyDragging
               updatedCard.status = .NewList
               //Adding to the list
               newList.append(updatedCard)
               //Removing it from all another lists
               commonUsed.removeAll(where: {$0.id == currentlyDragging.id})
               activity.removeAll(where: {$0.id == currentlyDragging.id})
               food.removeAll(where: {$0.id == currentlyDragging.id})
               ConjunctionWords.removeAll(where: {$0.id == currentlyDragging.id})
                }
            }
        }
    }
    //Replacing items within the list
      func replaceItem(cards: inout[CardContent],droppingCard:CardContent, status:Status) {
          if let currentlyDragging {
              if let sourceIndex = cards.firstIndex(where: {$0.id == currentlyDragging.id}),
                 let destinationIndex = cards.firstIndex(where: {$0.id == droppingCard.id}) {
                  //Swaping items on the list
                  var sourcItem = cards.remove(at: sourceIndex)
                  sourcItem.status = status
                  cards.insert(sourcItem, at: destinationIndex)
              }
          }
      }
    
}
