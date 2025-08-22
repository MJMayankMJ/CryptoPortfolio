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
                        .foregroundColor(selected == range ? .white : Color.cryptoGray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(
                            selected == range ?
                            Color.cryptoBlue : Color.clear
                        )
                        .cornerRadius(8)
                }
            }
        }
        .padding(3)
        .background(Color.cryptoCardBackground)
        .cornerRadius(12)
    }
}

struct TimeRangeSelector_Previews: PreviewProvider {
    static var previews: some View {
        // Create a state variable to hold the selected range
        @State var selectedRange = "1d"
        
        return ZStack {
            Color.cryptoBackground.ignoresSafeArea()
            TimeRangeSelector(selected: $selectedRange)
                .padding()
        }
    }
}
