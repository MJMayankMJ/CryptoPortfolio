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
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent Transactions")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 0) {
                ForEach(transactions.prefix(3)) { transaction in
                    HStack(spacing: 16) {
                        // Icon
                        ZStack {
                            Circle()
                                .fill(Color.cryptoOrange)
                                .frame(width: 44, height: 44)
                            
                            Text("B")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(transaction.type.title)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("1h ago")
                                .font(.system(size: 13))
                                .foregroundColor(Color.cryptoGray)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text(transaction.symbol)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white)
                            
                            Text("+0.002126")
                                .font(.system(size: 13))
                                .foregroundColor(Color.cryptoGreen)
                        }
                    }
                    .padding(.vertical, 12)
                    
                    if transaction.id != transactions.prefix(3).last?.id {
                        Divider()
                            .background(Color.cryptoGray.opacity(0.2))
                    }
                }
            }
            .padding(16)
            .background(Color.cryptoCardBackground)
            .cornerRadius(16)
        }
    }
}


struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockTransactions = [
            Transaction(type: .receive, date: Date(), amount: 0.002126, symbol: "BTC", valueINR: 10500),
            Transaction(type: .send, date: Date().addingTimeInterval(-86400), amount: 0.003126, symbol: "ETH", valueINR: 8750),
            Transaction(type: .receive, date: Date().addingTimeInterval(-172800), amount: 0.02156, symbol: "BTC", valueINR: 5200)
        ]
        
        RecentTransactionsView(transactions: mockTransactions)
            .padding()
            .background(Color.gray.opacity(0.2))
    }
}
