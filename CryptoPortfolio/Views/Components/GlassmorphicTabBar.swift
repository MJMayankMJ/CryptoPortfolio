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
        (icon: "chart.line.uptrend.xyaxis", title: "Analytics"),
        (icon: "arrow.left.arrow.right", title: "Exchange"),
        (icon: "wallet.pass", title: "Assets"),
        (icon: "person", title: "Profile")
    ]
    
    var body: some View {
        ZStack {
            // Main tab bar
            HStack(spacing: 0) {
                ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                    TabButton(
                        icon: tab.icon,
                        title: tab.title,
                        isSelected: selectedTab == index,
                        isAnalytics: index == 0
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedTab = index
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                
                // Add space for plus button when Analytics is selected
                if selectedTab == 0 {
                    Spacer()
                        .frame(width: 70)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(height: 70)
            .background(
                GlassmorphicBackground()
            )
            .cornerRadius(35)
            .padding(.horizontal, 16)
            
            // Plus button - only visible on Analytics tab
            if selectedTab == 0 {
                HStack {
                    Spacer()
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        // Add action
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(Color.cryptoBlue)
                            .frame(width: 56, height: 56)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 2)
                    }
                }
                .padding(.horizontal, 30)
                .offset(y: -8)
            }
        }
    }
}

struct TabButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let isAnalytics: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        }) {
            if isSelected && isAnalytics {
                // Special styling for selected Analytics tab
                HStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text(title)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(Color.cryptoBlue)
                )
            } else if isSelected {
                // Selected state for other tabs
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(Color.cryptoBlue)
                    
                    Text(title)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Color.cryptoBlue)
                }
                .padding(.vertical, 8)
            } else {
                // Unselected state
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(Color.cryptoGray.opacity(0.6))
                    
                    Text(title)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Color.cryptoGray.opacity(0.6))
                }
                .padding(.vertical, 8)
            }
        }
    }
}

struct GlassmorphicBackground: View {
    var body: some View {
        ZStack {
            // Dark background with blur effect
            Capsule()
                .fill(Color.black.opacity(0.8))
                .background(
                    Capsule()
                        .fill(.ultraThinMaterial.opacity(0.3))
                )
            
            // Subtle border
            Capsule()
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.03)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 0.5
                )
        }
    }
}

// Visual Effect Blur for glassmorphism
struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
    }
}

import SwiftUI

struct GlassmorphicTabBar_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedTab = 0
        
        return ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                GlassmorphicTabBar(selectedTab: $selectedTab)
            }
        }
    }
}
