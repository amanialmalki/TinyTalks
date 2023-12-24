

import SwiftUI
import AVFoundation

struct Home: View {
    @State private var newList = SampleData.newList
    @State private var commonUsed = SampleData.commonUsed
    @State private var activity = SampleData.activity
    @State private var food = SampleData.food
    @State private var ConjunctionWords = SampleData.ConjunctionWords
    @State private var isPresentingPopUpSheet = false
    @EnvironmentObject private var notificationManager: NotificationManager
    @ObservedObject private var audioPlayerViewModel = AudioPlayerViewModel()
    //View proprites
    @State private var currentlyDragging: CardContent?
    var body: some View {
        NavigationStack{
            ZStack {
                Color("Back")
                    .ignoresSafeArea(.all)
                VStack{
                    // NewListView positioned outside of ScrollView so it doesn't move
                    NewListView()
                        .zIndex(1) // Make sure the NewListView is above the ScrollView
                    // ScrollView for the rest of the content
                    ScrollView(.vertical) {
                        VStack {
                           // Spacer(minLength: 50) // Space for the NewListView
                            CommonUsedView()
                            ActivityView()
                            FoodView()
                            ConjunctionWordsView()
                        }
                        
                    }
                }
            }
        }
       }
    
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
                   // }
                    if card.constantProperty == "ConjunctionWordsConstant" {
                        VStack {
                             Text(NSLocalizedString(card.Label, comment: ""))
                                 .accessibilityHidden(true)
                                 .font(.system(size: 34))
                                 .padding(.bottom)
                                 .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .center)
                         }
                    } else{
                        Text(NSLocalizedString(card.Label, comment: ""))
                            .accessibilityHidden(true) // to not repeate the word we add it above to come
                            .font(.system(size: 34))
                            .padding(.bottom)
                    }
                   
                }
                Spacer() // Pushes content to center horizontally
                
            }
            
            Spacer() // Pushes content to center vertically
        }
        .frame(width: size.width, height: size.height) // Set the frame size of the VStack
        .frame(maxHeight: .infinity)
        
        .contentShape(.dragPreview, .rect(cornerRadius: 10))
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
            }
        }
        
        
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
    //New list View
    @ViewBuilder
    func NewListView()-> some View {
        let rectangleHeight: CGFloat = 300
           let rectangleWidth: CGFloat = UIScreen.main.bounds.width - 20 // 10 points of padding on each side

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
        ZStack{
            Circle()
                .frame(width: 80,height:80)
                .foregroundColor(.lavander)
            Image(systemName: "speaker.wave.2.fill")
                .resizable()
                .frame(width: 44,height:44)
                .foregroundColor(.beigCard)
        }.offset(y:-60)
    }.accessibilityHint("Play the sound of the sentence")
            // MARK: - the sound Button END

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
        
    //CommonUsed View
    @ViewBuilder
    func CommonUsedView()-> some View {
                VStack{
                Text("Common Used")
                        .fontWeight(.bold)
                        .font(.system(size: 42))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing])
                        .accessibilityAddTraits(.isHeader) // to say hearer after the title
                        .accessibilityHint("cards consist of an image and a word") // to read it's cards
            ScrollView(.horizontal, showsIndicators: false) {
                CardsView(commonUsed)
            }
                .dropDestination(for: String.self) { items, location in
                    //Appending to the last of Current List, if the item is not present on that list
                    withAnimation(.snappy) {
                        appendCard(.CommonUsed)
                    }
                    return true
                } isTargeted: { _ in
                    
                }
                }
            
  
    }
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
    //Food View
    @ViewBuilder
    func FoodView()-> some View {
            VStack{
            Text("Food")
                    .fontWeight(.bold)
                    .font(.system(size: 42))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .accessibilityAddTraits(.isHeader) // to say hearer after the title
                    .accessibilityHint("cards consist of an image and a word") // to read it's cards
        ScrollView(.horizontal, showsIndicators: false) {
                    CardsView(food)
                }
                    .dropDestination(for: String.self) { items, location in
                        //Appending to the last of Current List, if the item is not present on that list
                        withAnimation(.snappy) {
                            appendCard(.Food)
                        }
                        return true
                    } isTargeted: { _ in
                        
            }
    }
     
    }
    //ConjunctionWords View
    @ViewBuilder
    func ConjunctionWordsView()-> some View {
            VStack{
            Text("Conjunction Words")
                    .fontWeight(.bold)
                    .font(.system(size: 42))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .accessibilityAddTraits(.isHeader) // to say hearer after the title
                    .accessibilityHint("cards consist of an image and a word") // to read it's cards
        ScrollView(.horizontal, showsIndicators: false) {
                    CardsView(ConjunctionWords)
            
                }
                    .dropDestination(for: String.self) { items, location in
                        //Appending to the last of Current List, if the item is not present on that list
                        withAnimation(.snappy) {
                            appendCard(.ConjunctionWords)
                        }
                        return true
                    } isTargeted: { _ in
                        
            }
    }
        //.padding([.leading, .trailing, .top])
    }

}
#Preview {
    Home()
}
