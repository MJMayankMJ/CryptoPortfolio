//
//  TimeRangeSelector.swift
//  CryptoPortfolio
//
//  Created by Mayank Jangid on 8/22/25.
//

import SwiftUI

struct TimeRangeSelector: View {
    @Binding var selected: String
    let ranges = ["1h", "8h", "1d", "1w", "1m", "6m", "1y"]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(ranges, id: \.self) { range in
                Button(action: {
                    withAnimation(.spring(response: 0.3)) {
                        selected = range
                    }
                }) {
                    Text(range)
                        .font(.system(size: 14, weight: selected == range ? .semibold : .regular))
                        .foregroundColor(selected == range ? .white : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(
                            selected == range ? Color.blue.opacity(0.3) : Color.clear
                        )
                        .cornerRadius(8)
                }
            }
        }
        .padding(4)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
