//
//  SplashView.swift
//  TinyTalks
//
//  Created by Afrah Saleh on 07/06/1445 AH.
//

import SwiftUI
import UserNotifications

struct SplashView: View {
    @AppStorage("currentPage") var currentPage = 1
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        ZStack {
            if self.isActive {
                if currentPage > totalPages{
                    Home()
                }
                else{
                    Walkthrough()
                }
               
                
            } else {
                Color("Back")
                    .ignoresSafeArea()
                VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                        
              
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 1.9
                            self.opacity = 1.00
                        }
                                    // Request notification permission
                                    requestNotificationPermission()
                                }
                              }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error)")
            } else if granted {
                print("Notification permission granted.")
                // You can schedule a notification here if needed
            } else {
                print("Notification permission denied.")
            }
        }
    }
}
#Preview {
    SplashView()
}
