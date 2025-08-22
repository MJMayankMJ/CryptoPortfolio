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
            TabView(selection: $selectedTab) {
                PortfolioView()
                    .tag(0)
                
                ExchangeView()
                    .tag(1)
                
                TransactionsView()
                    .tag(2)
                
                Text("Profile")
                    .tag(3)
            }
            
            GlassmorphicTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
    }
}
