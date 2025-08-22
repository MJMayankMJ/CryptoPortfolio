//
//  ExchangeView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct ExchangeView: View {
    @StateObject private var viewModel = ExchangeViewModel()
    @State private var sendAmount = ""
    @State private var receiveAmount = ""
    
    var body: some View {
        ZStack {
            // Background
            Color.cryptoBackground
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text("Exchange")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 60)
                
                // Exchange Card
                VStack(spacing: 0) {
                    // Send Section
                    TokenInputSection(
                        title: "Send",
                        token: viewModel.sendToken,
                        amount: $sendAmount,
                        balance: viewModel.ethBalance,
                        isINR: false
                    )
                    
                    // Swap Button
                    Button(action: {
                        withAnimation {
                            viewModel.swapTokens()
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.cryptoBlue)
                                .frame(width: 48, height: 48)
                            
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, -24)
                    .zIndex(1)
                    
                    // Receive Section
                    TokenInputSection(
                        title: "Receive",
                        token: viewModel.receiveToken,
                        amount: $receiveAmount,
                        balance: viewModel.inrBalance,
                        isReceive: true,
                        isINR: true
                    )
                }
                .background(Color.cryptoCardBackground)
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Fee Details
                VStack(spacing: 16) {
                    FeeRow(
                        title: "Rate",
                        value: "1 ETH = ₹178138.80"
                    )
                    
                    FeeRow(
                        title: "Spread",
                        value: "0.5%"
                    )
                    
                    FeeRow(
                        title: "Gas fee",
                        value: "₹422.73"
                    )
                    
                    Divider()
                        .background(Color.cryptoGray.opacity(0.3))
                    
                    HStack {
                        Text("You will receive")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color.cryptoGray)
                        
                        Spacer()
                        
                        Text("₹0.00")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .padding(20)
                .background(Color.cryptoCardBackground)
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Exchange Button
                Button(action: {
                    // Exchange action
                }) {
                    Text("Exchange")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.cryptoBlue)
                        .cornerRadius(16)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

struct TokenInputSection: View {
    let title: String
    let token: Token
    let amount: Binding<String>
    let balance: Double
    var isReceive: Bool = false
    var isINR: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(Color.cryptoGray)
            
            HStack(spacing: 12) {
                // Token Selector
                HStack(spacing: 8) {
                    if isINR {
                        Text("₹")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                    } else {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 32, height: 32)
                            
                            Text("E")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.cryptoBackground)
                        }
                    }
                    
                    Text(token.symbol)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: 14))
                        .foregroundColor(Color.cryptoGray)
                }
                
                Spacer()
                
                // Amount Input
                TextField("0", text: amount)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .disabled(isReceive)
                    .placeholder(when: amount.wrappedValue.isEmpty) {
                        Text("0")
                            .foregroundColor(Color.cryptoGray)
                            .font(.system(size: 28, weight: .semibold))
                    }
            }
            
            HStack {
                Text("Balance")
                    .font(.system(size: 13))
                    .foregroundColor(Color.cryptoGray.opacity(0.7))
                
                Text(isINR ? String(format: "%.2f", balance) : String(format: "%.6f", balance))
                    .font(.system(size: 13))
                    .foregroundColor(Color.cryptoGray.opacity(0.7))
                
                Spacer()
            }
        }
        .padding(20)
    }
}

struct FeeRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(Color.cryptoGray)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

// Extension for placeholder modifier
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .trailing,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
