//
//  PortfolioView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI
import Charts

struct PortfolioView: View {
    @StateObject private var viewModel = PortfolioViewModel()
    @State private var selectedTimeRange = "1d"
    
    var body: some View {
        ZStack {
            // Background gradient
            Color.cryptoBackground
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    // Portfolio Header with Gradient Card
                    PortfolioHeaderCard(portfolio: viewModel.portfolio)
                        .padding(.horizontal)
                        .padding(.top, 60)
                    
                    // Time Range Selector
                    TimeRangeSelector(selected: $selectedTimeRange)
                        .padding(.horizontal)
                    
                    // Graph
                    PortfolioGraphView(timeRange: selectedTimeRange)
                        .frame(height: 220)
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

struct PortfolioHeaderCard: View {
    let portfolio: Portfolio
    @State private var showingINR = true
    
    var body: some View {
        ZStack {
            // Blue gradient background card
            LinearGradient(
                colors: [
                    Color(hex: "4A69FF"),
                    Color(hex: "6B4FFF").opacity(0.8)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            
            VStack(spacing: 16) {
                // Top row with Portfolio Value and buttons
                HStack {
                    HStack(spacing: 8) {
                        Text("Portfolio Value")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Button(action: {
                            withAnimation {
                                showingINR.toggle()
                            }
                        }) {
                            Image(systemName: "arrow.left.arrow.right")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    
                    Spacer()
                    
                    // Icon buttons in dark pill
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            Image(systemName: "camera.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Button(action: {}) {
                            Text("B")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(20)
                }
                
                // Value
                HStack(alignment: .bottom, spacing: 4) {
                    Text("₹")
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text("1,57,342.05")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding(20)
        }
        .frame(height: 140)
    }
}







