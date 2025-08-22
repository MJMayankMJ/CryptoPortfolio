//
//  PortfolioViewModel.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI
import Combine

class PortfolioViewModel: ObservableObject {
    @Published var portfolio = Portfolio()
    @Published var assets: [Asset] = []
    @Published var recentTransactions: [Transaction] = []
    @Published var graphData: [Double] = []
    
    init() {
        loadMockData()
        generateGraphData()
    }
    
    private func loadMockData() {
        assets = [
            Asset(
                symbol: "BTC",
                name: "Bitcoin",
                amount: 0.015,
                valueINR: 75625.14,
                change24h: 4.2,
                icon: "bitcoinsign.circle.fill"
            ),
            Asset(
                symbol: "ETH",
                name: "Ethereum",
                amount: 2.64,
                valueINR: 179102.50,
                change24h: -2.8,
                icon: "e.circle.fill"
            )
        ]
        
        recentTransactions = [
            Transaction(
                type: .receive,
                date: Date().addingTimeInterval(-3600),
                amount: 0.002126,
                symbol: "BTC",
                valueINR: 10500
            ),
            Transaction(
                type: .send,
                date: Date().addingTimeInterval(-7200),
                amount: 0.003126,
                symbol: "ETH",
                valueINR: 8750
            ),
            Transaction(
                type: .send,
                date: Date().addingTimeInterval(-10800),
                amount: 0.02156,
                symbol: "LTC",
                valueINR: 5200
            )
        ]
    }
    
    private func generateGraphData() {
        graphData = (0..<50).map { _ in
            Double.random(in: 140000...180000)
        }
    }
}

