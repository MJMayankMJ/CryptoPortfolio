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
    @StateObject private var animator = GraphAnimator()
    
    var body: some View {
        Chart {
            ForEach(Array(animator.animatedData.enumerated()), id: \.offset) { index, value in
                LineMark(
                    x: .value("Time", index),
                    y: .value("Value", value)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.green, Color.blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .lineStyle(StrokeStyle(lineWidth: 2))
                
                AreaMark(
                    x: .value("Time", index),
                    y: .value("Value", value)
                )
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color.green.opacity(0.3),
                            Color.blue.opacity(0.1)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis {
            AxisMarks(position: .leading) { _ in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                    .foregroundStyle(Color.gray.opacity(0.2))
            }
        }
        .onAppear {
            animator.animate()
        }
        .onChange(of: timeRange) { _ in
            animator.animate()
        }
    }
}

class GraphAnimator: ObservableObject {
    @Published var animatedData: [Double] = []
    private let targetData = (0..<50).map { _ in Double.random(in: 140000...180000) }
    
    func animate() {
        animatedData = Array(repeating: 150000, count: 50)
        
        for i in 0..<50 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.02) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.animatedData[i] = self.targetData[i]
                }
            }
        }
    }
}
