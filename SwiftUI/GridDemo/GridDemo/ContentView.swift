//
//  ContentView.swift
//  GridDemo
//
//  Created by 존진 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Grid(alignment: .topLeading, verticalSpacing: 15) {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if(index % 2 == 1) {
                        CellContent(index: index, color: .blue)
                    } else {
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
                ForEach(1..<5, id: \.self) { index in
                    CellContent(index: index, color: .red)
                }
            }
            GridRow {
                ForEach(6..<10, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            GridRow {
                ForEach(11..<15, id: \.self) { index in
                    CellContent(index: index, color: .gray)
                }
            }
            // Grid 뷰를 추가할 수 있음
            CellContent(index: 16, color: .blue)
            // 셀 병합도 가능
            GridRow {
                CellContent(index: 17, color: .yellow)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
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
