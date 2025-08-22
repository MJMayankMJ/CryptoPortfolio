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
                // Portfolio Card
                PortfolioCardView()
                    .padding(.horizontal)
                    .padding(.top, 60)
                
                // Action Buttons
                HStack(spacing: 12) {
                    ActionButton(icon: "arrow.down", title: "Receive")
                    ActionButton(icon: "arrow.up", title: "Send")
                    ActionButton(icon: "plus", title: "", isAdd: true)
                }
                .padding(.horizontal)
                
                // Transaction List
                VStack(alignment: .leading, spacing: 8) {
                    Text("Transactions")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Text("Last 4 days")
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.7))
                        .padding(.horizontal)
                    
                    ScrollView {
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
        VStack(spacing: 12) {
            Text("INR")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
            
            Text("1,57,342.05")
                .font(.system(size: 42, weight: .bold))
                .foregroundColor(.white)
            
            HStack(spacing: 8) {
                Text("₹1,342")
                    .foregroundColor(.green)
                Text("+9.6%")
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(4)
            }
            .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .overlay(
            HStack {
                Spacer()
                Image(systemName: "flame.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.yellow)
                    .padding(8)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(8)
                    .overlay(
                        Text("flash1729")
                            .font(.system(size: 10))
                            .foregroundColor(.yellow)
                            .offset(x: -60)
                    )
            }
            .padding()
            , alignment: .topTrailing
        )
    }
}

struct ActionButton: View {
    let icon: String
    let title: String
    var isAdd: Bool = false
    
    var body: some View {
        Button(action: {}) {
            if isAdd {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.blue)
                    .clipShape(Circle())
            } else {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                    Text(title)
                        .font(.system(size: 12))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
            }
        }
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Image(systemName: transaction.type == .receive ? "arrow.down" : "arrow.up")
                .font(.system(size: 16))
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(transaction.type.title)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                Text(dateFormatter.string(from: transaction.date))
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text(transaction.symbol)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                Text("+\(String(format: "%.6f", transaction.amount))")
                    .font(.system(size: 12))
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.white.opacity(0.03))
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter
    }
}
