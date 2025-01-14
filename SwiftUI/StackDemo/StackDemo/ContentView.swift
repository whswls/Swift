//
//  ContentView.swift
//  StackDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // alignment 파라미터로 정렬
        VStack(alignment: .trailing) {
            Text("This is some text")
            Text("This is some longer text")
            Text("This is short")
        }
        // 텍스트를 기준으로 정렬하는 옵션, .lastTextBaseline
        HStack(alignment: .lastTextBaseline, spacing: 20) {
            Text("This is some text")
                .font(.largeTitle)
            Text("This is some much longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.green)
                .frame(width: 120, height: 50)
            Rectangle()
                .fill(Color.red)
                .alignmentGuide(.leading,
                                computeValue: { dimensions in dimensions.width / 3 })
                .frame(width: 200, height: 50)
            Rectangle()
                .fill(Color.blue)
                .alignmentGuide(.leading,
                                computeValue: { dimensions in
                    dimensions[.trailing] + 20 })
                .frame(width: 180, height: 50)
        }
    }
}

#Preview {
    ContentView()
}
