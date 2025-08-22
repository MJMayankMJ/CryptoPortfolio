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
            LinearGradient(
                colors: [
                    Color(hex: "1a1a2e"),
                    Color(hex: "0f0f1e")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                Text("Exchange")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 60)
                
                // Exchange Card
                VStack(spacing: 0) {
                    // Send Section
                    TokenInputSection(
                        title: "Send",
                        token: viewModel.sendToken,
                        amount: $sendAmount,
                        balance: viewModel.ethBalance
                    )
                    
                    // Swap Button
                    Button(action: {
                        withAnimation {
                            viewModel.swapTokens()
                        }
                    }) {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding(.vertical, -22)
                    .zIndex(1)
                    
                    // Receive Section
                    TokenInputSection(
                        title: "Receive",
                        token: viewModel.receiveToken,
                        amount: $receiveAmount,
                        balance: viewModel.inrBalance,
                        isReceive: true
                    )
                }
                .background(Color.black.opacity(0.3))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Fee Details
                ExchangeFeeView(
                    rate: viewModel.exchangeRate,
                    spread: viewModel.spread,
                    gasFee: viewModel.gasFee,
                    youWillReceive: viewModel.calculateReceiveAmount(from: sendAmount)
                )
                .padding(.horizontal)
                
                // Exchange Button
                Button(action: {
                    // Exchange action
                }) {
                    Text("Exchange")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .cornerRadius(12)
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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack {
                // Token Selector
                HStack(spacing: 8) {
                    Image(systemName: token.icon)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    
                    Text(token.symbol)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Amount Input
                TextField("0", text: amount)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .disabled(isReceive)
            }
            
            HStack {
                Text("Balance")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Text(String(format: "%.6f", balance))
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
        .padding()
        .background(
            isReceive ? Color.blue.opacity(0.1) : Color.clear
        )
        .cornerRadius(12)
    }
}
