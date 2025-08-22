//
//  ExchangeViewModel.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//
import SwiftUI
import Combine



class ExchangeViewModel: ObservableObject {
    @Published var sendToken = Token(symbol: "ETH", name: "Ethereum", icon: "e.circle.fill")
    @Published var receiveToken = Token(symbol: "INR", name: "Indian Rupee", icon: "indianrupeesign.circle.fill")
    
    @Published var ethBalance: Double = 2.640
    @Published var inrBalance: Double = 4_65_006.44
    
    let exchangeRate: Double = 178_138.80
    let spread: Double = 0.5
    let gasFee: Double = 422.73
    
    func swapTokens() {
        let temp = sendToken
        sendToken = receiveToken
        receiveToken = temp
    }
    
    func calculateReceiveAmount(from sendAmount: String) -> Double {
        guard let amount = Double(sendAmount) else { return 0 }
        return amount * exchangeRate - gasFee
    }
}
