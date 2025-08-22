//
//  PortfolioHeaderView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct PortfolioHeaderView: View {
    let portfolio: Portfolio
    @State private var showingINR = true
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Portfolio Value")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Button(action: {
                    withAnimation {
                        showingINR.toggle()
                    }
                }) {
                    Image(systemName: "arrow.left.arrow.right")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.gray)
                }
                
                Button(action: {}) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            HStack(alignment: .bottom, spacing: 8) {
                if showingINR {
                    Text("₹")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text(String(format: "%.2f", portfolio.totalValueINR))
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Text(String(format: "%.3f", portfolio.totalValueBTC))
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("BTC")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.bottom, 4)
                }
            }
            
            HStack(spacing: 8) {
                Text("₹\(Int(portfolio.changeAmount))")
                    .font(.system(size: 14))
                    .foregroundColor(.green)
                
                Text("+\(String(format: "%.1f", portfolio.change24h))%")
                    .font(.system(size: 14))
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(4)
            }
        }
        .padding(.top, 20)
    }
}
