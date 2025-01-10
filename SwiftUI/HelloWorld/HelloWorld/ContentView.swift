//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black , .red , .green , .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            VStack {
                Spacer()        // 가변적 공간
                Text("Hello, world!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation))
                // 5초 동안 애니메이션 실행
                    .animation(.easeInOut(duration: 5), value: rotation)
                    .foregroundStyle(colors[colorIndex])
                Spacer()
                Divider()
                Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                    .padding()
                TextField("Enter text here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Picker(selection: $colorIndex, label: Text("Color")) {
                    ForEach (0 ..< colornames.count, id:\.self) { color in
                        Text(colornames[color])
                            .foregroundColor(colors[color])
                    }
                }
                .pickerStyle(.wheel)
                .padding()
            }
        }
    }
}
let name = { () -> Void in
    print("Hello!")
}


#Preview {
    ContentView()
}
