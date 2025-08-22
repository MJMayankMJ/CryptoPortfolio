//
//  PortfolioView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct PortfolioView: View {
    @StateObject private var viewModel = PortfolioViewModel()
    @State private var selectedTimeRange = "1d"
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [
                    Color(hex: "1a1a2e"),
                    Color(hex: "0f0f1e")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Portfolio Header
                    PortfolioHeaderView(portfolio: viewModel.portfolio)
                    
                    // Time Range Selector
                    TimeRangeSelector(selected: $selectedTimeRange)
                    
                    // Graph
                    PortfolioGraphView(timeRange: selectedTimeRange)
                        .frame(height: 200)
                        .padding(.horizontal)
                    
                    // Asset Cards
                    VStack(spacing: 12) {
                        ForEach(viewModel.assets) { asset in
                            AssetCardView(asset: asset)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Recent Transactions
                    RecentTransactionsView(transactions: viewModel.recentTransactions)
                        .padding(.horizontal)
                    
                    Spacer(minLength: 100)
                }
            }
        }
    }
}
