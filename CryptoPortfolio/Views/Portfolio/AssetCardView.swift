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
        HStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(asset.symbol == "BTC" ? Color.cryptoOrange : Color.white)
                    .frame(width: 48, height: 48)
                
                Text(asset.symbol == "BTC" ? "B" : "E")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(asset.symbol == "BTC" ? .white : .black)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(asset.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(asset.symbol)
                    .font(.system(size: 14))
                    .foregroundColor(Color.cryptoGray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("₹ \(asset.symbol == "BTC" ? "75,62,502.14" : "1,79,102.50")")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("\(asset.change24h > 0 ? "+" : "")\(String(format: "%.1f", asset.change24h))%")
                    .font(.system(size: 14))
                    .foregroundColor(asset.change24h > 0 ? Color.cryptoGreen : Color.cryptoRed)
            }
        }
        .padding(16)
        .background(Color.cryptoCardBackground)
        .cornerRadius(16)
    }
}

struct AssetCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            AssetCardView(asset: Asset(
                symbol: "BTC",
                name: "Bitcoin",
                amount: 0.021,
                valueINR: 75625.02,
                change24h: 2.5,
                icon: "B" // Corrected: Added icon property
            ))
            
            AssetCardView(asset: Asset(
                symbol: "ETH",
                name: "Ethereum",
                amount: 0.5,
                valueINR: 89551.25,
                change24h: -1.2,
                icon: "E" // Corrected: Added icon property
            ))
        }
        .padding()
        .background(Color.gray.opacity(0.2)) // Added a background for better viewing
    }
}
