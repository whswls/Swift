//
//  ContentView.swift
//  GridDemo
//
//  Created by 존진 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [ GridItem(.fixed(100)),
                              GridItem(.adaptive(minimum: 50)),
                              GridItem(.fixed(100)) ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyVGrid(columns: gridItems, spacing: 5) {
                ForEach((0...88), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CellContent: View {
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
            .font(.system(.largeTitle))
    }
}