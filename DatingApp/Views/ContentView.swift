//
//  ContentView.swift
//  DatingApp
//
//  Created by GHØβT on 20/06/2025.
//

import SwiftUI
import Combine


 struct ContentView: View {
     @State private var selectedTab = 2
     
     var body: some View {
         ZStack {
             StarryBackground()
             
             VStack(spacing: 0) {

                 VStack(spacing: 16) {
                     // Header
                     HStack {
                         VStack(alignment: .leading, spacing: 4) {
                             HStack {
                                 Text("Your Turn")
                                     .font(.system(size: 32, weight: .bold))
                                     .foregroundColor(.white)
                                 

                                 ZStack {
                                     Circle()
                                         .fill(Color(red: 0.71, green: 0.60, blue: 0.82))
                                         .frame(width: 24, height: 24)
                                     
                                     Text("7")
                                         .font(.system(size: 14, weight: .bold))
                                         .foregroundColor(.black)
                                 }
                             }
                             
                             Text("Make your move, they are waiting 🎵")
                                 .font(.system(size: 16))
                                 .foregroundColor(.white.opacity(0.7))
                                 .italic()
                         }
                         
                         Spacer()
                         
                         // Top right profile with score
                         VStack(spacing: 4) {
                             ZStack {
                                 Circle()
                                     .stroke(
                                         AngularGradient(
                                             colors: [
                                                 Color(red: 0.30, green: 0.55, blue: 0.15),
                                                 Color(red: 0.21, green: 0.39, blue: 0.10),
                                                 Color(red: 0.21, green: 0.39, blue: 0.10)
                                             ],
                                             center: .center
                                         ),
                                         lineWidth: 3
                                     )
                                     .frame(width: 50, height: 50)
                                 
                                 // Profile image
                                 Image("photo")
                                     .resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 44, height: 44)
                                     .clipShape(Circle())
                                     .foregroundColor(.gray)
                             }
                             .shadow(color: Color(red: 106/255.0, green: 98/255.0, blue: 159/255.0).opacity(0.3), radius: 10, x: 0, y: 5)
                             
                             HStack {
                                 Text("90")
                                     .font(.system(size: 16, weight: .bold))
                                     .foregroundColor(.white)
                                     .padding(.horizontal, 12)
                                     .padding(.vertical, 1)
                             }
                             .background(Color(red: 18/255, green: 22/255, blue: 31/255))
                             .cornerRadius(10)
                             .offset(y: -15)
                         }
                     }
                     .padding(.horizontal, 20)
                     
                     
                     // Game cards
                     ScrollView(.horizontal, showsIndicators: false) {
                         HStack(spacing: 20) {
                             ProfileCard(
                                 name: "Amanda, 22",
                                 question: "What is your most favorite childhood memory?",
                                 image: "amanda",
                                 hasNotification: false,
                                 isStackedCard: false
                             )
                             .frame(width: 145)
                             
                            
                             ProfileCard(
                                 name: "Malte, 31",
                                 question: "What is the most important quality in friendships to you?",
                                 image: "malte",
                                 hasNotification: true,
                                 isStackedCard: false
                             )
                             .frame(width: 145)
                             
                             ProfileCard(
                                 name: "Bingham, 28",
                                 question: "If you could choose to have one superpower, what would it be?",
                                 image: "bingham",
                                 hasNotification: false,
                                 isStackedCard: false
                             )
                             .frame(width: 145)
                             
                             ProfileCard(
                                 name: "",
                                 question: "",
                                 image: "",
                                 hasNotification: false,
                                 isStackedCard: true
                             )
                             .frame(width: 90)
                         }
                         .padding(.horizontal, 20)
                     }
                 }
                 .padding(.top, 20)
                 
                 Spacer(minLength: 40)
                 
                 // Chat section
                 VStack(alignment: .leading, spacing: 0) {
                     HStack(alignment: .bottom) {
                         Text("Chats")
                             .font(.system(size: 22, weight: .bold))
                             .foregroundColor(.white)
                         
                         Text("Pending")
                             .font(.system(size: 22, weight: .bold))
                             .foregroundColor(.white.opacity(0.4))
                             .padding(.leading, 8)
                         
                         Spacer()
                     }
                     .padding(.horizontal, 20)
                     .padding(.bottom, 8)
                     
                     HStack {
                         Rectangle()
                             .fill(Color.white)
                             .frame(width: 60, height: 2)
                         
                         Spacer()
                     }
                     .padding(.horizontal, 20)
                     .padding(.bottom, 16)
                     
                     Text("The ice is broken. Time to hit it off")
                         .font(.system(size: 16))
                         .foregroundColor(.white.opacity(0.7))
                         .italic()
                         .padding(.horizontal, 20)
                         .padding(.bottom, 20)
                     
                     ScrollView {
                         LazyVStack(spacing: 0) {
                             ChatRow(
                                 name: "Jessica",
                                 message: "",
                                 time: "6:21 pm",
                                 profileImage: "jessica",
                                 isVoiceMessage: true,
                                 voiceDuration: "00:58",
                                 badge: nil,
                                 tag: "New chat"
                             )
                             
                             ChatRow(
                                 name: "Amanda",
                                 message: "Lol I love house music too",
                                 time: "6:21 pm",
                                 profileImage: "amanda",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: nil,
                                 tag: "Your move"
                             )
                             
                             ChatRow(
                                 name: "Sila",
                                 message: "You: I love the people there tbh, have you been?",
                                 time: "Wed",
                                 profileImage: "sila",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: nil,
                                 tag: nil
                             )
                             
                             ChatRow(
                                 name: "Marie",
                                 message: "Hahaha that's interesting, it does seem like people here are startin...",
                                 time: "6:21 pm",
                                 profileImage: "marie",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: "4",
                                 tag: "Your move"
                             )
                             
                             ChatRow(
                                 name: "Jessica",
                                 message: "Looking forward to it!",
                                 time: "6:21 pm",
                                 profileImage: "sila",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: nil,
                                 tag: "Your move"
                             )
                             
                             ChatRow(
                                 name: "Sarah",
                                 message: "That sounds amazing! When are we meeting?",
                                 time: "5:45 pm",
                                 profileImage: "amanda",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: "2",
                                 tag: nil
                             )
                             
                             ChatRow(
                                 name: "Mike",
                                 message: "You: Great! See you there",
                                 time: "4:30 pm",
                                 profileImage: "photo",
                                 isVoiceMessage: false,
                                 voiceDuration: nil,
                                 badge: nil,
                                 tag: "Your move"
                             )
                         }
                     }
                     .background(Color.black.opacity(0.3))
                 }
                 Spacer()
                 
                 CustomTabBar(selectedTab: $selectedTab)
             }
         }
     }
 }


