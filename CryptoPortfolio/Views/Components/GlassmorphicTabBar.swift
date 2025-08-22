//
//  GlassmorphicTabBar.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct GlassmorphicTabBar: View {
    @Binding var selectedTab: Int
    
    let tabs = [
        ("chart.line.uptrend.xyaxis", "Analytics"),
        ("arrow.left.arrow.right", "Exchange"),
        ("square.stack.3d.up", "Assets"),
        ("person", "Profile")
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { index in
                TabButton(
                    icon: tabs[index].0,
                    title: tabs[index].1,
                    isSelected: selectedTab == index
                ) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = index
                    }
                }
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(
            GlassmorphicBackground()
        )
        .cornerRadius(25)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}

struct TabButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .white : .gray)
                
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(isSelected ? .white : .gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 4)
            .background(
                isSelected ?
                Color.blue.opacity(0.3) : Color.clear
            )
            .cornerRadius(12)
        }
    }
}

struct GlassmorphicBackground: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial)
                .background(
                    Color.black.opacity(0.8)
                )
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.2), .white.opacity(0.1)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        }
    }
}
