//
//  RecentTransactionsView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct RecentTransactionsView: View {
    let transactions: [Transaction]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 8) {
                ForEach(transactions.prefix(3)) { transaction in
                    HStack {
                        // Transaction Type Icon
                        ZStack {
                            Circle()
                                .fill(transaction.type == .receive ?
                                      Color.green.opacity(0.2) : Color.red.opacity(0.2))
                                .frame(width: 36, height: 36)
                            
                            Image(systemName: transaction.type == .receive ?
                                  "arrow.down.left" : "arrow.up.right")
                                .font(.system(size: 14))
                                .foregroundColor(transaction.type == .receive ? .green : .red)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(transaction.type.title)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text(timeAgo(from: transaction.date))
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text(transaction.symbol)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("\(transaction.type == .receive ? "+" : "-")\(String(format: "%.6f", transaction.amount))")
                                .font(.system(size: 12))
                                .foregroundColor(transaction.type == .receive ? .green : .red)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    func timeAgo(from date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        let hours = Int(interval / 3600)
        if hours < 1 {
            return "Just now"
        } else if hours < 24 {
            return "\(hours)h ago"
        } else {
            return "\(hours / 24)d ago"
        }
    }
}