struct StarryBackground: View {
    @State private var stars: [Star] = []
    @State private var timer: AnyCancellable?
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            // Stars pattern
            Canvas { context, size in
                for star in stars {
                    let path = Path(ellipseIn: CGRect(x: star.x, y: star.y, width: star.size, height: star.size))
                    context.fill(
                        path,
                        with: .color(.white.opacity(star.opacity))
                    )
                }
            }
            .ignoresSafeArea(.all)
        }
        .onAppear {
            setupStarsAndTimer()
        }
        .onDisappear {
            cleanupTimer()
        }
    }
    
    private func setupStarsAndTimer() {
        let screenBounds = UIScreen.main.bounds
        stars = generateStars(for: screenBounds.size)
        
        timer = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                for i in 0..<stars.count {
                    stars[i].opacity = Double.random(in: 0.2...0.8)
                }
            }
    }
    
    private func generateStars(for size: CGSize) -> [Star] {
        var newStars: [Star] = []
        let totalHeight = Double(size.height)
        let fadeStartPoint = totalHeight * 0.4
        let fadeEndPoint = totalHeight * 0.55
        
        let topStars = 200
        for _ in 0..<topStars {
            let x = Double.random(in: 0...Double(size.width))
            let y = Double.random(in: 0...fadeStartPoint)
            let starSize = Double.random(in: 0.5...2.0)
            let opacity = Double.random(in: 0.3...0.9)
            
            newStars.append(Star(x: x, y: y, size: starSize, opacity: opacity))
        }
        
        let fadeZoneStars = 50
        for _ in 0..<fadeZoneStars {
            let x = Double.random(in: 0...Double(size.width))
            let y = Double.random(in: fadeStartPoint...fadeEndPoint)
            let starSize = Double.random(in: 0.5...1.5)
            
            // Calculate fade based on position in fade zone
            let fadeProgress = (y - fadeStartPoint) / (fadeEndPoint - fadeStartPoint)
            let baseOpacity = 0.3 + (0.6 * (1.0 - fadeProgress))
            let opacity = Double.random(in: max(0.1, baseOpacity - 0.2)...baseOpacity)
            
            newStars.append(Star(x: x, y: y, size: starSize, opacity: opacity))
        }
        
        return newStars
    }
    
    private func cleanupTimer() {
        timer?.cancel()
    }
}

struct Star: Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    var size: Double
    var opacity: Double
}

#Preview {
    ContentView()
}
