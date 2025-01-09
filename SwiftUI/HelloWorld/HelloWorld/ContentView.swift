//
//  ContentView.swift
//  HelloWorld
//
//  Created by 존진 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        Text("Hello World")
            .font(.largeTitle)
            .border(Color.black)
            //.frame(width: 300, height: 100, alignment: .center)
            //.frame(minWidth: 100, maxWidth: 300,
            //      minHeight: 100, maxHeight: 100,
            //      alignment: .center)
            .frame(minWidth: 0, maxWidth: .infinity,
                   minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .ignoresSafeArea(.all)      // 전체 화면을 쓸 수 있게 해 주는 생성자
    }
}


#Preview {
    ContentView()
}
