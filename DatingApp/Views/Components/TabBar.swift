//
//  TabBar.swift
//  DatingApp
//
//  Created by GHØβT on 20/06/2025.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            TabBarItem(
                icon: "cards",
                title: "Cards",
                isSelected: selectedTab == 0,
                isSelectedIcon: "card_selected",
                badge: nil
            ) {
                selectedTab = 0
            }
            
            Spacer()
            
            TabBarItem(
                icon: "bonfire",
                title: "Bonfire",
                isSelected: selectedTab == 1,
                isSelectedIcon: "bonfire_selected",
                badge: nil
            ) {
                selectedTab = 1
            }
            
            Spacer()
            
            TabBarItem(
                icon: "chat",
                title: "Matches",
                isSelected: selectedTab == 2,
                isSelectedIcon: "chat_selected",
                badge: nil
            ) {
                selectedTab = 2
            }
            
            Spacer()
            
            TabBarItem(
                icon: "profile",
                title: "Profile",
                isSelected: selectedTab == 3,
                isSelectedIcon: "profile",
                badge: nil
            ) {
                selectedTab = 3
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 12)
        .background(Color(red: 15/255, green: 17/255, blue: 21/255))
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: -5)
    }
}


struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let isSelectedIcon: String
    let badge: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    if isSelected {
                        Image(isSelectedIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                    } else {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                    }
                }
                
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(isSelected ? Color(red: 106/255.0, green: 98/255.0, blue: 159/255.0) : .white.opacity(0.6))
            }
        }
    }
}
