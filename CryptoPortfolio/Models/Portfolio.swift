//
//  Portfolio.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import Foundation

struct Portfolio {
    let totalValueINR: Double = 1_57_342.05
    let totalValueBTC: Double = 0.015
    let change24h: Double = 9.6
    let changeAmount: Double = 1342
}

struct Asset: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let amount: Double
    let valueINR: Double
    let change24h: Double
    let icon: String
}

struct Transaction: Identifiable {
    let id = UUID()
    let type: TransactionType
    let date: Date
    let amount: Double
    let symbol: String
    let valueINR: Double
    
    enum TransactionType {
        case receive, send
        
        var title: String {
            switch self {
            case .receive: return "Receive"
            case .send: return "Send"
            }
        }
    }
}
