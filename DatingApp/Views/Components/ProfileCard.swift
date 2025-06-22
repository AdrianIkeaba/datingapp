//
//  ProfileCard.swift
//  DatingApp
//
//  Created by GHØβT on 20/06/2025.
//

import SwiftUI

struct ProfileCard: View {
    let name: String
    let question: String
    let image: String
    let hasNotification: Bool
    let isStackedCard: Bool
    
    var body: some View {
        ZStack {
            if isStackedCard {
                Rectangle()
                    .fill(Color(red: 34/255, green: 34/255, blue: 34/255))
                    .cornerRadius(20)
                
                StackedProfileImages()
            } else {
                ProfileCardBackground(image: image, blur: name != "Bingham, 28")
                
                // Top overlay elements
                VStack {
                    HStack {
                        // Left side - notification or megaphone
                        if name == "Bingham, 28" {
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.6))
                                    .frame(width: 32, height: 32)
                                
                                Text("📣")
                                    .font(.system(size: 14))
                            }
                        } else if hasNotification {
                            HStack(spacing: 6) {
                                Text("📣 They made a move!")
                                    .font(.system(size: 9, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                            }
                            .frame(height: 19)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(16)
                        } else {
                            Spacer()
                                .frame(width: 32, height: 32)
                        }
                        
                        // Right side - timer for Bingham only
                        if name == "Bingham, 28" {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 32, height: 32)
                                
                                Circle()
                                    .trim(from: 0, to: 0.75)
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 26, height: 26)
                                    .rotationEffect(.degrees(-90))
                                
                                Text("16h")
                                    .font(.system(size: 9, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.top, 14)
                    
                    Spacer()
                }
                
                // Center "Tap to answer" text
                VStack {
                    if (name != "Bingham, 28") {
                        Spacer()
                        Text("Tap to answer")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Color(red: 168/255, green: 175/255, blue: 183/255))
                        
                        Spacer()
                    }

                }
                
                // Bottom content
                VStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        // Name
                        Text(name)
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.bottom, 8)
                        
                        // Question
                        Text(question)
                            .font(.system(size: 10, weight: .regular))
                            .foregroundColor(Color(red: 207/255, green: 207/255, blue: 254/255))
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .lineSpacing(2)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
        }
        .frame(width: !isStackedCard ? 165 : 90, height: 233)
        .cornerRadius(20)
        .clipped()
    }
}

struct StackedProfileImages: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("stack")
                .scaledToFill()
            
            Spacer()
        }
    }
}

struct ProfileCardBackground: View {
    let image: String
    let blur: Bool

    var body: some View {
        GeometryReader { geo in
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .blur(radius: blur ? 20 : 0)
                .overlay(blur ? Color.black.opacity(0.4) : Color.clear)
                .cornerRadius(24)
                .clipped()
        }
    }
}
