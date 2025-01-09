//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

// Main Content View
struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        myLayout{
            Text("Sample Code")
            Text("Sample Code")
            Text("Sample Code")
        }
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }) {
                Text("HStack")
            }
            Button(action: {
                myLayout = AnyLayout(VStackLayout())
            }) {
                Text("VStack")
            }
        }
        
        HStack {
            Image(systemName: "airplane")
            Text("Flight times: ")
                .layoutPriority(1)      // 우선순위 부여
            Text("London")
        }
        .font(.largeTitle)
        .lineLimit(1)
    }
}


#Preview {
    ContentView()
}
