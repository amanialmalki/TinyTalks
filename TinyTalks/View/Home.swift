

import SwiftUI
import AVFoundation

struct Home: View {
    @State  var newList = SampleData.newList
    @State  var commonUsed = SampleData.commonUsed
    @State  var activity = SampleData.activity
    @State  var food = SampleData.food
    @State  var ConjunctionWords = SampleData.ConjunctionWords
    @State  var isPresentingPopUpSheet = false
    @EnvironmentObject  var notificationManager: NotificationManager
    @ObservedObject  var audioPlayerViewModel = AudioPlayerViewModel()
    //View proprites
    @State var currentlyDragging: CardContent?
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
                        VStack (spacing:60){
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



}
#Preview {
    Home()
}
