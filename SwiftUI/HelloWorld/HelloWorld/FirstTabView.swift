//
//  FirstTapView.swift
//  HelloWorld
//
//  Created by 존진 on 1/13/25.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        @State var title: String = "View One"
        
        Text(title)
            // 화면에 이 뷰가 보여질 때 호출되는 수정자
            .onAppear(perform: {
                print("onAppear triggered")
            })
            // 화면에서 이 뷰가 사라질 때 호출되는 수정자
            .onDisappear(perform: {
                print("onDisappeared triggered")
            })
            .task(priority: .background) {
                print("task executed!!!")
                title = await changeTitle()
            }
    }
    func changeTitle() async -> String {
        do {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        } catch {
            print("Error: \(error)")
            return "View One"
        }
        return "Async task completed"
    }
}

#Preview {
    FirstTabView()
}
