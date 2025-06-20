//
//  ChatRow.swift
//  DatingApp
//
//  Created by GHØβT on 20/06/2025.
//

import SwiftUI

struct ChatRow: View {
    let name: String
    let message: String
    let time: String
    let profileImage: String
    let isVoiceMessage: Bool
    let voiceDuration: String?
    let badge: String?
    let tag: String?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.blue)
                
                // Content
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        if let tag = tag {
                            HStack {
                                if (tag == "New chat") {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 8, height: 8)
                                        .padding(.leading, 8)
                                    Text(tag)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.trailing, 8)
                                        .padding(.vertical, 4)
                                } else {
                                    Text(tag)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                }
                            }
                            .background(
                                tag == "New chat" ? Color(red: 0.4157, green: 0.3843, blue: 0.6235) : Color.gray.opacity(0.4)
                            )
                            .cornerRadius(14)
                        }
                        
                        Spacer()
                        
                        if (time == "Wed") {
                            Text(time)
                                .font(.system(size: 14))
                                .foregroundColor(Color.white.opacity(0.8))
                        } else {
                            Text(time)
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 0.4157, green: 0.3843, blue: 0.6235))
                        }
                        
                        if let badge = badge {
                            ZStack {
                                Circle()
                                    .fill(Color(red: 106/255.0, green: 98/255.0, blue: 159/255.0))
                                    .frame(width: 20, height: 20)
                                
                                Text(badge)
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    if isVoiceMessage {
                        HStack(spacing: 12) {
                            Image("mic")
                                .font(.system(size: 14))
                                .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.62))
                            
                            HStack(spacing: 2) {
                                ForEach(0..<6, id: \.self) { i in
                                    Rectangle()
                                        .fill(Color(red: 0.71, green: 0.60, blue: 0.82))
                                        .frame(width: 2, height: (i % 2 == 0 ? 8 : 12))                                }
                            }
                            
                            if let duration = voiceDuration {
                                Text(duration)
                                    .font(.system(size: 14))
                                    .fontWeight(Font.Weight.bold)
                                    .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.62))
                            }
                            
                            Spacer()
                        }
                    } else {
                        if (tag == "Your move") {
                            Text(message)
                                .font(.system(size: 15))
                                .fontWeight(Font.Weight.bold)
                                .foregroundColor(.white)
                                .lineLimit(2)
                        } else {
                            Text(message)
                                .font(.system(size: 15))
                                .foregroundColor(.white.opacity(0.8))
                                .lineLimit(2)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            
            Divider()
                .background(Color.white.opacity(0.2))
                .padding(.horizontal, 20)
                .padding(.leading, 50)
        }
        .background(Color.black.opacity(0.3))
    }
}
