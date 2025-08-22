//
//  AssetCardView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct AssetCardView: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            // Icon
            Image(systemName: asset.icon)
                .font(.system(size: 32))
                .foregroundColor(.orange)
                .frame(width: 48, height: 48)
                .background(Color.orange.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(asset.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Text(asset.symbol)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("₹ \(String(format: "%.2f", asset.valueINR))")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                HStack(spacing: 4) {
                    Image(systemName: asset.change24h > 0 ? "arrow.up.right" : "arrow.down.right")
                        .font(.system(size: 10))
                    
                    Text("\(asset.change24h > 0 ? "+" : "")\(String(format: "%.1f", asset.change24h))%")
                        .font(.system(size: 14))
                }
                .foregroundColor(asset.change24h > 0 ? .green : .red)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
