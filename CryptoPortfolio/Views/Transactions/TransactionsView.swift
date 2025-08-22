//
//  TransactionsView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct TransactionsView: View {
    @State private var transactions: [Transaction] = []
    
    var body: some View {
        ZStack {
            // Background
            Color.cryptoBackground
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Portfolio Card
                PortfolioCardView()
                    .padding(.horizontal)
                    .padding(.top, 60)
                
                // Action Buttons
                HStack(spacing: 16) {
                    ActionButton(
                        icon: "arrow.down",
                        title: "Receive",
                        action: {}
                    )
                    
                    ActionButton(
                        icon: "arrow.up",
                        title: "Send",
                        action: {}
                    )
                    
                    // Plus button
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 56, height: 56)
                            .background(Color.cryptoBlue)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                // Transaction List
                VStack(alignment: .leading, spacing: 12) {
                    Text("Transactions")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.cryptoGray)
                        .padding(.horizontal)
                    
                    Text("Last 4 days")
                        .font(.system(size: 13))
                        .foregroundColor(Color.cryptoGray.opacity(0.6))
                        .padding(.horizontal)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(mockTransactions()) { transaction in
                                TransactionRowView(transaction: transaction)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func mockTransactions() -> [Transaction] {
        return [
            Transaction(type: .receive, date: Date(), amount: 0.002126, symbol: "BTC", valueINR: 10_500),
            Transaction(type: .send, date: Date().addingTimeInterval(-86400), amount: 0.003126, symbol: "ETH", valueINR: 8_750),
            Transaction(type: .send, date: Date().addingTimeInterval(-172800), amount: 0.02156, symbol: "LTC", valueINR: 5_200)
        ]
    }
}

struct PortfolioCardView: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                colors: [
                    Color.cryptoBlue.opacity(0.8),
                    Color.cryptoPurple.opacity(0.6)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(spacing: 16) {
                // Top section with INR and flash badge
                HStack {
                    Text("INR")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white.opacity(0.9))
                    
                    Spacer()
                    
                    // Flash badge
                    HStack(spacing: 8) {
                        Text("flash1729")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(Color.cryptoYellow)
                        
                        Image(systemName: "flame.fill")
                            .font(.system(size: 14))
                            .foregroundColor(Color.cryptoYellow)
                            .padding(6)
                            .background(Color.cryptoYellow.opacity(0.2))
                            .cornerRadius(6)
                    }
                }
                
                // Value
                Text("1,57,342.05")
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(.white)
                
                // Change indicators
                HStack(spacing: 12) {
                    Text("₹1,342")
                        .font(.system(size: 16))
                        .foregroundColor(Color.cryptoGreen)
                    
                    Text("+9.6%")
                        .font(.system(size: 16))
                        .foregroundColor(Color.cryptoGreen)
                }
            }
            .padding(24)
        }
        .cornerRadius(20)
    }
}

struct ActionButton: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color.cryptoCardBackground)
            .cornerRadius(16)
        }
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            Image(systemName: transaction.type == .receive ? "arrow.down" : "arrow.up")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.cryptoCardBackground)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.type.title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                
                Text(formatDate(transaction.date))
                    .font(.system(size: 13))
                    .foregroundColor(Color.cryptoGray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(transaction.symbol)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                
                Text("+\(String(format: "%.6f", transaction.amount))")
                    .font(.system(size: 13))
                    .foregroundColor(Color.cryptoGreen)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
        .background(Color.cryptoBackground)
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}

