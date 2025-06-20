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
                
                if name == "Bingham, 28" {
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.8))
                                    .frame(width: 28, height: 28)
                                
                                Text("📣")
                                    .font(.system(size: 10))
                            }
                            
                            Spacer()
                            
                            ZStack {

                                Circle()
                                    .fill(Color.gray.opacity(0.6))
                                    .frame(width: 24, height: 24)
                                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 2)
                                
                                Circle()
                                    .trim(from: 0, to: 0.75)
                                    .stroke(Color.white.opacity(0.8), lineWidth: 2)
                                    .frame(width: 24, height: 24)
                                    .rotationEffect(.degrees(-90))
                                
                                Text("16h")
                                    .font(.system(size: 8, weight: .medium))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        
                        Spacer()
                    }
                }

                if hasNotification && name != "Bingham, 28" {
                    VStack {
                        HStack {
                            HStack(spacing: 4) {
                                Text("📣")
                                    .font(.system(size: 8))
                                Text("They made a move!")
                                    .font(.system(size: 8, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.black)
                            .cornerRadius(20)
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 12)
                        Spacer()
                    }
                }
                
                VStack {
                    Spacer()
                    VStack(spacing: 12) {
                        Text("Tap to answer")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.white.opacity(0.7))
                        
                        VStack(spacing: 8) {
                            Text(name)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(question)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 24)
                }
            }
        }
        .frame(width: !isStackedCard ? 145 : 90, height: 205)
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
                .blur(radius: blur ? 25 : 0)
                .overlay(blur ? Color.black.opacity(0.3) : Color.clear)
                .cornerRadius(20)
                .clipped()
        }
    }
}
