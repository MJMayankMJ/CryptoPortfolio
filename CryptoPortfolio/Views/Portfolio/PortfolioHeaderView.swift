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
        VStack(spacing: 12) {
            HStack {
                Text("Portfolio Value")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(Color.cryptoGray)
                
                Button(action: {
                    withAnimation {
                        showingINR.toggle()
                    }
                }) {
                    Image(systemName: "arrow.left.arrow.right")
                        .font(.system(size: 14))
                        .foregroundColor(Color.cryptoGray)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 18))
                        .foregroundColor(Color.cryptoGray)
                }
                
                Button(action: {}) {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 18))
                        .foregroundColor(Color.cryptoGray)
                }
            }
            .padding(.horizontal)
            
            HStack(alignment: .bottom, spacing: 4) {
                Text("₹")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                
                Text("157342.05")
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            HStack(spacing: 12) {
                Text("₹1,342")
                    .font(.system(size: 15))
                    .foregroundColor(Color.cryptoGreen)
                
                Text("+9.6%")
                    .font(.system(size: 15))
                    .foregroundColor(Color.cryptoGreen)
            }
            .padding(.horizontal)
        }
    }
}
struct PortfolioHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioHeaderView(portfolio: Portfolio())
            .padding()
            .background(Color.black)
    }
}
