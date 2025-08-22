//
//  AssetsView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct AssetsView: View {
    @State private var showExchangeView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color.cryptoBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    // Header
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "bell")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 60)
                    
                    // Portfolio Card
                    PortfolioValueCard()
                        .padding(.horizontal)
                    
                    // Action Buttons
                    HStack(spacing: 20) {
                        ActionCircleButton(
                            icon: "arrow.up",
                            action: {}
                        )
                        
                        // Exchange/Add button - navigates to Exchange screen
                        Button(action: {
                            showExchangeView = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(
                                    Circle()
                                        .fill(Color.cryptoCardBackground)
                                )
                        }
                        .fullScreenCover(isPresented: $showExchangeView) {
                            ExchangeView()
                        }
                        
                        ActionCircleButton(
                            icon: "arrow.down",
                            action: {}
                        )
                    }
                    .padding(.horizontal, 60)
                    
                    // Transaction List
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Transactions")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(Color.cryptoGray)
                            
                            Spacer()
                            
                            Text("Last 4 days")
                                .font(.system(size: 14))
                                .foregroundColor(Color.cryptoGray.opacity(0.6))
                        }
                        .padding(.horizontal)
                        
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                TransactionItem(
                                    type: .receive,
                                    date: "20 March",
                                    symbol: "BTC",
                                    amount: "+0.002126"
                                )
                                
                                TransactionItem(
                                    type: .send,
                                    date: "19 March",
                                    symbol: "ETH",
                                    amount: "+0.003126"
                                )
                                
                                TransactionItem(
                                    type: .send,
                                    date: "18 March",
                                    symbol: "LTC",
                                    amount: "+0.02126"
                                )
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct PortfolioValueCard: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                colors: [
                    Color(hex: "6B5FFF"),
                    Color(hex: "7B61FF").opacity(0.9)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 20) {
                // INR Badge
                HStack {
                    Spacer()
                    
                    Text("INR")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.2))
                        )
                    
                    Spacer()
                }
                .padding(.top, 8)
                
                // Value
                Text("1,57,342.05")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                
                // Change indicators
                HStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Text("₹")
                            .font(.system(size: 16))
                        Text("1,342")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.white.opacity(0.9))
                    
                    Text("+4.6%")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.cryptoGreen)
                }
                .padding(.bottom, 8)
            }
            .padding(.vertical, 24)
        }
        .cornerRadius(24)
    }
}

struct ActionCircleButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(
                    Circle()
                        .fill(Color.cryptoCardBackground)
                )
        }
    }
}

struct TransactionItem: View {
    let type: Transaction.TransactionType
    let date: String
    let symbol: String
    let amount: String
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.cryptoCardBackground)
                    .frame(width: 48, height: 48)
                
                Image(systemName: type == .receive ? "arrow.down" : "arrow.up")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(type.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Text(date)
                    .font(.system(size: 14))
                    .foregroundColor(Color.cryptoGray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(symbol)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Text(amount)
                    .font(.system(size: 14))
                    .foregroundColor(Color.cryptoGreen)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
        .background(Color.cryptoBackground)
    }
}
