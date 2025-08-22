//
//  PortfolioGraphView.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI
import Charts

struct PortfolioGraphView: View {
    let timeRange: String
    @State private var animatedData: [Double] = []
    
    let mockData = (0..<50).map { _ in Double.random(in: 140000...180000) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Date and value indicator
            HStack {
                Text("24 March")
                    .font(.system(size: 14))
                    .foregroundColor(Color.cryptoGray)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Text("₹ 1,42,340")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Circle()
                        .fill(Color.cryptoGreen)
                        .frame(width: 8, height: 8)
                }
            }
            
            // Chart
            Chart {
                ForEach(Array(animatedData.enumerated()), id: \.offset) { index, value in
                    LineMark(
                        x: .value("Time", index),
                        y: .value("Value", value)
                    )
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.cryptoGreen, Color.cryptoBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .lineStyle(StrokeStyle(lineWidth: 2.5))
                    
                    AreaMark(
                        x: .value("Time", index),
                        y: .value("Value", value)
                    )
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color.cryptoGreen.opacity(0.2),
                                Color.cryptoBlue.opacity(0.05)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 180)
        }
        .onAppear {
            animateData()
        }
        .onChange(of: timeRange) {
            animateData()
        }
    }
    
    private func animateData() {
        animatedData = []
        for i in 0..<mockData.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.01) {
                withAnimation(.easeInOut(duration: 0.05)) {
                    animatedData.append(mockData[i])
                }
            }
        }
    }
}

struct PortfolioGraphView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioGraphView(timeRange: "1d")
            .padding()
            .background(Color.black)
    }
}
