//
//  ContentView.swift
//  OutlineGroupDemo
//
//  Created by 존진 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(carItems, children: \.children) { item in
            CellView(item: item)
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}

struct CellView: View {
    var item: CarInfo
    
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundStyle(.green)
            Text(item.name)
        }
    }
}
