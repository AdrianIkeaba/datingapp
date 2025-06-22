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
    
    let gradient = LinearGradient(
        colors: [
            Color(red: 0.4157, green: 0.3843, blue: 0.6235),
            Color(red: 0.71, green: 0.60, blue: 0.82)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                Image(profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 62, height: 62)
                    .clipShape(Circle())
                    .foregroundColor(.blue)
                
                // Content
                VStack(alignment: .leading, spacing: 2) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(alignment: .center) {
                                Text(name)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)

                                if let tag = tag {
                                    HStack {
                                        if tag == "New chat" {
                                            Circle()
                                                .fill(Color.white)
                                                .frame(width: 5, height: 5)
                                                .padding(.leading, 8)
                                            Text(tag)
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                                                .padding(.trailing, 8)
                                                .padding(.vertical, 2)
                                        } else {
                                            Text(tag)
                                                .font(.system(size: 10, weight: .medium))
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 2)
                                        }
                                    }
                                    .background(
                                        tag == "New chat"
                                            ? Color(red: 66/255, green: 64/255, blue: 111/255).opacity(0.8)
                                            : Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255).opacity(0.8)
                                    )
                                    .cornerRadius(14)
                                }
                            }

                            if isVoiceMessage {
                                HStack(spacing: 12) {
                                    Image("mic")
                                        .font(.system(size: 17.5))
                                        .foregroundStyle(gradient)

                                    HStack(spacing: 2) {
                                        ForEach(0..<6, id: \.self) { i in
                                            Rectangle()
                                                .frame(width: 2, height: (i % 2 == 0 ? 8 : 12))
                                                .foregroundStyle(gradient)
                                        }
                                    }

                                    if let duration = voiceDuration {
                                        Text(duration)
                                            .font(.system(size: 14))
                                            .fontWeight(.bold)
                                            .foregroundStyle(gradient)
                                    }

                                    Spacer()
                                }
                                .padding(.top, 7)
                            } else {
                                if tag == "Your move" {
                                    Text(message)
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                } else {
                                    Text(message)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(red: 129 / 255, green: 129 / 255, blue: 129 / 255))
                                        .lineLimit(2)
                                }
                            }
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            Text(time)
                                .font(.system(size: 14))
                                .foregroundColor(
                                    time == "Wed"
                                        ? Color(red: 168 / 255, green: 175 / 255, blue: 183 / 255)
                                        : Color(red: 0.4157, green: 0.3843, blue: 0.6235)
                                )

                            if let badge = badge {
                                Image(badge)
                            }
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
