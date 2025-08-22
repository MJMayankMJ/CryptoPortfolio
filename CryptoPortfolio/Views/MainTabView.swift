//
//  MainTabView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content based on selected tab
            Group {
                switch selectedTab {
                case 0:
                    PortfolioView()
                case 1:
                    ExchangeView()
                case 2:
                    AssetsView()
                case 3:
                    ProfileView()
                default:
                    PortfolioView()
                }
            }
            
            // Custom Tab Bar with conditional plus button
            GlassmorphicTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 10)
        }
        .ignoresSafeArea(.keyboard)
        .preferredColorScheme(.dark)
    }
}

// Placeholder views for Assets and Profile
//struct AssetsView: View {
//    var body: some View {
//        ZStack {
//            Color.cryptoBackground
//                .ignoresSafeArea()
//            
//            VStack {
//                Text("Assets")
//                    .font(.system(size: 28, weight: .bold))
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding()
//                    .padding(.top, 60)
//                
//                Spacer()
//            }
//        }
//    }
//}

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.cryptoBackground
                .ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 60)
                
                Spacer()
            }
        }
    }
}
