//
//  ExchangeFeeView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct ExchangeFeeView: View {
    let rate: Double
    let spread: Double
    let gasFee: Double
    let youWillReceive: Double
    
    var body: some View {
        VStack(spacing: 12) {
            FeeRow(title: "Rate", value: "1 ETH = ₹\(String(format: "%.2f", rate))")
            FeeRow(title: "Spread", value: "\(String(format: "%.1f", spread))%")
            FeeRow(title: "Gas fee", value: "₹\(String(format: "%.2f", gasFee))")
            
            Divider()
                .background(Color.gray.opacity(0.3))
            
            HStack {
                Text("You will receive")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("₹\(String(format: "%.2f", youWillReceive))")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}


struct ExchangeFeeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeFeeView(
            rate: 178138.80,
            spread: 0.5,
            gasFee: 422.73,
            youWillReceive: 177025.42
        )
        .padding()
        .background(Color.black)
    }
}
